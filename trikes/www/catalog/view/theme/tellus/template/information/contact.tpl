<?php
$kuler = Kuler::getInstance();
?>
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
      <?php if ($kuler->getSkinOption('show_google_map')) { ?>
      <div id="google-map" style="margin: 0 -100% 40px;">
        <div id="map" style="width: 100%; height: 400px;"></div>
        <script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
        <script>
          Kuler.latitude = <?php echo json_encode($kuler->getSkinOption('latitude')); ?>;
          Kuler.longitude = <?php echo json_encode($kuler->getSkinOption('longitude')); ?>;
          Kuler.map_type = <?php echo json_encode($kuler->getSkinOption('map_type')); ?>;

          (function () {
            jQuery(document).ready(function ($) {
              var map_canvas = document.getElementById('map');
              var map_options = {
                center: new google.maps.LatLng(Kuler.latitude, Kuler.longitude),
                zoom: 8,
                mapTypeId: google.maps.MapTypeId[Kuler.map_type]
              }
              var map = new google.maps.Map(map_canvas, map_options);
              map.setZoom(15);

              var latLng = new google.maps.LatLng(Kuler.latitude, Kuler.longitude);
              var image = new google.maps.MarkerImage(
                'catalog/view/theme/' + Kuler.theme + '/image/map-marker.png',
                new google.maps.Size(65, 72),
                new google.maps.Point(0,0),
                new google.maps.Point(30, 76)
              );

              var marker = new google.maps.Marker({
                position: latLng,
                map: map,
                icon: image
              });
            });

          })();
        </script>
      </div>
      <?php } ?>
      <div class="row">
        <div class="col-sm-9">
          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
            <fieldset>
              <div class="form-group required">
                <div class="col-sm-12">
                  <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" placeholder="<?php echo $entry_name; ?>" />
                  <?php if ($error_name) { ?>
                  <div class="text-danger"><?php echo $error_name; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <div class="col-sm-12">
                  <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" placeholder="<?php echo $entry_email; ?>" />
                  <?php if ($error_email) { ?>
                  <div class="text-danger"><?php echo $error_email; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <div class="col-sm-12">
                  <textarea name="enquiry" rows="10" id="input-enquiry" class="form-control" placeholder="<?php echo $entry_enquiry; ?>"><?php echo $enquiry; ?></textarea>
                  <?php if ($error_enquiry) { ?>
                  <div class="text-danger"><?php echo $error_enquiry; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <div class="col-sm-12">
                  <input type="text" name="captcha" id="input-captcha" class="form-control" placeholder="<?php echo $entry_captcha; ?>" />
                </div>
              </div>
              <div class="form-group">
                <div class="col-sm-12">
                  <img src="index.php?route=tool/captcha" alt="" />
                  <?php if ($error_captcha) { ?>
                  <div class="text-danger"><?php echo $error_captcha; ?></div>
                  <?php } ?>
                </div>
              </div>
            </fieldset>
            <div class="buttons">
              <div class="pull-right">
                <button class="btn" type="submit"><span><?php echo $button_submit; ?></span></button>
              </div>
            </div>
          </form>
        </div>
        <div class="col-sm-3" style="color: #777;">
          <div style="margin-bottom:40px;">
            <h3 class="row-heading"><?php echo $text_location; ?></h3>
            <br/>
            <strong><?php echo $store; ?></strong><br />
            <?php if ($image) { ?>
            <img src="<?php echo $image; ?>" alt="<?php echo $store; ?>" title="<?php echo $store; ?>" class="img-thumbnail" />
            <?php } ?>
            <address>
              <?php echo $address; ?>
            </address>
            <?php if ($geocode) { ?>
            <a href="https://maps.google.com/maps?q=<?php echo urlencode($geocode); ?>&hl=en&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
            <?php } ?>
            <?php if ($open) { ?>
              <strong><?php echo $text_open; ?></strong><br />
              <?php echo $open; ?><br />
              <br />
              <?php } ?>
              <?php if ($comment) { ?>
              <strong><?php echo $text_comment; ?></strong><br />
              <?php echo $comment; ?>
            <?php } ?>
            <?php if ($kuler->getSkinOption('show_custom_information')) { ?>
            <div class="col-sm-12 custom">
              <?php echo $kuler->translate($kuler->getSkinOption('custom_information')); ?>
            </div>
            <?php } ?>
          </div>
          <div style="margin-bottom:40px;">
            <h3 class="row-heading"><?php echo $text_telephone; ?></h3>
            <br/>
            <?php echo $telephone; ?><br />
            <?php if ($fax) { ?>
            <b><?php echo $text_fax; ?></b>
            <?php echo $fax; ?>
            <?php } ?>
          </div>
          <?php if ($locations) { ?>
          <h3 class="row-heading"><?php echo $text_store; ?></h3>
          <div class="panel-group" id="accordion">
            <?php foreach ($locations as $location) { ?>
            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 class="panel-title"><a href="#collapse-location<?php echo $location['location_id']; ?>" class="accordion-toggle" data-toggle="collapse" data-parent="#accordion"><?php echo $location['name']; ?> <i class="fa fa-caret-down"></i></a></h4>
              </div>
              <div class="panel-collapse collapse" id="collapse-location<?php echo $location['location_id']; ?>">
                <div class="panel-body">
                  <div class="row">
                    <?php if ($location['image']) { ?>
                    <div class="col-sm-4"><img src="<?php echo $location['image']; ?>" alt="<?php echo $location['name']; ?>" title="<?php echo $location['name']; ?>" class="img-thumbnail" /></div>
                    <?php } ?>
                    <div class="col-sm-4"><strong><?php echo $location['name']; ?></strong><br />
                      <address>
                        <?php echo $location['address']; ?>
                      </address>
                      <?php if ($location['geocode']) { ?>
                      <a href="https://maps.google.com/maps?q=<?php echo urlencode($location['geocode']); ?>&hl=en&t=m&z=15" target="_blank" class="btn btn-info"><i class="fa fa-map-marker"></i> <?php echo $button_map; ?></a>
                      <?php } ?>
                    </div>
                    <div class="col-sm-4"> <strong><?php echo $text_telephone; ?></strong><br>
                      <?php echo $location['telephone']; ?><br />
                      <br />
                      <?php if ($location['fax']) { ?>
                      <strong><?php echo $text_fax; ?></strong><br>
                      <?php echo $location['fax']; ?>
                      <?php } ?>
                    </div>
                    <div class="col-sm-4">
                      <?php if ($location['open']) { ?>
                      <strong><?php echo $text_open; ?></strong><br />
                      <?php echo $location['open']; ?><br />
                      <br />
                      <?php } ?>
                      <?php if ($location['comment']) { ?>
                      <strong><?php echo $text_comment; ?></strong><br />
                      <?php echo $location['comment']; ?>
                      <?php } ?>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <?php } ?>
          </div>
          <?php } ?>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
