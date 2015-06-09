<?php
class ControllerModuleKulerContactForm extends Controller
{
	protected $common;
	protected $data = array();

	public function __construct($registry)
	{
		parent::__construct($registry);

		$this->load->model('kuler/common');
		$this->common = $this->model_kuler_common;
	}

	public function index($settings)
	{
		if (empty($settings) || !$this->common->isKulerTheme($this->config->get('config_template')))
		{
			return false;
		}

		static $module = 0;

		$this->language->load('module/kuler_contact_form');
		$this->language->load('information/contact');

		$this->data['entry_name'] = trim($this->language->get('entry_name'), ':');
		$this->data['entry_email'] = trim($this->language->get('entry_email'), ':');
		$this->data['entry_enquiry'] = trim($this->language->get('entry_enquiry'), ':');
		$this->data['button_send_message'] = $this->language->get('button_send_message');

		$this->data['settings'] = $settings;

		$this->data['module']   = $module++;
		$this->data['action_url'] = $this->url->link('module/kuler_contact_form/send');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/kuler_contact_form.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/kuler_contact_form.tpl', $this->data);
		} else {
			return $this->load->view('default/template/module/kuler_contact_form.tpl', $this->data);
		}
	}

	public function send()
	{
		$this->language->load('information/contact');

		$errors = array();

		try
		{
			if ($this->request->server['REQUEST_METHOD'] != 'POST')
			{
				throw new Exception('Error');
			}

			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 32))
			{
				$errors['name'] = $this->language->get('error_name');
			}

			if (!preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email']))
			{
				$errors['email'] = $this->language->get('error_email');
			}

			if ((utf8_strlen($this->request->post['enquiry']) < 10) || (utf8_strlen($this->request->post['enquiry']) > 3000))
			{
				$errors['enquiry'] = $this->language->get('error_enquiry');
			}

			if (!empty($errors))
			{
				throw new Exception('field');
			}

			// Send
			$mail = new Mail($this->config->get('config_mail'));
			$mail->setTo($this->config->get('config_email'));
			$mail->setFrom($this->request->post['email']);
			$mail->setSender($this->request->post['name']);
			$mail->setSubject(sprintf($this->language->get('email_subject'), $this->request->post['name']));
			$mail->setText(strip_tags($this->request->post['enquiry']));
			$mail->send();

			$results = array(
				'status' => 1,
				'message' => $this->language->get('text_success')
			);
		}
		catch (Exception $e)
		{
			$results = array(
				'status' => 0,
				'message' => ''
			);

			if ($e->getMessage() == 'field')
			{
				$results['fields'] = $errors;
			}
		}

		$this->response->setOutput(json_encode($results));
	}
}