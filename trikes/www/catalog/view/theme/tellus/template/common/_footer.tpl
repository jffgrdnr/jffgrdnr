<?php $kuler = Kuler::getInstance(); ?>
<?php
  $modules = $kuler->getModules('footer_top');
  if ($modules) {
    echo implode('', $modules);
  }
?>

<?php if ($kuler->getSkinOption('show_newsletter')) { ?>
  <div class="newsletter">
    <div class="container">
      <div class="row">
        <div class="col-xs-12">
          <?php if ($kuler->getSkinOption('show_newsletter_title')) { ?>
            <div class="box-heading"><?php echo $kuler->translate($kuler->getSkinOption('newsletter_title')); ?></div>
          <?php } ?>
          <form id="newsletter-form">
            <p class="newsletter__title"><?php echo $kuler->translate($kuler->getSkinOption('newsletter_description_text')); ?></p>
            <input type="email" id="newsletter-mail" class="newsletter__input"
              placeholder="<?php echo $kuler->translate($kuler->getSkinOption('newsletter_input_text')); ?>"/>
            <button id="newsletter-submit" class="btn newsletter__submit-button">
              <span><?php echo $kuler->translate($kuler->getSkinOption('newsletter_button_text')); ?></span>
            </button>
          </form>
          <script>
            Kuler.show_newsletter = <?php echo json_encode($kuler->getSkinOption('show_newsletter')); ?>;
            Kuler.newsletter_subscribe_link = <?php echo json_encode($kuler->getNewsletterSubscribeLink()); ?>;
          </script>
        </div><!--/newsletter-->
      </div>
    </div>
  </div>
<!--  <script type="text/javascript">-->
<!--    $(function () {-->
<!--      $('.newsletter').parallax("50%", 0.4);-->
<!--    });-->
<!--  </script>-->
<?php } ?>

