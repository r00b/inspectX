class SelectPickerInput < SimpleForm::Inputs::CollectionSelectInput

  def input(wrapper_options)
    options[:include_blank] ||= true
    input_html_classes << 'select-picker'
    input_html_options[:data] ||= {}
    input_html_options[:data].merge!('allow-clear': true) unless input_html_options[:multiple]
    super
  end

end