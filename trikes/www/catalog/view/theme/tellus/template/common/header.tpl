<?php
$kuler = Kuler::getInstance();
$theme = $kuler->getTheme();

$kuler->addStyle(array(
  "catalog/view/theme/$theme/stylesheet/bootstrap.min.css",
  "catalog/view/theme/$theme/stylesheet/_grid.css",
  "catalog/view/theme/$theme/stylesheet/stylesheet.css",
  "catalog/view/theme/$theme/stylesheet/animate.min.css",
  "catalog/view/theme/$theme/stylesheet/animsition.min.css",
  "catalog/view/theme/$theme/stylesheet/jquery.mCustomScrollbar.min.css",
  "catalog/view/javascript/font-awesome/css/font-awesome.min.css",
));

$kuler->addScript(array(
  'catalog/view/javascript/jquery/jquery-2.1.1.min.js',
  'catalog/view/javascript/bootstrap/js/bootstrap.min.js',
  'catalog/view/javascript/common.js',
  "catalog/view/theme/$theme/js/lib/jquery.magnific-popup.min.js",
  "catalog/view/theme/$theme/js/lib/main.js",
  "catalog/view/theme/$theme/js/lib/wow.min.js",
  "catalog/view/theme/$theme/js/lib/jquery.animsition.min.js",
  "catalog/view/theme/$theme/js/lib/headroom.min.js",
  "catalog/view/theme/$theme/js/lib/jQuery.headroom.min.js",
  "catalog/view/theme/$theme/js/lib/masonry.pkgd.min.js",
  "catalog/view/theme/$theme/js/utils.js"
));

$kuler->addScript('catalog/view/theme/' . $theme . '/js/lib/jquery.mCustomScrollbar.concat.min.js', true);
$kuler->addScript('catalog/view/theme/' . $theme . '/js/lib/owl.carousel.min.js', true);
?>
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title><?php echo $title; ?></title>
  <base href="<?php echo $base; ?>" />
  <?php if ($description) { ?>
  <meta name="description" content="<?php echo $description; ?>" />
  <?php } ?>
  <?php if ($keywords) { ?>
  <meta name="keywords" content= "<?php echo $keywords; ?>" />
  <?php } ?>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <?php if ($icon) { ?>
  <link href="<?php echo $icon; ?>" rel="icon" />
  <?php } ?>
  <?php foreach ($links as $link) { ?>
  <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
  <?php } ?>
  <!-- {STYLES} -->
  <!-- {SCRIPTS} -->
  <?php echo $google_analytics; ?>
  <?php if($direction == "rtl") { ?>
  <link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $theme ?>/stylesheet/rtl.css" media="screen">
  <?php } ?>
</head>
<body class="<?php echo $class; ?> <?php echo $kuler->getBodyClass(); ?>">
<?php if ($kuler->getSkinOption('show_facebook')) { ?>
<?php echo $kuler->getFacebookScriptCode(); ?>
<?php } ?>
<div id="notification"></div><!--/#notificaton-->

