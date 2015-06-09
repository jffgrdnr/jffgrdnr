/* Layout */
{{#is layout_style 'boxed'}}
@media only screen and (min-width: 100em) {
.boxed #container {
max-width: calc({{maximum_width}} + 30px);
}
.container{
max-width:  {{maximum_width}};
}
}
{{/is}}
/* Custom Notification */
{{#if show_custom_notification}}
#notification {
top: 80px;
z-index: 9999;
opacity: 0;
right: 20px;
width: 320px;
position: fixed;
visibility: hidden;
transition: 0.3s ease-in-out;
-moz-transition: 0.3s ease-in-out;
-webkit-transition: 0.3s ease-in-out;
}
#notification.active {
top: 20px;
opacity: 1;
visibility: visible;
}
{{/if}}

/* Scroll up */
{{#if enable_scroll_up}}
.scrollup {
color: #fff;
cursor: pointer;
z-index: 2;
position: fixed;
right: 30px;
bottom: -50px;
font-size:0;
padding: 10px;
-webkit-transition: all 0.5s cubic-bezier(0.215, 0.61, 0.355, 1);
-moz-transition: all 0.5s cubic-bezier(0.215, 0.61, 0.355, 1);
-o-transition: all 0.5s cubic-bezier(0.215, 0.61, 0.355, 1);
transition: all 0.5s cubic-bezier(0.215, 0.61, 0.355, 1);
}
.scrollup i:before {
font-size: 30px;
margin:0 5px;
}
.scrollup.show {
bottom: 50px;
opacity: 0.8;
}
.scrollup:hover {
color: #fff;
font-size: 15px;
}
{{/if}}

/**************** GENERAL ******************/
{{#if body_container_bg_color}}
body.common-home .kl-main-content,
body[class*="product"] .kl-main-content,
body[class*="module-kbm"] .kl-main-content,
body[class*="module-kuler_filter_result"] .kl-main-content {
background-color:{{body_container_bg_color}}
}
{{/if}}
{{#if body_link_color}}
a,a:visited {
color:{{body_link_color}}
}
.scrollup {
background-color: {{body_link_hover_color}};
}
{{/if}}
{{#if body_link_hover_color}}
a:hover{
color: {{body_link_hover_color}};
}
{{/if}}
{{#if body_bg_image.path}}
body {
background-image: url({{body_bg_image.path}});
{{#if body_bg_image.repeat}}
background-repeat: {{body_bg_image.repeat}};
{{/if}}
{{#if body_bg_image.position}}
background-position: {{body_bg_image.position}};
{{/if}}
{{#if body_bg_image.attachment}}
background-attachment: {{body_bg_image.attachment}};
{{/if}}
}
{{/if}}
{{#if body_font}}
body, #top-bar .btn {
{{#if body_font.font_family}}
  font-family: {{_fontFamily body_font.font_family}};
{{/if}}
{{#if body_font.font_size}}
  font-size: {{body_font.font_size}};
{{/if}}
{{#if body_font.font_weight}}
  font-weight: {{body_font.font_weight}};
{{/if}}
{{#if body_font.font_style}}
  font-style: {{body_font.font_style}};
{{/if}}
{{#if body_font.text_transform}}
  text-transform: {{body_font.text_transform}};
{{/if}}
{{#if body_bg_color}}
  background-color: {{body_bg_color}};
{{/if}}
{{#if body_pattern}}
  background-image: url({{body_pattern}});
{{/if}}
{{#if body_text_color}}
  color: {{body_text_color}};
{{/if}}
}
{{/if}}
{{#if heading_font}}
h1,h2,h3,h4,h5,h6, .box-heading, .page-heading, .row-heading,
.countdown-amount, .product-price, .product-sale {
{{#if heading_font.font_family}}
  font-family: {{_fontFamily heading_font.font_family}};
{{/if}}
{{#if heading_font.font_size}}
  font-size:{{heading_font.font_size}};
{{/if}}
{{#if heading_font.font_style}}
  font-style: {{heading_font.font_style}};
{{/if}}
{{#if heading_font.font_weight}}
  font-weight: {{heading_font.font_weight}};
{{/if}}
{{#if heading_font.text_transform}}
  text-transform: {{heading_font.text_transform}};
{{/if}}
}
{{/if}}
{{#if heading_color}}
h1,h2,h3,h4,h5,h6 {
  color: {{heading_color}};
}
{{/if}}


/***************** TOP BAR STYLE *****************/
{{#if topbar_background_color}}
#top-bar {
 background-color: {{topbar_background_color}};
}
{{/if}}
{{#if topbar_link_color}}
#top-bar a {
 color: {{topbar_link_color}};
}
{{/if}}
{{#if topbar_link_hover_color}}
#top-bar a:hover {
 color: {{topbar_link_hover_color}};
}
{{/if}}
{{#if topbar_text_color}}
#top-bar {
 color: {{topbar_text_color}};
}
{{/if}}


/***************** HEADER STYLE *****************/
.header {
{{#if header_pattern}}
 background-image: url({{header_pattern}});
{{/if}}
}
{{#if header_background_image.path}}
.header {
 background-image: url({{header_background_image.path}});
{{#if header_background_image.repeat}}
 background-repeat: {{header_background_image.repeat}};
{{/if}}
{{#if header_background_image.position}}
 background-position: {{header_background_image.position}};
{{/if}}
{{#if header_background_image.attachment}}
 background-attachment: {{header_background_image.attachment}};
{{/if}}
}
{{/if}}
{{#if header_background_color}}
.header {
{{#if header_background_color}}
 background-color: {{header_background_color}};
{{/if}}
}
{{/if}}
/* Search */
{{#if header_search_color}}
#search input,
#search select {
  color: {{header_search_color}};
}
#search input:-moz-placeholder { color: {{header_search_color}}; }
#search input::-moz-placeholder { color: {{header_search_color}}; }
#search input:-ms-input-placeholder { color: {{header_search_color}}; }
#search input::-webkit-input-placeholder { color: {{header_search_color}}; }
{{/if}}
{{#if header_search_border_color}}
#search input,
#search select {
 border-color: {{header_search_border_color}};
}
{{/if}}
{{#if header_search_bg_color}}
#search input,
#search select {
 background-color: {{header_search_bg_color}};
}
{{/if}}
/* Mini cart */
{{#if header_mini_cart_color}}
.mini-cart__info {
  color: {{header_mini_cart_color}};
}
{{/if}}
{{#if header_mini_cart_bg_color}}
.mini-cart__info {
  background-color: {{header_mini_cart_bg_color}};
}
{{/if}}
{{#if header_mini_cart_border_color}}
.mini-cart__info {
  border-color: {{header_mini_cart_border_color}};
}
{{/if}}
#cart .mini-cart__button {
{{#if header_mini_cart_header_bg_color}}
  background-color: {{header_mini_cart_header_bg_color}};
{{/if}}
{{#if header_mini_cart_header_color}}
  color: {{header_mini_cart_header_color}};
{{/if}}
}
{{#if header_mini_cart_header_border_color}}
.mini-cart #cart-total {
  border-color: {{header_mini_cart_header_border_color}};
}
{{/if}}
#cart .mini-cart__button:hover,
.mini-cart #cart-total:before,
#cart.open .mini-cart__button {
{{#if header_mini_cart_header_hover_bg_color}}
  background-color: {{header_mini_cart_header_hover_bg_color}};
{{/if}}
{{#if header_mini_cart_header_hover_text_color}}
  color: {{header_mini_cart_header_hover_text_color}};
{{/if}}
}
{{#if header_mini_cart_header_hover_border_color}}
.mini-cart #cart-total:hover,
.mini-cart.open #cart-total,
#cart .mini-cart__button:hover #cart-total {
border-color: {{header_mini_cart_header_hover_border_color}};
}
{{/if}}
#cart .mini-cart__view-cart-btn,
#cart .mini-cart__checkout-btn {
{{#if header_mini_cart_button_bg_color}}
  background-color: {{header_mini_cart_button_bg_color}};
{{/if}}
{{#if header_mini_cart_button_text_color}}
  color: {{header_mini_cart_button_text_color}};
{{/if}}
{{#if header_mini_cart_button_border_color}}
  border-color: {{header_mini_cart_button_border_color}}
{{/if}}
}
#cart .mini-cart__view-cart-btn:hover,
#cart .mini-cart__checkout-btn:hover {
{{#if header_mini_cart_button_hover_bg_color}}
  background-color: {{header_mini_cart_button_hover_bg_color}};
{{/if}}
{{#if header_mini_cart_button_hover_text_color}}
  color: {{header_mini_cart_button_hover_text_color}};
{{/if}}
{{#if header_mini_cart_button_hover_border_color}}
  border-color: {{header_mini_cart_button_hover_border_color}}
{{/if}}
}

/***************** MENU **********************/
.navigation {
{{#if menu_bg_color}}
background-color: {{menu_bg_color}};
{{/if}}
}
{{#if menu_border_color}}
.header .sub-row {
border-color: {{menu_border_color}};
}
{{/if}}
{{#if menu_item_hover_bg_color}}
.main-nav__item:hover {
background-color: {{menu_item_hover_bg_color}};
}
{{/if}}
.main-nav__item > a {
{{#if menu_item_color}}
color: {{menu_item_color}};
{{/if}}
}
.main-nav__item:hover > a {
{{#if menu_item_hover_color}}
color: {{menu_item_hover_color}};
{{/if}}
}
{{#if menu_sub_item_color}}
.main-nav__secondary-nav .subcat a {
color: {{menu_sub_item_color}};
}
{{/if}}
{{#if menu_sub_item_hover_color}}
.main-nav__secondary-nav a:hover {
color: {{menu_sub_item_hover_color}}
}
{{/if}}
{{#if menu_font}}
.main-nav__item > a,
.mini-cart #cart-total
{
{{#if menu_font.font_family}}
  font-family: {{_fontFamily menu_font.font_family}};
{{/if}}
{{#if menu_font.font_size}}
  font-size: {{_fontFamily menu_font.font_size}};
{{/if}}
{{#if menu_font.font_weight}}
  font-weight: {{_fontFamily menu_font.font_weight}};
{{/if}}
{{#if menu_font.font_style}}
  font-style: {{_fontFamily menu_font.font_style}};
{{/if}}
{{#if menu_font.text_transform}}
  text-transform: {{_fontFamily menu_font.text_transform}};
{{/if}}
}
{{/if}}

/***************** LANGUAGE - CURRENCY STYLE *****************/
{{#if extra_text_color}}
.extra span,
.extra .dropdown-toggle:after {
  color: {{extra_text_color}};
}
{{/if}}
{{#if extra_link_color}}
.extra #currency .currency-select,
.extra #language .dropdown-menu>li>a {
 color: {{extra_link_color}};
}
{{/if}}
{{#if extra_text_hover_color}}
.extra__currency:hover span,
.extra__language:hover span {
 color: {{extra_text_hover_color}};
}
{{/if}}
{{#if extra_link_hover_color}}
.extra #currency .currency-select:hover,
.extra #language .dropdown-menu>li>a:hover {
 color: {{extra_link_hover_color}};
}
{{/if}}

/***************** FOOTER STYLE *****************/
.footer {
{{#if footer_background_color}}
  background-color:{{footer_background_color}};
{{/if}}
{{#if footer_border_color}}
  border-color: {{footer_border_color}};
{{/if}}
{{#if footer_pattern}}
  background-image: url({{footer_pattern}});
{{/if}}
{{#if footer_text_color}}
  color: {{footer_text_color}};
{{/if}}
}
{{#if footer_background_image.path}}
.footer {
  background-image: url({{footer_background_image.path}});
{{#if footer_background_image.repeat}}
  background-repeat: {{footer_background_image.repeat}};
{{/if}}
{{#if footer_background_image.position}}
  background-position: {{footer_background_image.position}};
{{/if}}
{{#if footer_background_image.attachment}}
  background-attachment: {{footer_background_image.attachment}};
{{/if}}
}
{{/if}}
{{#if footer_text_font}}
.footer, .footer a {
{{#if footer_text_font.font_family}}
  font-family: {{_fontFamily footer_text_font.font_family}};
{{/if}}
{{#if footer_text_font.font_weight}}
  font-weight: {{_fontFamily footer_text_font.font_weight}};
{{/if}}
{{#if footer_text_font.font_style}}
  font-style: {{_fontFamily footer_text_font.font_style}};
{{/if}}
{{#if footer_text_font.text_transform}}
  text-transform: {{_fontFamily footer_text_font.text_transform}};
{{/if}}
}
{{/if}}
{{#if footer_text_hover_color}}
.footer__list__item:hover,
.footer__list--icon__item:hover {
  color: {{footer_text_hover_color}}
}
{{/if}}
{{#if footer_heading_color}}
.footer .box-heading {
  color: {{footer_heading_color}};
}
{{/if}}
{{#if footer_heading_bg_color}}
.footer .box-heading {
background-color: {{footer_heading_bg_color}};
}
{{/if}}
{{#if footer_link_color}}
.footer a{
  color: {{footer_link_color}};
}
{{/if}}
{{#if footer_link_hover_color}}
.footer a:hover {
  color: {{footer_link_hover_color}};
}
{{/if}}
/* Contact Information */
{{#if contact_icon_bg}}
.contact li:before{
  background-color: {{contact_icon_bg}};
}
{{/if}}
{{#if contact_icon_color}}
.contact li:before{
  color: {{contact_icon_color}};
}
{{/if}}
{{#if contact_icon_hover_bg}}
.contact li:hover:before{
  background-color: {{contact_icon_hover_bg}};
}
{{/if}}
{{#if contact_icon_hover_color}}
.contact li:hover:before{
  color: {{contact_icon_hover_color}};
}
{{/if}}

/***************** SOCIAL / NEWSLETTER STYLE *****************/
.social-icons__item:before{
{{#if social_icon_bg}}
  background-color: {{social_icon_bg}};
{{/if}}
{{#if social_icon_color}}
  color: {{social_icon_color}};
{{/if}}
{{#if social_border_color}}
  border-color: {{social_border_color}};
{{/if}}
}

.social-icons__item:hover:before{
{{#if social_icon_hover_bg}}
  background-color: {{social_icon_hover_bg}};
{{/if}}
{{#if social_icon_hover_color}}
  color: {{social_icon_hover_color}};
{{/if}}
{{#if social_border_hover_color}}
  border-color: {{social_border_hover_color}};
{{/if}}
}

{{#if newsletter_bg_color}}
.newsletter {
  background-color: {{newsletter_bg_color}};
}
{{/if}}
{{#if newsletter_color1}}
.newsletter__title {
  color: {{newsletter_color1}}
}
{{/if}}
{{#if newsletter_color2}}
.newsletter__small-description {
  color: {{newsletter_color2}}
}
{{/if}}

.newsletter__input {
{{#if newsletter_input_bg_color}}
  background-color: {{newsletter_input_bg_color}};
{{/if}}
{{#if newsletter_input_border_color}}
  border-color: {{newsletter_input_border_color}};
{{/if}}
{{#if newsletter_input_color}}
  color:  {{newsletter_input_color}};
{{/if}}
}
.newsletter__input:-moz-placeholder { color: {{newsletter_input_color}}; }
.newsletter__input::-moz-placeholder { color: {{newsletter_input_color}}; }
.newsletter__input:-ms-input-placeholder { color: {{newsletter_input_color}}; }
.newsletter__input::-webkit-input-placeholder { color: {{newsletter_input_color}}; }

.newsletter__input:focus {
{{#if newsletter_input_focus_bg_color}}
  background-color: {{newsletter_input_focus_bg_color}};
{{/if}}
{{#if newsletter_input_focus_border_color}}
  border-color: {{newsletter_input_focus_border_color}};
{{/if}}
{{#if newsletter_input_focus_color}}
  color:  {{newsletter_input_focus_color}};
{{/if}}
}

#newsletter-form .newsletter__submit-button {
{{#if newsletter_button_bg_color}}
  background-color: {{newsletter_button_bg_color}};
{{/if}}
{{#if newsletter_button_border_color}}
  border-color: {{newsletter_button_border_color}};
{{/if}}
{{#if newsletter_button_color}}
  color:  {{newsletter_button_color}};
{{/if}}
}

#newsletter-form .newsletter__submit-button:hover {
{{#if newsletter_button_hover_bg_color}}
  background-color: {{newsletter_button_hover_bg_color}};
{{/if}}
{{#if newsletter_button_hover_border_color}}
  border-color: {{newsletter_button_hover_border_color}};
{{/if}}
{{#if newsletter_button_hover_color}}
  color:  {{newsletter_button_hover_color}};
{{/if}}
}
/***************** POWERED STYLE *****************/
#powered {
{{#if powered_background_color}}
background-color: {{powered_background_color}};
{{/if}}
{{#if powered_pattern}}
background-image: url({{powered_pattern}});
{{/if}}
{{#if powered_border_color}}
border-color: {{powered_border_color}};
{{/if}}
{{#if powered_text_color}}
color: {{powered_text_color}};
{{/if}}
}

{{#if powered_background_image.path}}
#powered {
background-image: url({{powered_background_image.path}});
{{#if powered_background_image.repeat}}
background-repeat: {{powered_background_image.repeat}};
{{/if}}
{{#if powered_background_image.position}}
background-position: {{powered_background_image.position}};
{{/if}}
{{#if powered_background_image.attachment}}
background-attachment: {{powered_background_image.attachment}};
{{/if}}
}
{{/if}}

#powered a{
{{#if powered_link_color}}
color: {{powered_link_color}};
{{/if}}
}

{{#if powered_link_hover_color}}
#powered a:hover{
{{#if powered_link_hover_color}}
color: {{powered_link_hover_color}};
{{/if}}
}
{{/if}}

/************** PRODUCT STYLE *********************/
{{#if product_price_color}}
.product-price {
  color: {{product_price_color}};
}
{{/if}}
{{#if product_old_price_color}}
.product-price--old {
  color: {{product_old_price_color}};
}
{{/if}}
{{#if product_name_color}}
.product-name a {
  color: {{product_name_color}};
}
{{/if}}
{{#if product_sale_color}}
.product-sale {
  background-color: {{product_sale_color}};
}
.product-sale:before {
  border-color: transparent transparent {{product_sale_color}} transparent;
}
.product-sale:after {
  border-color: {{product_sale_color}} transparent transparent;
}
{{/if}}
{{#if product_sale_text_color}}
.product-sale {
  color: {{product_sale_text_color}};
}
{{/if}}
.product-detail-button--cart {
{{#if product_cart_color}}
  color: {{product_cart_color}};
{{/if}}
{{#if product_cart_bg_color}}
  background-color: {{product_cart_bg_color}};
{{/if}}
{{#if product_cart_border_color}}
  border-color: {{product_cart_border_color}}
{{/if}}
}
.product-detail-button--cart:hover {
{{#if product_cart_hover_color}}
  color: {{product_cart_hover_color}};
{{/if}}
{{#if product_cart_hover_bg_color}}
  background-color: {{product_cart_hover_bg_color}};
{{/if}}
{{#if product_cart_hover_border_color}}
  border-color: {{product_cart_hover_border_color}}
{{/if}}
}
a.product-detail-button--quick-view {
{{#if product_quickview_color}}
  color: {{product_quickview_color}};
{{/if}}
{{#if product_quickview_bg_color}}
  background-color: {{product_quickview_bg_color}};
{{/if}}
{{#if product_quickview_border_color}}
  border-color: {{product_quickview_border_color}}
{{/if}}
}
a.product-detail-button--quick-view:hover {
{{#if product_quickview_hover_color}}
  color: {{product_quickview_hover_color}};
{{/if}}
{{#if product_quickview_hover_bg_color}}
  background-color: {{product_quickview_hover_bg_color}};
{{/if}}
{{#if product_quickview_hover_border_color}}
  border-color: {{product_quickview_hover_border_color}}
{{/if}}
}
.product-detail-button--wishlist,
.product-detail-button--compare,
.product-detail-button--wishlist:before,
.product-detail-button--compare:before {
{{#if product_wishlist_button_color}}
  color: {{product_wishlist_button_color}};
{{/if}}
}
.product-detail-button--wishlist,
.product-detail-button--compare {
{{#if product_wishlist_button_color}}
background-color: {{product_wishlist_button_bg_color}};
{{/if}}
}
.product-detail-button--wishlist:hover,
.product-detail-button--compare:hover,
.product-detail-button--wishlist:hover:before,
.product-detail-button--compare:hover:before {
{{#if product_wishlist_button_hover_color}}
  color: {{product_wishlist_button_hover_color}};
{{/if}}
}
.product-detail-button--wishlist:hover,
.product-detail-button--compare:hover {
{{#if product_wishlist_button_hover_color}}
background-color: {{product_wishlist_button_hover_bg_color}};
{{/if}}
}
/******************* BUTTON STYLE *******************/
.btn, a.btn, .product-detail-button--cart, .article__title, .article__read-more, .newsletter__submit-button {
{{#if button_font.font_family}}
font-family: {{_fontFamily button_font.font_family}};
{{/if}}
}
.btn, a.btn {
{{#if button_color}}
  color: {{button_color}};
{{/if}}
{{#if button_border_color}}
  border-color: {{button_border_color}};
{{/if}}
{{#if button_background_color}}
  background-color: {{button_background_color}};
{{/if}}
}
.btn:hover, .btn:focus{
{{#if button_hover_background}}
  background-color: {{button_hover_background}};
{{/if}}
{{#if button_hover_color}}
  color: {{button_hover_color}};
{{/if}}
{{#if button_hover_border_color}}
  border-color: {{button_hover_border_color}};
{{/if}}
}


/******************* CAROUSEL STYLE *******************/
{{#if carousel_bg_color}}
.carousel-module {
  background-color: {{carousel_bg_color}}
}
{{/if}}
{{#if carousel_border_color}}
.carousel-module {
  border-color: {{carousel_border_color}}
}
{{/if}}
.owl-carousel.owl-theme .owl-controls .owl-nav [class*='owl-'] {
{{#if carousel_buttons_color}}
  color: {{carousel_buttons_color}};
{{/if}}
{{#if carousel_buttons_bg_color}}
  background-color: {{carousel_buttons_bg_color}};
{{/if}}
{{#if carousel_buttons_border_color}}
  border-color: {{carousel_buttons_border_color}}
{{/if}}
}
.owl-carousel.owl-theme .owl-controls .owl-nav [class*='owl-']:hover {
{{#if carousel_buttons_hover_color}}
  color: {{carousel_buttons_hover_color}};
{{/if}}
{{#if carousel_buttons_bg_hover_color}}
  background-color: {{carousel_buttons_bg_hover_color}};
{{/if}}
{{#if carousel_buttons_border_hover_color}}
  border-color: {{carousel_buttons_border_hover_color}}
{{/if}}
}