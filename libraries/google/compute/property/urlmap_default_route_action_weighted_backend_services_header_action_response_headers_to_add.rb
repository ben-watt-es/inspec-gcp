# frozen_string_literal: false

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------
module GoogleInSpec
  module Compute
    module Property
      class UrlMapDefaultRouteActionWeightedBackendServicesHeaderActionResponseHeadersToAdd
        attr_reader :header_name

        attr_reader :header_value

        attr_reader :replace

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @header_name = args['headerName']
          @header_value = args['headerValue']
          @replace = args['replace']
        end

        def to_s
          "#{@parent_identifier} UrlMapDefaultRouteActionWeightedBackendServicesHeaderActionResponseHeadersToAdd"
        end
      end

      class UrlMapDefaultRouteActionWeightedBackendServicesHeaderActionResponseHeadersToAddArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return UrlMapDefaultRouteActionWeightedBackendServicesHeaderActionResponseHeadersToAdd.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| UrlMapDefaultRouteActionWeightedBackendServicesHeaderActionResponseHeadersToAdd.new(v, parent_identifier) }
        end
      end
    end
  end
end
