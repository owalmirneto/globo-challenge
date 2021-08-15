# frozen_string_literal: true

REQUIRED_FILES = ['./config/initializers/**/*.rb', './app/**/*.rb'].freeze

Dir[*REQUIRED_FILES].each { |f| require f }
