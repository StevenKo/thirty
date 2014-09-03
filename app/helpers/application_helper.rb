module ApplicationHelper
  def tag_autocomplete_js(field_id)
      # source = languages_index_url
      parameter = {
        :defaultText => '',
        :unique => true
      }
      javascript_tag "$(document).ready(function(){
        $(\"\##{field_id}\").tagsInput(#{parameter.to_json});
      });"
  end
end
