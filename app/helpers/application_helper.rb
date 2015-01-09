# Application Helper
module ApplicationHelper
  # see https://github.com/airbnb/polyglot.js/blob/master/README.md
  # In 'Usage > Translation'
  def javascript_translates
    #TODO Put keys in config file
    keys = [
      'activerecord.errors.folder.attributes.path.blank'
    ]

    phrases = {}
    keys.each { |key| phrases[key] = I18n.t(key) }
    content_tag 'script' do
      raw "var polyglot = new Polyglot({phrases: #{phrases.to_json}});"
    end
  end
end
