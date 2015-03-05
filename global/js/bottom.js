<script>
$(function() {
    "use strict";

    $(".styleGuideTab").addClass("selected");

    /* Example #4 */
    $(function() {
        $('#mySimpleValidation').validator({
            "fields": {
                "username1": {
                    "required": true
                },
                "password1": {
                    "required": true
                }
            }
        });
    });

    /* Validator Instantiation */
    $('#advancedValidation').validator({
        "fields": {
            "yourName": {
                "minLength": 3,
                "errorLocation": "below"
            },
            "email1": {
                "required": true,
                "pattern": "email"
            },
            "url": {
                "pattern": "url"
            },
            "tel": {
                "pattern": "tel",
                "errorLocation": "below"
            },
            "number": {
                "required": true,
                "pattern": "number",
                "errorLocation": "callout"
            },
            "passwordA": {
                "required": true,
                "minLength": 6
            },
            "passwordB": {
                "match": "passwordA",
                "required": true
            },
            "file": {
                "required": true,
                "extensions": ["jpg", "jpeg", "png", "gif"]
            },
            "myCollection": {
                "required": 3,
                "collection": $('.myCollection2').find('input[type="checkbox"]')
            },
            "myRadioCollection": {
                "required": true,
                "collection": $('.myRadioCollection').find('input[name="gender"]')
            },
            "feedback": {
                "maxLength": 20,
                "when": "keyup"
            },
            "custom2": {
                "pattern": function(value, $field) {
                    if (!value.length || !value.match(/^A/) && value.length < 4) {
                        $.validator.setErrorIndex($field, '0');
                        return false;
                    } else if (!value.match(/^A/)) {
                        $.validator.setErrorIndex($field, '1');
                        return false;
                    } else if (value.length < 4) {
                        $.validator.setErrorIndex($field, '2');
                        return false;
                    }
                    return true;
                }
            }
        }
    });

    $('#enableEverything').on('click.formSample', function() {
        $(this).closest('form').find('.disabled').removeClass('disabled').end().find('[disabled], [readonly]').removeAttr('disabled').removeAttr('readonly');
        $(this).parent().remove();
    });

});
/* Instantiate slider */
$('.slider:not([data-auto-instantiate="off"])').slider();
$('#secondToggleForm').validator({
    "fields": {
        "option4": {
            "required": true,
            "errorLocation": null
        },
        "option5": {
            "required": true,
            "errorLocation": null
        }
    }
});
$('#sortMenuTrigger').callout({
    'content': '#sortMenu'
});
</script>
