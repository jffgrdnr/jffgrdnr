
	<footer id="mainFooter" class="clearfix">
        <ul id="address">
            <li>6919 Dodge Street</li>
            <li>Omaha NE, 68132</li>
            <li>Fax: 402-933-3020</li>
            <li>Phone: 402-933-3345</li>
        </ul>
        <ul id="social">
            <li><a href="https://www.facebook.com/HighYounes" target="_blank" class="fa fa-facebook"></a></li>
            <li><a href="https://www.linkedin.com/company/taylor-high-&-younes-llc-" target="_blank" class="fa fa-linkedin"></a></li>
            <li><a href="https://twitter.com/hyattorneys" target="_blank" class="fa fa-twitter"></a></li>
        </ul>
    </footer>
</div>
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
$.getScript( "https://cdnjs.cloudflare.com/ajax/libs/masonry/3.3.1/masonry.pkgd.js" )
  .done(function( script, textStatus ) {
    $(".style-clean_style").addClass("grid-item");
    $('.grid').masonry({
      // options

      itemSelector: '.grid-item',
      columnWidth: 4
    });
  })
  .fail(function( jqxhr, settings, exception ) {
    console.log("failed loading masonry");
});
</script>
</body>
</html>