require "i18n/backend/fallbacks" 
I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)

module UseKeyForMissing
    def call(exception, locale, key, options)
      if exception.is_a?(I18n::MissingTranslation)
        key
      else
        super
      end
    end
  end
  