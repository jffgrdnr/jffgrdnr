<?php
return array(
    'id' => 'tellus',
    'name' => 'Tellus',
    'version' => '2.0.0',
    'default_skin_id' => 'skin1',
    'styles' => array(
        'body' => array(
            'label' => _t('text_style_general', 'General Style'),
            'items' => array(
                'body_container_bg_color' => array(
                    'label' => _t('text_style_body_container_bg_color', 'Container Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'body_link_color' => array(
                    'label' => _t('text_style_body_link_color', 'Link Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'body_link_hover_color' => array(
                    'label' => _t('text_style_body_link_hover_color', 'Link Hover Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'body_font' => array(
                    'label' => _t('text_style_font', 'Body Font'),
                    'type' => 'style_font',
                    'font_family' => true,
                    'font_size' => false,
                    'font_weight' => false,
                    'font_style' => false,
                    'text_transform' => false
                ),
                'body_text_color' => array(
                    'label' => _t('text_style_body_text_color', 'Body Text Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'body_bg_color' => array(
                    'label' => _t('text_style_body_bg_color', 'Body Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'body_bg_image' => array(
                    'label' => _t('text_style_body_bg_image', 'Body Background Image'),
                    'type' => 'style_image_selector'
                ),
                'body_pattern' => array(
                    'label' => _t('text_style_pattern', 'Body Background Pattern'),
                    'type' => 'style_pattern'
                ),
                'heading_color' => array(
                    'label' => _t('text_style_heading_color', 'Heading Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'heading_font' => array(
                    'label' => _t('text_style_font', 'Heading Font'),
                    'type' => 'style_font',
                    'font_family' => true,
                    'font_size' => false,
                    'font_weight' => false,
                    'font_style' => false,
                    'text_transform' => false
                ),
            )
        ),
        'topbar' => array(
            'label' => _t('text_style_extra', 'Topbar Style'),
            'items' => array(
                'topbar_text_color' => array(
                    'label' => _t('text_style_extra_text_color', 'Text Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'topbar_link_color' => array(
                    'label' => _t('text_style_extra_link_color', 'Link Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'topbar_background_color' => array(
                    'label' => _t('text_style_background_color', 'Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'topbar_link_hover_color' => array(
                    'label' => _t('text_style_extra_link_hover_color', 'Link Hover Color'),
                    'type' => 'color',
                    'format' => 'hex'
                )
            )
        ),
        'header' => array(
            'label' => _t('text_style_header', 'Header Style'),
            'items' => array(
                'header_background_color' => array(
                    'label' => _t('text_style_background_color', 'Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'header_background_image' => array(
                    'label' => _t('text_style_header_background_image', 'Background Image'),
                    'type' => 'style_image_selector'
                ),
                'header_pattern' => array(
                    'label' => _t('text_style_header_pattern', 'Header Background Pattern'),
                    'type' => 'style_pattern'
                ),
                'header_search_color' => array(
                    'label' => _t('text_style_search_color', 'Search Box Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'header_search_border_color' => array(
                    'label' => _t('text_style_search_border_color', 'Search Box Border Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'header_search_bg_color' => array(
                    'label' => _t('text_style_search_bg_color', 'Search Box Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'header_mini_cart_header_color' => array(
                    'label' => _t('text_style_header_mini_cart_header_color', 'Mini Cart Header Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'header_mini_cart_header_bg_color' => array(
                    'label' => _t('text_style_header_mini_cart_header_bg_color', 'Mini Cart Header Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'header_mini_cart_header_border_color' => array(
                    'label' => _t('text_style_header_mini_cart_header_border_color', 'Mini Cart Header Border Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'header_mini_cart_header_hover_text_color' => array(
                    'label' => _t('text_style_header_mini_cart_header_text_color', 'Mini Cart Header Hover Text Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'header_mini_cart_header_hover_bg_color' => array(
                    'label' => _t('text_style_header_mini_cart_header_bg_color', 'Mini Cart Header Hover Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'header_mini_cart_header_hover_border_color' => array(
                    'label' => _t('text_style_header_mini_cart_header_border_color', 'Mini Cart Header Hover Border Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'header_mini_cart_color' => array(
                    'label' => _t('text_style_header_mini_cart_color', 'Mini Cart Text Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'header_mini_cart_bg_color' => array(
                    'label' => _t('text_style_header_mini_cart_bg_color', 'Mini Cart Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'header_mini_cart_border_color' => array(
                    'label' => _t('text_style_header_mini_cart_border_color', 'Mini Cart Border Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'header_mini_cart_button_text_color' => array(
                    'label' => _t('text_style_header_mini_cart_button_text_color', 'Mini Cart Button Text Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'header_mini_cart_button_bg_color' => array(
                    'label' => _t('text_style_header_mini_cart_button_bg_color', 'Mini Cart Button Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'header_mini_cart_button_hover_text_color' => array(
                    'label' => _t('text_style_header_mini_cart_button_text_color', 'Mini Cart Button Hover Text Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'header_mini_cart_button_hover_bg_color' => array(
                    'label' => _t('text_style_header_mini_cart_button_bg_color', 'Mini Cart Button Hover Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                )
            )
        ),
        'menu' => array(
            'label' => _t('text_style_menu', 'Menu Style'),
            'items' => array(
                'menu_bg_color' => array(
                    'label' => _t('text_style_menu_bg_color', 'Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'menu_border_color' => array(
                    'label' => _t('text_style_menu_border_color', 'Border Color'),
                    'type' => 'color',
                    'format' => 'rgba'
                ),
                'menu_font' => array(
                    'label' => _t('text_style_font', 'Font'),
                    'type' => 'style_font',
                    'font_family' => true,
                    'font_size' => true,
                    'font_weight' => false,
                    'font_style' => false,
                    'text_transform' => false
                ),
                'menu_item_color' => array(
                    'label' => _t('text_style_item_color', 'Item Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'menu_item_bg_color' => array(
                    'label' => _t('text_style_item_bg_color', 'Item Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'menu_item_hover_color' => array(
                    'label' => _t('text_style_menu_item_hover_color', 'Item Hover Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'menu_item_hover_bg_color' => array(
                    'label' => _t('text_style_item_hover_bg_color', 'Item Hover Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'menu_sub_item_color' => array(
                    'label' => _t('text_style_sub_item_color', 'Sub Item Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'menu_sub_item_hover_color' => array(
                    'label' => _t('text_style_menu_sub_item_hover_color', 'Sub Item Hover Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
            )
        ),
        'extra' => array(
            'label' => _t('text_style_extra', 'Language / Currency Style'),
            'items' => array(
                'extra_text_color' => array(
                    'label' => _t('text_style_extra_text_color', 'Text Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'extra_link_color' => array(
                    'label' => _t('text_style_extra_link_color', 'Link Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'extra_text_hover_color' => array(
                    'label' => _t('text_style_extra_text_hover_color', 'Text Hover Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'extra_link_hover_color' => array(
                    'label' => _t('text_style_extra_link_hover_color', 'Link Hover Color'),
                    'type' => 'color',
                    'format' => 'hex'
                )
            )
        ),
        'footer' => array(
            'label' => _t('text_style_bottom', 'Footer Style'),
            'items' => array(
                'footer_background_image' => array(
                    'label' => _t('text_style_footer_background_image', 'Background Image'),
                    'type' => 'style_image_selector'
                ),
                'footer_pattern' => array(
                    'label' => _t('text_style_footer_pattern', 'Background Pattern'),
                    'type' => 'style_pattern'
                ),
                'footer_border_color' => array(
                    'label' => _t('text_style_footer_border_color', 'Border Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'footer_background_color' => array(
                    'label' => _t('text_style_footer_background_color', 'Footer Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'footer_heading_color' => array(
                    'label' => _t('text_style_footer_heading_color', 'Footer Heading Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'footer_heading_bg_color' => array(
                    'label' => _t('text_style_footer_heading_bg_color', 'Footer Heading Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'footer_text_color' => array(
                    'label' => _t('text_style_footer_text_color', 'Footer Text Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'footer_text_hover_color' => array(
                    'label' => _t('text_style_footer_text_hover_color', 'Footer Text Hover Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'footer_link_color' => array(
                    'label' => _t('text_style_footer_link_color', 'Footer Link Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'footer_link_hover_color' => array(
                    'label' => _t('text_style_footer_link_hover_color', 'Footer Link Hover Color'),
                    'type' => 'color',
                    'format' => 'hex'
                )
            )
        ),
        'powered' => array(
            'label' => _t('text_style_powered', 'Powered Style'),
            'items' => array(
                'powered_background_color' => array(
                    'label' => _t('text_style_powered_background_color', 'Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'powered_background_image' => array(
                    'label' => _t('text_style_powered_background_image', 'Background Image'),
                    'type' => 'style_image_selector'
                ),
                'powered_pattern' => array(
                    'label' => _t('text_style_powered_pattern', 'Background Pattern'),
                    'type' => 'style_pattern'
                ),
                'powered_border_color' => array(
                    'label' => _t('text_style_powered_border_color', 'Border Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'powered_text_color' => array(
                    'label' => _t('text_style_powered_text_color', 'Text Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'powered_link_color' => array(
                    'label' => _t('text_style_powered_link_color', 'Link Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'powered_link_hover_color' => array(
                    'label' => _t('text_style_powered_link_hover_color', 'Link Hover Color'),
                    'type' => 'color',
                    'format' => 'hex'
                )
            )
        ),
        'social_newsletter' => array(
            'label' => _t('text_style_social', 'Social / Newsletter Style'),
            'items' => array(
                'social_icon_color' => array(
                    'label' => _t('text_style_social_icon_color', 'Social Icon Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'social_icon_bg' => array(
                    'label' => _t('text_style_social_icon_bg', 'Social Icon Background'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'social_border_color' => array(
                    'label' => _t('text_style_social_border_color', 'Social Icon Border Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'social_icon_hover_color' => array(
                    'label' => _t('text_style_social_icon_hover_color', 'Social Icon Hover Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'social_icon_hover_bg' => array(
                    'label' => _t('text_style_social_icon_hover_bg', 'Social Icon Hover Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'social_border_hover_color' => array(
                    'label' => _t('text_style_social_boder_hover_color', 'Social Icon Hover Border Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'newsletter_bg_color' => array(
                    'label' => _t('text_style_newsletter_bg_color', 'Newsletter Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'newsletter_color1' => array(
                    'label' => _t('text_style_newsletter_color', 'Newsletter Text Color 1'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'newsletter_color2' => array(
                    'label' => _t('text_style_newsletter_color', 'Newsletter Text Color 2'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'newsletter_input_color' => array(
                    'label' => _t('text_newsletter_input_color', 'Newsletter Input Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'newsletter_input_bg_color' => array(
                    'label' => _t('text_newsletter_input_bg_color', 'Newsletter Input Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'newsletter_input_border_color' => array(
                    'label' => _t('text_newsletter_input_border_color', 'Newsletter Input Border Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'newsletter_input_focus_color' => array(
                    'label' => _t('text_newsletter_focus_input_color', 'Newsletter Input Focus Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'newsletter_input_focus_bg_color' => array(
                    'label' => _t('text_newsletter_input_focus_bg_color', 'Newsletter Input Focus Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'newsletter_input_focus_border_color' => array(
                    'label' => _t('text_newsletter_input_focus_border_color', 'Newsletter Input Focus Border Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'newsletter_button_color' => array(
                    'label' => _t('text_newsletter_button_color', 'Newsletter Button Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'newsletter_button_bg_color' => array(
                    'label' => _t('text_newsletter_button_bg_color', 'Newsletter Button Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'newsletter_button_border_color' => array(
                    'label' => _t('text_newsletter_button_border_color', 'Newsletter Button Border Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'newsletter_button_hover_color' => array(
                    'label' => _t('text_newsletter_button_hover_color', 'Newsletter Button Hover Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'newsletter_button_hover_bg_color' => array(
                    'label' => _t('text_newsletter_button_focus_bg_color', 'Newsletter Button Hover Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'newsletter_button_hover_border_color' => array(
                    'label' => _t('text_newsletter_button_hover_border_color', 'Newsletter Button Hover Border Color'),
                    'type' => 'color',
                    'format' => 'hex'
                )
            )
        ),
        'contact' => array(
            'label' => _t('text_style_social', 'Contact Style'),
            'items' => array(
                'contact_icon_color' => array(
                    'label' => _t('text_style_contact_icon_color', 'Contact Icon Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'contact_icon_bg' => array(
                    'label' => _t('text_style_contact_icon_bg', 'Contact Icon Background'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'contact_icon_hover_color' => array(
                    'label' => _t('text_style_contact_icon_hover_color', 'Contact Icon Hover Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'contact_icon_hover_bg' => array(
                    'label' => _t('text_style_contact_icon_hover_bg', 'Contact Icon Hover Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                )
            )
        ),
        'product' => array(
            'label' => _t('text_style_product', 'Product Style'),
            'items' => array(
                'product_sale_color' => array(
                    'label' => _t('text_style_product_sale_color', 'Sale Badge Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'product_sale_text_color' => array(
                    'label' => _t('text_style_product_sale_text_color', 'Sale Badge Text Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'product_name_color' => array(
                    'label' => _t('text_style_product_name_color', 'Product Name Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'product_price_color' => array(
                    'label' => _t('text_style_product_price_color', 'Price Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'product_old_price_color' => array(
                    'label' => _t('text_style_product_old_price_color', 'Old Price Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'product_cart_color' => array(
                    'label' => _t('text_style_product_cart_color', 'Add to cart Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'product_cart_bg_color' => array(
                    'label' => _t('text_style_product_cart_bg_color', 'Add to cart Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'product_cart_border_color' => array(
                    'label' => _t('text_style_product_cart_bg_color', 'Add to cart Border Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'product_cart_hover_color' => array(
                    'label' => _t('text_style_product_cart_hover_color', 'Add to cart Hover Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'product_cart_hover_bg_color' => array(
                    'label' => _t('text_style_product_cart_hover_bg_color', 'Add to cart Hover Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'product_cart_hover_border_color' => array(
                    'label' => _t('text_style_product_cart_hover_border_color', 'Add to cart Hover Border Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'product_quickview_color' => array(
                    'label' => _t('text_style_product_quickview_color', 'Quick View Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'product_quickview_bg_color' => array(
                    'label' => _t('text_style_product_quickview_bg_color', 'Quick View Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'product_quickview_border_color' => array(
                    'label' => _t('text_style_product_quickview_bg_color', 'Quick View Border Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'product_quickview_hover_color' => array(
                    'label' => _t('text_style_product_quickview_hover_color', 'Quick View Hover Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'product_quickview_hover_bg_color' => array(
                    'label' => _t('text_style_product_quickview_hover_bg_color', 'Quick View Hover Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'product_quickview_hover_border_color' => array(
                    'label' => _t('text_style_product_quickview_hover_border_color', 'Quick View Hover Border Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'product_wishlist_button_color' => array(
                    'label' => _t('text_style_product_detail_button_color', 'Wishlist / Compare Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'product_wishlist_button_bg_color' => array(
                    'label' => _t('text_style_product_detail_button_bg_color', 'Wishlist / Compare Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'product_wishlist_button_hover_color' => array(
                    'label' => _t('text_style_product_detail_button_hover_color', 'Wishlist / Compare Hover Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'product_wishlist_button_hover_bg_color' => array(
                    'label' => _t('text_style_product_detail_button_hover_bg_color', 'Wishlist / Compare Hover Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                )
            )
        ),
        'carousel' => array(
            'label' => _t('text_style_product', 'Carousel Style'),
            'items' => array(
                'carousel_bg_color' => array(
                    'label' => _t('text_style_carousel_bg_color', 'Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'carousel_border_color' => array(
                    'label' => _t('text_style_carousel_border_color', 'Border Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'carousel_buttons_color' => array(
                    'label' => _t('text_style_carousel_buttons_color', 'Next/Previous Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'carousel_buttons_bg_color' => array(
                    'label' => _t('text_style_carousel_buttons_bg_color', 'Next/Previous Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'carousel_buttons_border_color' => array(
                    'label' => _t('text_style_carousel_buttons_border_color', 'Next/Previous Border Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'carousel_buttons_hover_color' => array(
                    'label' => _t('text_style_carousel_buttons_color', 'Next/Previous Hover Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'carousel_buttons_bg_hover_color' => array(
                    'label' => _t('text_style_carousel_buttons_bg_hover_color', 'Next/Previous Hover Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'carousel_buttons_border_hover_color' => array(
                    'label' => _t('text_style_carousel_buttons_hover_border_color', 'Next/Previous Hover Border Color'),
                    'type' => 'color',
                    'format' => 'hex'
                )
            )
        ),
        'button' => array(
            'label' => _t('text_style_product', 'Button Style'),
            'items' => array(
                'button_font' => array(
                    'label' => _t('text_style_font', 'Button Font'),
                    'type' => 'style_font',
                    'font_family' => true,
                    'font_size' => false,
                    'font_weight' => false,
                    'font_style' => false,
                    'text_transform' => false
                ),
                'button_color' => array(
                    'label' => _t('text_style_button_color', 'Button Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'button_background_color' => array(
                    'label' => _t('text_style_button_background_color', 'Button Background Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'button_border_color' => array(
                    'label' => _t('text_style_button_border_color', 'Button Border Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'button_hover_color' => array(
                    'label' => _t('text_style_button_hover_color', 'Button Hover Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'button_hover_background' => array(
                    'label' => _t('text_style_button_hover_background', 'Button Hover Background'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
                'button_hover_border_color' => array(
                    'label' => _t('text_style_button_hover_border_color', 'Button Hover Border Color'),
                    'type' => 'color',
                    'format' => 'hex'
                ),
            )
        )
    ),
    'positions' => array(
        'header_extra' => _t('text_position_header_extra', 'Header Extra'),
        'header_top' => _t('text_position_header_top', 'Header Top'),
        'kuler_menu' => _t('text_position_kuler_menu', 'Kuler Menu'),
        'promotion' => _t('text_position_promotion', 'Promotion'),
        'footer_top' => _t('text_position_footer_top', 'Footer Top'),
        'footer_bottom' => _t('text_position_footer_bottom', 'Footer Bottom'),
        'footer_extra' => _t('text_position_footer_extra', 'Footer Extra')
    ),
    'excluded_options' => array(
        'header_logo_position' => true,
        'facebook' => false,
        'twitter' => false,
        'product_page_button_select_list' => true,
        'product_page_related_products_position' => true
    )
);