<div id="wrapper">
  <?php
    $modules = $kuler->getModules('header_top');
    if ($modules) {
      echo implode('', $modules);
    }
  ?>

  <div id="top-bar">
    <div class="container">
      <div class="row">
        <!-- <div class="col-md-4 col-xs-12">
          <div class="extra">
            <#?php echo $language; ?>
            <#?php echo $currency; ?>
          </div>
        </div> -->
        <div class="col-md-6 col-xs-12">
          <?php
          if ($kuler->getSkinOption('live_search_status')) {
            include('_live_search.tpl');
          } else {
            echo $search;
          }
          ?>
        </div>
        <div class="col-md-6 col-xs-12 top-bar__links-list">
          <ul class="list-inline">
            <li>
              <a class="top-bar__links-list__link top-bar__links-list__link--wish-list" href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a>
            </li>
            <li class="dropdown">
              <a class="top-bar__links-list__link top-bar__links-list__link--account" data-toggle="dropdown"><?php echo $text_account; ?></a>
              <ul class="dropdown-menu dropdown-menu-right">
                <?php if ($logged) { ?>
                <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                <?php } else { ?>
                <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
                <?php } ?>
              </ul>
            </li>
            <li>
              <a class="top-bar__links-list__link top-bar__links-list__link--cart" href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a>
            </li>
            <li>
              <a class="top-bar__links-list__link top-bar__links-list__link--checkout" href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <!--/#top-bar-->

  <header class="header">
    <div class="container">
      <div class="row main-row clearfix">
        <div id="logo" class="col-md-2 col-xs-12 <?php if(!$kuler->getSkinOption('fixed_header')) { echo 'wow fadeInLeft" data-wow-offset="100'; } ?>">
        <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>">
            <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>"/>
          </a>
          <?php } else { ?>
          <h2><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h2>
          <?php } ?>
        </div>
        <div class="row sub-row clearfix"> <!--/.row -->
        <div class="col-lg-9 col-xs-12">
          <!-- TEST PLACE FOR MENU--CART -->
          <?php
          $modules = $kuler->getModules('kuler_menu');
          if ($modules) {
            echo implode('', $modules);
          } else {
            ?>
            <?php if ($categories) { ?>
              <!-- Normal menu -->
              <nav id="menu" class="navigation">
                <div class="container">
                  <span id="btn-mobile-toggle"><?php echo $kuler->translate($kuler->getSkinOption('mobile_menu_title')); ?></span>
                  <ul class="main-nav">
                    <li class="main-nav__item">
                      <?php if ($kuler->getSkinOption('home_icon_type') == 'icon' && !$kuler->mobile->isMobile()) { ?>
                        <a href="<?php echo $base; ?>" class="fa fa-home">
                          <span data-hover="<?php echo $kuler->language->get('text_home') ?>"><i class="fa fa-home"></i></span>
                        </a>
                      <?php } else { ?>
                        <a href="<?php echo $base; ?>" data-hover="<?php echo $kuler->language->get('text_home') ?>">
                          <?php echo $kuler->language->get('text_home') ?>
                        </a>
                      <?php } ?>
                    </li>
                    <?php foreach ($categories as $category) { ?>
                      <li class="main-nav__item">
                        <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                        <?php if (!empty($category['children'])) { ?>
                          <span class="btn-expand-menu"></span>
                        <?php } ?>
                        <?php if ($category['children']) { ?>
                          <div class="main-nav__secondary-nav">
                            <div class="container">
                              <?php for ($i = 0; $i < count($category['children']);) { ?>
                                <ul>
                                  <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
                                  <?php for (; $i < $j; $i++) { ?>
                                    <?php if (isset($category['children'][$i])) { ?>
                                      <li class="main-nav__secondary-nav__item"><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a>
                                        <?php if (!empty($category['children'][$i]['children'])) { ?>
                                          <?php echo renderSubMenuRecursive($category['children'][$i]['children']); ?>
                                        <?php } ?>
                                      </li>
                                    <?php } ?>
                                  <?php } ?>
                                </ul>
                              <?php } ?>
                            </div>
                          </div>
                        <?php } ?>
                      </li>
                    <?php } ?>
                  </ul>
                </div>
              </nav><!--/.navbar-->
            <?php } ?>
          <?php } ?>
          <!-- /END TEST -->
        </div>
        <div class="col-lg-3 col-xs-12 headerCart">
          <?php echo $cart; ?>
        </div>
      </div><!-- /.row -->
        <div class="col-md-3 col-xs-12 noDisplay">
          <?php $modules = $kuler->getModules('header_extra');
          if ($modules) {
            echo implode('', $modules);
          }
          ?>
        </div>
      </div> <!--/.row -->
    </div><!-- /.container -->
  </header>

  <?php
  function renderSubMenuRecursive($categories) {
    $html = '<ul class="sublevel">';

  foreach ($categories as $category) {
  $parent = !empty($category['children']) ? ' parent' : '';
  $active = !empty($category['active']) ? ' active' : '';
  $html .= sprintf("<li class=\"item$parent $active\"><a href=\"%s\">%s</a>", $category['href'], $category['name']);

  if (!empty($category['children'])) {
  $html .= '<span class="btn-expand-menu"></span>';
  $html .= renderSubMenuRecursive($category['children']);
  }

  $html .= '</li>';
  }

  $html .= '</ul>';

  return $html;
  }
  ?>
  <?php
    $modules = $kuler->getModules('promotion');
    if ($modules) {
      echo implode('', $modules);
    }
  ?>

<div class="kl-main-content">