<footer id="footer" class="footer">
  <div class="container footer__container">
    <!-- ********************************ROW TOP************************************ -->
    <div class="row footer__row--top">
      <div class="container">
        <div class="row">

          <div class="col-md-3 col-sm-6 col-xs-12 wow fadeInLeft" data-wow-offset="100">
            <h3 class="box-heading box-heading--footer">
              <?php echo $text_information; ?>
            </h3>
            <ul class="footer__list">
              <?php foreach ($informations as $information) { ?>
                <li class="footer__list__item">
                  <a href="<?php echo $information['href']; ?>">
                    <?php echo $information['title']; ?>
                  </a>
                </li>
              <?php } ?>
            </ul>
          </div>
          <div class="col-md-3 col-sm-6 col-xs-12 wow fadeInLeft" data-wow-offset="100">
            <h3 class="box-heading box-heading--footer">
              <?php echo $text_service; ?>
            </h3>
            <ul class="footer__list">
              <li class="footer__list__item"><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
              <li class="footer__list__item"><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
              <li class="footer__list__item"><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
            </ul>
          </div>
          <div class="col-md-3 col-sm-6 col-xs-12 wow fadeInRight" data-wow-offset="100">
            <h3 class="box-heading box-heading--footer">
              <?php echo $text_extra; ?>
            </h3>
            <ul class="footer__list">
              <li class="footer__list__item"><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
              <li class="footer__list__item"><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
              <li class="footer__list__item"><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
              <li class="footer__list__item"><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
            </ul>
          </div>
          <div class="col-md-3 col-sm-6 col-xs-12 wow fadeInRight" data-wow-offset="100">
            <h3 class="box-heading box-heading--footer">
              <?php echo $text_account; ?>
            </h3>
            <ul class="footer__list">
              <li class="footer__list__item"><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
              <li class="footer__list__item"><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
              <li class="footer__list__item"><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
              <li class="footer__list__item"><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
            </ul>
          </div>
        </div>
      </div>
    </div><!--/.row-->
    <!-- **********************ROW BOTTOM************************* -->
    <div class="row footer__row--bottom">
      <?php if ($kuler->getSkinOption('show_twitter') && $kuler->getSkinOption('show_facebook')) { ?>
        <?php $class = 'col-md-3 col-sm-6 col-xs-12'; ?>
      <?php } elseif ($kuler->getSkinOption('show_twitter') || $kuler->getSkinOption('show_facebook')) { ?>
        <?php $class = 'col-md-4 col-sm-6 col-xs-12'; ?>
      <?php } else { ?>
        <?php $class = 'col-md-6 col-sm-6 col-xs-12'; ?>
      <?php } ?>
      <div class="<?php echo $class; ?> footer__info wow fadeInLeft" data-wow-offset="100">
        <?php if ($kuler->getSkinOption('show_information')) { ?>
          <?php if ($kuler->getSkinOption('show_information_title')) { ?>
            <h3 class="box-heading box-heading--footer">
              <?php echo $kuler->translate($kuler->getSkinOption('information_title')); ?>
            </h3>
          <?php } ?>
          <p class="footer__info__content"><?php echo $kuler->translate($kuler->getSkinOption('information_content')); ?></p>
        <?php } ?>
        <?php if ($kuler->getSkinOption('show_social_icons')) { ?>
          <div class="social-icons">
            <?php if ($kuler->getSkinOption('show_social_icons_title')) { ?>
              <h3><span><?php echo $kuler->translate($kuler->getSkinOption('social_icon_title')); ?></span></h3>
            <?php } ?>
            <?php if ($social_icons = $kuler->getSocialIcons()) { ?>
              <ul class="social-icons__list ">
                <?php foreach ($social_icons as $social_icon) { ?>
                  <li>
                    <a href="<?php echo $social_icon['link']; ?>" target="_blank" class="<?php echo $social_icon['class']; ?> social-icons__item social-icons__item-style--<?php echo $kuler->getSkinOption('icon_style') ?> social-icons__item-size--<?php echo $kuler->getSkinOption('icon_size'); ?>"></a>
                  </li>
                <?php } ?>
              </ul><!-- /social -->
            <?php } ?>
          </div>
        <?php } ?>
      </div><!-- /information-->

      <?php if ($kuler->getSkinOption('show_twitter') && $kuler->getSkinOption('show_facebook')) { ?>
        <?php $class = 'col-md-3 col-sm-6 col-xs-12'; ?>
      <?php } elseif ($kuler->getSkinOption('show_twitter') || $kuler->getSkinOption('show_facebook')) { ?>
        <?php $class = 'col-md-4 col-sm-6 col-xs-12'; ?>
      <?php } else { ?>
        <?php $class = 'col-md-6 col-sm-6 col-xs-12'; ?>
      <?php } ?>
      <div class="<?php echo $class; ?> wow fadeInRight" data-wow-offset="100">
        <div class="contact contact--footer">
          <?php if ($kuler->getSkinOption('show_contact')) { ?>
            <?php if ($kuler->getSkinOption('show_contact_title')) { ?>
              <h3 class="box-heading box-heading--footer">
                <?php echo $kuler->translate($kuler->getSkinOption('contact_title')); ?>
              </h3>
            <?php } ?>
            <ul class="footer__list--icon footer__list--contact">
              <?php if (($skype1 = $kuler->getSkinOption('skype_1')) || ($skype2 = $kuler->getSkinOption('skype_2'))) { ?>
                <li class="footer__list--icon__item contact__item contact__item--skype">
                  <?php if ($skype1) { ?>
                    <span><?php echo $skype1; ?></span>
                  <?php } ?>
                  <?php if ($skype2 = $kuler->getSkinOption('skype_2') && $skype2) { ?>
                    <span><?php echo $skype2; ?></span>
                  <?php } ?>
                </li>
              <?php } ?>

              <?php if (($email1 = $kuler->getSkinOption('email_1')) || ($email2 = $kuler->getSkinOption('email_2'))) { ?>
                <li class="footer__list--icon__item contact__item contact__item--email">
                  <?php if ($email1) { ?>
                    <span><?php echo $email1; ?></span>
                  <?php } ?>
                  <?php if ($email2 = $kuler->getSkinOption('email_2') && $email2) { ?>
                    <span><?php echo $email2; ?></span>
                  <?php } ?>
                </li>
              <?php } ?>

              <?php if (($mobile1 = $kuler->getSkinOption('mobile_1')) || ($mobile2 = $kuler->getSkinOption('mobile_2'))) { ?>
                <li class="footer__list--icon__item contact__item contact__item--mobile">
                  <?php if ($mobile1) { ?>
                    <span><?php echo $mobile1; ?></span>
                  <?php } ?>
                  <?php if ($mobile2 = $kuler->getSkinOption('mobile_2') && $mobile2) { ?>
                    <span><?php echo $mobile2; ?></span>
                  <?php } ?>
                </li>
              <?php } ?>

              <?php if (($phone1 = $kuler->getSkinOption('phone_1')) || ($phone2 = $kuler->getSkinOption('phone_2'))) { ?>
                <li class="footer__list--icon__item contact__item contact__item--phone">
                  <?php if ($phone1) { ?>
                    <span><?php echo $phone1; ?></span>
                  <?php } ?>
                  <?php if ($phone2 = $kuler->getSkinOption('phone_2') && $phone2) { ?>
                    <span><?php echo $phone2; ?></span>
                  <?php } ?>
                </li>
              <?php } ?>

              <?php if (($fax1 = $kuler->getSkinOption('fax_1')) || ($fax2 = $kuler->getSkinOption('fax_2'))) { ?>
                <li class="footer__list--icon__item contact__item contact__item--fax">
                  <?php if ($fax1) { ?>
                    <span><?php echo $fax1; ?></span>
                  <?php } ?>
                  <?php if ($fax2 = $kuler->getSkinOption('fax_2') && $fax2) { ?>
                    <span><?php echo $fax2; ?></span>
                  <?php } ?>
                </li>
              <?php } ?>
            </ul>
          <?php } ?>
        </div><!--/.contact-->
      </div>
      <?php if ($kuler->getSkinOption('show_twitter')) { ?>
        <?php if ($kuler->getSkinOption('show_twitter') && $kuler->getSkinOption('show_facebook')) { ?>
          <?php $class = 'col-md-3 col-sm-6 col-xs-12'; ?>
        <?php } elseif ($kuler->getSkinOption('show_twitter') || $kuler->getSkinOption('show_facebook')) { ?>
          <?php $class = 'col-md-4 col-sm-6 col-xs-12'; ?>
        <?php } else { ?>
          <?php $class = 'col-md-6 col-sm-6 col-xs-12'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
          <?php if ($kuler->getSkinOption('show_twitter_title')) { ?>
            <h3 class="box-heading box-heading--footer"><span><?php echo $kuler->translate($kuler->getSkinOption('twitter_title')); ?></span></h3>
          <?php } ?>
          <?php echo $kuler->getTwitter(); ?>
        </div>
      <?php } ?>
      <?php if ($kuler->getSkinOption('show_facebook')) { ?>
        <?php if ($kuler->getSkinOption('show_twitter') && $kuler->getSkinOption('show_facebook')) { ?>
          <?php $class = 'col-md-3 col-sm-6 col-xs-12'; ?>
        <?php } elseif ($kuler->getSkinOption('show_twitter') || $kuler->getSkinOption('show_facebook')) { ?>
          <?php $class = 'col-md-4 col-sm-6 col-xs-12'; ?>
        <?php } else { ?>
          <?php $class = 'col-md-6 col-sm-6 col-xs-12'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?> wow fadeInRight animated" data-wow-offset="100">
          <?php if ($kuler->getSkinOption('show_facebook_title')) { ?>
            <h3 class="box-heading box-heading--footer"><span><?php echo $kuler->translate($kuler->getSkinOption('facebook_title')); ?></span></h3>
          <?php } ?>
          <?php echo $kuler->getFacebook(); ?>
        </div>
      <?php } ?>
    </div><!--/.row-->

    <div class="row footer__row--extra">
      <?php
      $modules = $kuler->getModules('footer_extra');
      if ($modules) {
        echo implode('', $modules);
      }
      ?>
    </div>
  </div><!--/.footer__container-->
</footer><!--/footer-->

<?php
  $modules = $kuler->getModules('footer_bottom');
  if ($modules) {
    echo implode('', $modules);
  }
?>

<div id="powered">
  <div class="container">
    <div class="row">
      <div class="col-lg-4 col-md-6 col-sm-5 col-xs-12 copyright">
        <?php if ($kuler->getSkinOption('show_custom_copyright')) { ?>
        <?php echo $kuler->translate($kuler->getSkinOption('custom_copyright')); ?>
        <?php } else { ?>
        <?php echo $powered; ?>
        <?php } ?>
      </div>
      <?php if ($kuler->getSkinOption('show_payment_icons') && $payment_icons = $kuler->getPaymentIcons()) { ?>
      <div class="col-lg-8 col-md-6 col-sm-7 col-xs-12 payment">
        <ul>
          <?php foreach ($payment_icons as $payment_icon) { ?>
          <li><a href="<?php echo $payment_icon['link']; ?>"<?php if ($payment_icon['new_tab']) echo ' target="_blank"'; ?> title="<?php echo $kuler->translate($payment_icon['name']); ?>"><img src="<?php echo $payment_icon['thumb']; ?>" alt="<?php echo $kuler->translate($payment_icon['name']); ?>" /></a></li>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
    </div>
  </div>
</div><!-- /#powered -->

<?php if ($kuler->getSkinOption('login_popup')) { ?>
<?php $kuler->loginPopupInit($data); ?>
<div style="display: none">
  <div id="login-popup" class="login-popup--2-cols popup-container">
    <div class="col-sm-6 left">
      <h2><?php echo _t('text_new_customer'); ?></h2>
      <div class="content">
        <p><b><?php echo _t('text_register'); ?></b></p><br />
        <p><?php echo _t('text_register_account'); ?></p><br />
        <a href="index.php?route=account/register" class="btn"><?php echo _t('button_continue'); ?></a></div>
    </div>
    <div class="col-sm-6 right">
      <h2><?php echo _t('text_returning_customer'); ?></h2>
      <form id="popup-login-form">
        <div class="content">
          <p><?php echo _t('text_i_am_returning_customer'); ?></p>
          <b><?php echo _t('entry_email'); ?></b><br />
          <input type="text" name="email" class="form-control" />
            <br />
            <br />
          <b><?php echo _t('entry_password'); ?></b><br />
          <input type="password" name="password" class="form-control" />
          <br />
          <a href="index.php?route=account/forgotten"><?php echo _t('text_forgotten'); ?></a><br />
          <br />
          <button type="submit" class="btn"><span><?php echo _t('button_login'); ?></span></button>
        </div>
      </form>
    </div>
  </div>
</div>
<?php } ?>

</div>
<!-- /.kl-main-content -->

<?php if ($kuler->getSkinOption('enable_scroll_up')) { ?>
<a class="scrollup"><i class="fa fa-angle-up"></i><?php echo $kuler->translate($kuler->getSkinOption('scroll_up_text')); ?></a>
<?php } ?>
<div class="kl-overlay"></div>
</div>
<!-- /#wrapper -->

<!-- {BODY_SCRIPTS} -->
<!-- Theme Version: <?php echo $kuler->getThemeVersion(); ?> | Kuler Version: <?php echo $kuler->getKulerVersion(); ?> | Skin: <?php echo $kuler->getRootSkin(); ?> -->
<?php if(!$kuler->mobile->isMobile()){ ?>
<script>
  new WOW().init();
</script>
<?php } ?>
<!-- BS:SNIPPET-->
<script type='text/javascript'>//<![CDATA[
document.write("<script async src='//HOST:3000/browser-sync-client.1.3.7.js'><\/script>".replace(/HOST/g, location.hostname));
//]]></script>
<!-- BS:SNIPPET:END-->
</body>
</html>