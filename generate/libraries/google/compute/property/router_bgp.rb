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
require 'google/compute/property/router_bgp_advertised_ip_ranges'
module GoogleInSpec
  module Compute
    module Property
      class RouterBgp
        attr_reader :arguments, :asn, :advertise_mode, :advertised_groups, :advertised_ip_ranges

        def initialize(arguments = nil, parent_identifier = nil)
          @arguments = arguments
          return if arguments.nil?
          @parent_identifier = parent_identifier
          @asn = arguments['asn']
          @advertise_mode = arguments['advertiseMode']
          @advertised_groups = arguments['advertisedGroups']
          @advertised_ip_ranges = GoogleInSpec::Compute::Property::RouterBgpAdvertisedIpRangesArray.parse(arguments['advertisedIpRanges'], to_s)
        end

        def to_s
          "#{@parent_identifier} RouterBgp"
        end

        def self.un_parse(item, current_path)
          return if item.nil?
          way_to_parse = {
            'asn' => ->(x, path) { x.nil? ? [] : ["its('#{path}.asn') { should cmp #{x.inspect} }"] },
            'advertise_mode' => ->(x, path) { x.nil? ? [] : ["its('#{path}.advertise_mode') { should cmp #{x.inspect} }"] },
            'advertised_groups' => ->(x, path) { x.nil? ? [] : x.map { |single| "its('#{path}.advertised_groups') { should include #{single.inspect} }" } },
            'advertised_ip_ranges' => ->(x, path) { x.nil? ? [] : x.map { |single| "its('#{path}.advertised_ip_ranges') { should include '#{single.to_json}' }" } },
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
