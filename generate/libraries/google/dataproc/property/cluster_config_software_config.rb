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
  module Dataproc
    module Property
      class ClusterConfigSoftwareConfig
        attr_reader :arguments, :image_version, :properties, :optional_components

        def initialize(arguments = nil, parent_identifier = nil)
          @arguments = arguments
          return if arguments.nil?
          @parent_identifier = parent_identifier
          @image_version = arguments['imageVersion']
          @properties = arguments['properties']
          @optional_components = arguments['optionalComponents']
        end

        def to_s
          "#{@parent_identifier} ClusterConfigSoftwareConfig"
        end

        def self.un_parse(item, current_path)
          return if item.nil?
          way_to_parse = {
            'image_version' => ->(x, path) { x.nil? ? [] : ["its('#{path}.image_version') { should cmp #{x.inspect} }"] },
            'properties' => ->(x, path) { x.nil? ? [] : x.map { |k, v| "its('#{path}.properties') { should include(#{k.inspect} => #{v.inspect}) }" } },
            'optional_components' => ->(x, path) { x.nil? ? [] : ["its('#{path}.optional_components') { should cmp #{x.inspect} }"] },
          }
          way_to_parse.map do |k, v|
            v.call(item.method(k).call, current_path)
          end
        end

        def to_json(*_args)
          @arguments.to_json
        end

        # other is a string representation of this object
        def ==(other)
          @arguments == JSON.parse(other)
        end
      end
    end
  end
end
