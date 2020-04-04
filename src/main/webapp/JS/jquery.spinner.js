;
(function($) {
    $.fn.spinner = function(opts) {
        return this.each(function() {
            var defaults = {
                value: 1,
                min: 0
            }
            var options = $.extend(defaults, opts)
            var keyCodes = {
                up: 38,
                down: 40
            }
            var container = $('<div></div>')
            container.addClass('spinner')
            var textField = $(this).addClass('value').attr('maxlength', '10').val(options.value)
                .bind('keyup paste change', function(e) {
                    var field = $(this)
                   
                    if (e.keyCode == keyCodes.up) changeValue(1)
                    else if (e.keyCode == keyCodes.down) changeValue(-1)
                    else if (getValue(field) != container.data('lastValidValue')) validateAndTrigger(field)
                    else {
                    	if(field.attr("datestyle")=="int")
                    	field.toggleClass('passive',field.val(getValue(field))) ;  
                    	}                  
                    if (isInvalid(field.val())){
                    	
                    	decreaseButton.attr('disabled', 'disabled')
                    	field.toggleClass('invalid', isInvalid(field.val())).toggleClass('passive', field.val(container.data('lastValidValue'))).toggleClass('passive', field.val(container.data('lastValidValue')))                     	
                    	}
                })
            textField.wrap(container)

            var increaseButton = $('<button type="button" class="increase Symbolstyle">+</button>').click(function() {
                changeValue(1)
            })
            var decreaseButton = $('<button type="button" class="decrease Symbolstyle">-</button>').click(function() {
                changeValue(-1)
            })

            validate(textField)
            container.data('lastValidValue', options.value)
            textField.before(decreaseButton)
            textField.after(increaseButton)

            function changeValue(delta) {
                textField.val(getValue() + delta)
                validateAndTrigger(textField)
                return ;
            }

            function validateAndTrigger(field) {
                clearTimeout(container.data('timeout'))
                var value = validate(field)
                if (!isInvalid(value)) {
                    textField.trigger('update', [field, value])
                }
            }

            function validate(field) {
                var value = getValue()              
                if (value <= options.min  && ! isInvalid(field.val())) decreaseButton.attr('disabled', 'disabled')
                else decreaseButton.removeAttr('disabled')
                field.toggleClass('invalid', isInvalid(value)).toggleClass('passive', value === 0)

                if (isInvalid(value)) {
                    var timeout = setTimeout(function() {
                        textField.val(container.data('lastValidValue'))
                        validate(field)
                    }, 500)
                    container.data('timeout', timeout)
                } else {
                    container.data('lastValidValue', value)
                }
                return value
            }

            function isInvalid(value) {
                return isNaN(+value) || value < options.min;
            }

            function getValue(field) {
            	//data_max
            	
                field = field || textField;
                var data_max=parseFloat(field.attr("data_max")|| 0, 10)
            	if(field.val()>data_max && data_max!=0)
            		{
            		field.val(data_max)
            		alert("已达到最大值")
            		}
            		
                if (field.attr("datestyle")=="float")
                	{
                		
                		return parseFloat(field.val() || 0, 10)
                	}
                	
                else
                	{
                	
                	return parseInt(field.val() || 0, 10)
                	}
                	
            }
        })
    }
})(jQuery)