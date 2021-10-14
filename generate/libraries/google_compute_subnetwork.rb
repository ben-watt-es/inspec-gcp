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
require 'gcp_backend'
require 'google/compute/property/subnetwork_log_config'
require 'google/compute/property/subnetwork_secondary_ip_ranges'

# A provider to manage Compute Engine resources.
class ComputeSubnetwork < GcpResourceBase
  name 'google_compute_subnetwork'
  desc 'Subnetwork'
  supports platform: 'gcp'

  attr_reader :params, :creation_timestamp, :description, :gateway_address, :id, :ip_cidr_range, :name, :network, :fingerprint, :secondary_ip_ranges, :private_ip_google_access, :region, :log_config

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params, 'Get')
    parse unless @fetched.nil?
    @params = params
  end

  def parse
    @creation_timestamp = parse_time_string(@fetched['creationTimestamp'])
    @description = @fetched['description']
    @gateway_address = @fetched['gatewayAddress']
    @id = @fetched['id']
    @ip_cidr_range = @fetched['ipCidrRange']
    @name = @fetched['name']
    @network = @fetched['network']
    @fingerprint = @fetched['fingerprint']
    @secondary_ip_ranges = GoogleInSpec::Compute::Property::SubnetworkSecondaryIpRangesArray.parse(@fetched['secondaryIpRanges'], to_s)
    @private_ip_google_access = @fetched['privateIpGoogleAccess']
    @region = @fetched['region']
    @log_config = GoogleInSpec::Compute::Property::SubnetworkLogConfig.new(@fetched['logConfig'], to_s)
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "Subnetwork #{@params[:name]}"
  end

  def un_parse
    {
      'creation_timestamp' => ->(x, _) { x.nil? ? [] : ["its('creation_timestamp.to_s') { should cmp '#{x.inspect}' }"] },
      'description' => ->(x, _) { x.nil? ? [] : ["its('description') { should cmp #{x.inspect} }"] },
      'gateway_address' => ->(x, _) { x.nil? ? [] : ["its('gateway_address') { should cmp #{x.inspect} }"] },
      'id' => ->(x, _) { x.nil? ? [] : ["its('id') { should cmp #{x.inspect} }"] },
      'ip_cidr_range' => ->(x, _) { x.nil? ? [] : ["its('ip_cidr_range') { should cmp #{x.inspect} }"] },
      'name' => ->(x, _) { x.nil? ? [] : ["its('name') { should cmp #{x.inspect} }"] },
      'network' => ->(x, _) { x.nil? ? [] : ["its('network') { should cmp #{x.inspect} }"] },
      'fingerprint' => ->(x, _) { x.nil? ? [] : ["its('fingerprint') { should cmp #{x.inspect} }"] },
      'secondary_ip_ranges' => ->(x, _) { x.nil? ? [] : x.map { |single| "its('secondary_ip_ranges') { should include '#{single.to_json}' }" } },
      'private_ip_google_access' => ->(x, _) { x.nil? ? [] : ["its('private_ip_google_access') { should cmp #{x.inspect} }"] },
      'region' => ->(x, _) { x.nil? ? [] : ["its('region') { should cmp #{x.inspect} }"] },
      'log_config' => ->(x, _) { x.nil? ? [] : GoogleInSpec::Compute::Property::SubnetworkLogConfig.un_parse(x, 'log_config') },
    }
  end

  def dump(path, template_path, test_number, ignored_fields)
    name = 'Subnetwork'

    arr = un_parse.map do |k, v|
      next if ignored_fields.include?(k)
      v.call(method(k.to_sym).call, k)
    end
    template_vars = {
      name: name,
      arr: arr,
      type: 'google_compute_subnetwork',
      identifiers: @params,
      number: test_number,
    }
    File.open("#{path}/#{name}_#{test_number}.rb", 'w') do |file|
      file.write(ERB.new(File.read(template_path)).result_with_hash(template_vars))
    end
  end

  private

  def product_url
    'https://www.googleapis.com/compute/v1/'
  end

  def resource_base_url
    'projects/{{project}}/regions/{{region}}/subnetworks/{{name}}'
  end
end
