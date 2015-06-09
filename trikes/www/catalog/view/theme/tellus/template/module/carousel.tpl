<?php $kuler = Kuler::getInstance();
$kuler->language->load('kuler/tellus');
?>
<div class="container">
<div id="carousel<?php echo $module; ?>" class="carousel-module" dir="ltr">
  <div class="box-heading sep-double"><span><?php echo $kuler->language->get('text_carousel_title'); ?></span></div>
  <div class="owl-carousel">
    <?php foreach ($banners as $banner) { ?>
    <?php if ($banner['link']) { ?>
    <div>
      <a href="<?php echo $banner['link']; ?>">
        <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
      </a>
    </div>
    <?php } else { ?>
    <div>
      <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    </div>
    <?php } ?>
    <?php } ?>
  </div>
</div>
</div>
<script type="text/javascript">
  $(function () {

    var owl = $('#carousel<?php echo $module; ?> .owl-carousel');

    owl.owlCarousel({
      loop:true,
      margin:5,
      dots: true,
      nav:true,
      scrollPerPage: true,
      responsive:{
        0:{
          items:2
        },
        600:{
          items:4
        },
        1000:{
          items:5
        }
      }
    });
  });
</script>