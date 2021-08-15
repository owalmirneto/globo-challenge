# frozen_string_literal: true

require 'i18n'

I18n.load_path << Dir[File.expand_path('config/locales/**/*.yml')]
I18n.available_locales = ['en', 'pt-BR']
I18n.enforce_available_locales = true
I18n.default_locale = 'pt-BR'

current_locale = ENV['LOCALE'].to_s.to_sym
I18n.locale = current_locale if I18n.available_locales.include?(current_locale)

def translate(key, **options)
  I18n.t(key, **options)
end
alias t translate
