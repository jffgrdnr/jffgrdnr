<?php
class ControllerModuleKulerContactForm extends Controller
{
	/* @var ModelKulerCommon $common */
	protected $common;
	protected $data = array();

	public function __construct($registry)
	{
		parent::__construct($registry);

		$this->load->model('kuler/common');
		$this->common = $this->model_kuler_common;

		ModelKulerCommon::loadTexts($this->language->load('module/kuler_contact_form'));
	}

	public function index()
	{
		$this->load->model('setting/setting');
		$this->load->model('extension/module');

		$this->data['store_id']         = isset($this->request->get['store_id']) ? $this->request->get['store_id']: 0;
		$this->data['token']            = $this->session->data['token'];
		$this->data['extension_code']   = 'kuler_contact_form';
		$this->data['default_module']   = $this->getDefaultModule();
		$this->data['config_language']  = $this->config->get('config_language');

		$this->data['stores']       = $this->common->getStores();
		$this->data['languages']    = $this->common->getLanguages();
		$this->data['layouts']      = $this->common->getLayoutOptions();
		$this->data['positions']    = $this->common->getPositions();

		if (!empty($this->request->get['module_id'])) {
			$module = $this->model_extension_module->getModule($this->request->get['module_id']);
			$module['module_id'] = $this->request->get['module_id'];
			$module['short_code'] = "[kuler_contact_form.{$module['module_id']}]";

			$this->data['modules'] = array(
				$module
			);
		} else {
			$this->data['modules'] = array(
				array(
					'module_id' => 0,
					'name' => 'Contact Form',
					'status' => '1'
				)
			);
		}
		// Prepare modules
		foreach ($this->data['modules'] as &$module)
		{
			if (!empty($module['custom_information']))
			{
				foreach ($this->data['languages'] as $language)
				{
					if (!empty($module['custom_information'][$language['code']]))
					{
						$module['custom_information'][$language['code']] = html_entity_decode($module['custom_information'][$language['code']], ENT_QUOTES, 'UTF-8');
					}
				}
			}
		}

		$this->data['messages']     = ModelKulerCommon::getTexts();

		$this->data['action_url']   = $this->common->createLink('module/kuler_contact_form/save');
		$this->data['cancel_url']   = $this->common->createLink('extension/module');
		$this->data['store_url']    = $this->common->createLink('module/kuler_contact_form');

		// Breadcrumbs
		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		if (!isset($this->request->get['module_id'])) {
			$this->data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/kuler_contact_form', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$this->data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/kuler_contact_form', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);
		}

		$this->document->setTitle(_t('heading_module'));

		$this->common->insertCommonResources();

		$this->document->addScript('view/kuler/js/contact_form.js');

		$this->data['header'] = $this->load->controller('common/header');
		$this->data['column_left'] = $this->load->controller('common/column_left');
		$this->data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/kuler_contact_form.tpl', $this->data));
	}

	public function save()
	{
		try
		{
			if ($this->request->server['REQUEST_METHOD'] != 'POST')
			{
				throw new Exception(_t('error_permission'));
			}

			$this->validate();

			$this->load->model('extension/module');

			$module = $this->request->post['modules'][0];

			if (empty($module['module_id'])) {
				unset($module['module_id']);

				$this->model_extension_module->addModule('kuler_contact_form', $module);

				$is_redirect = true;
				$module_id = $this->db->getLastId();				
			} else {
				$this->model_extension_module->editModule($module['module_id'], $module);

				$is_redirect = false;
				$module_id = $module['module_id'];				
			}
			$result = array(
				'status' => 1,
				'message' => _t('text_success'),
				'redirect' => $is_redirect ? $this->url->link('module/kuler_contact_form', 'module_id=' . $module_id . '&token=' . $this->session->data['token']) : ''
			);
		}
		catch (Exception $e)
		{
			$result = array(
				'status' => 0,
				'message' => $e->getMessage()
			);
		}

		$this->response->setOutput(json_encode($result));
	}

	protected function getDefaultModule()
	{
		return array(
			'sort_order'    => '10',
			'status'        => '1'
		);
	}

	protected function validate()
	{
		if (!$this->user->hasPermission('modify', 'module/kuler_contact_form'))
		{
			throw new Exception(_t('error_permission'));
		}
	}
}