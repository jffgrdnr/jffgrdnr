<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
	  <?php if ($column_left && $column_right) { ?>
      <?php $class = 'col-lg-6 col-md-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
      <?php $class = 'col-lg-9 col-md-9'; ?>
    <?php } else { ?>
      <?php $class = 'col-lg-12 col-md-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1 class="page-heading"><?php echo $heading_title; ?></h1>
      <div class="row">
        <div class="col-sm-6">
          <ul class="sitemap">
            <?php foreach ($categories as $category_1) { ?>
            <li class="sitemap__item"><a href="<?php echo $category_1['href']; ?>"><?php echo $category_1['name']; ?></a>
              <?php if ($category_1['children']) { ?>
              <ul class="sitemap-sub">
                <?php foreach ($category_1['children'] as $category_2) { ?>
                <li class="sitemap-sub__item"><a href="<?php echo $category_2['href']; ?>"><?php echo $category_2['name']; ?></a>
                  <?php if ($category_2['children']) { ?>
                  <ul>
                    <?php foreach ($category_2['children'] as $category_3) { ?>
                    <li><a href="<?php echo $category_3['href']; ?>"><?php echo $category_3['name']; ?></a></li>
                    <?php } ?>
                  </ul>
                  <?php } ?>
                </li>
                <?php } ?>
              </ul>
              <?php } ?>
            </li>
            <?php } ?>
          </ul>
        </div>
        <div class="col-sm-6">
          <ul class="sitemap">
            <li class="sitemap__item"><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
            <li class="sitemap__item"><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
              <ul class="sitemap-sub">
                <li class="sitemap-sub__item"><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
                <li class="sitemap-sub__item"><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
                <li class="sitemap-sub__item"><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
                <li class="sitemap-sub__item"><a href="<?php echo $history; ?>"><?php echo $text_history; ?></a></li>
                <li class="sitemap-sub__item"><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
              </ul>
            </li>
            <li class="sitemap__item"><a href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a></li>
            <li class="sitemap__item"><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
            <li class="sitemap__item"><a href="<?php echo $search; ?>"><?php echo $text_search; ?></a></li>
            <li class="sitemap__item"><?php echo $text_information; ?>
              <ul class="sitemap-sub">
                <?php foreach ($informations as $information) { ?>
                <li class="sitemap-sub__item"><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                <?php } ?>
                <li class="sitemap-sub__item"><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>