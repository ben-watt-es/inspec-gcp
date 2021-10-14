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
require 'google/filestore/property/instance_file_shares'
require 'google/filestore/property/instance_networks'

# A provider to manage Cloud Filestore resources.
class FilestoreInstance < GcpResourceBase
  name 'google_filestore_instance'
  desc 'Instance'
  supports platform: 'gcp'

  attr_reader :params, :name, :description, :create_time, :tier, :labels, :file_shares, :networks, :etag, :zone

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params, 'Get')
    parse unless @fetched.nil?
    @params = params
  end

  def parse
    @name = @fetched['name']
    @description = @fetched['description']
    @create_time = parse_time_string(@fetched['createTime'])
    @tier = @fetched['tier']
    @labels = @fetched['labels']
    @file_shares = GoogleInSpec::Filestore::Property::InstanceFileSharesArray.parse(@fetched['fileShares'], to_s)
    @networks = GoogleInSpec::Filestore::Property::InstanceNetworksArray.parse(@fetched['networks'], to_s)
    @etag = @fetched['etag']
    @zone = @fetched['zone']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "Instance #{@params[:name]}"
  end

  def un_parse
    {
      'name' => ->(x, _) { x.nil? ? [] : ["its('name') { should cmp #{x.inspect} }"] },
      'description' => ->(x, _) { x.nil? ? [] : ["its('description') { should cmp #{x.inspect} }"] },
      'create_time' => ->(x, _) { x.nil? ? [] : ["its('create_time.to_s') { should cmp '#{x.inspect}' }"] },
      'tier' => ->(x, _) { x.nil? ? [] : ["its('tier') { should cmp #{x.inspect} }"] },
      'labels' => ->(x, _) { x.nil? ? [] : x.map { |k, v| "its('labels') { should include(#{k.inspect} => #{v.inspect}) }" } },
      'file_shares' => ->(x, _) { x.nil? ? [] : x.map { |single| "its('file_shares') { should include '#{single.to_json}' }" } },
      'networks' => ->(x, _) { x.nil? ? [] : x.map { |single| "its('networks') { should include '#{single.to_json}' }" } },
      'etag' => ->(x, _) { x.nil? ? [] : ["its('etag') { should cmp #{x.inspect} }"] },
      'zone' => ->(x, _) { x.nil? ? [] : ["its('zone') { should cmp #{x.inspect} }"] },
    }
  end

  def dump(path, template_path, test_number, ignored_fields)
    name = 'Instance'

    arr = un_parse.map do |k, v|
      next if ignored_fields.include?(k)
      v.call(method(k.to_sym).call, k)
    end
    template_vars = {
      name: name,
      arr: arr,
      type: 'google_filestore_instance',
      identifiers: @params,
      number: test_number,
    }
    File.open("#{path}/#{name}_#{test_number}.rb", 'w') do |file|
      file.write(ERB.new(File.read(template_path)).result_with_hash(template_vars))
    end
  end

  private

  def product_url
    'https://file.googleapis.com/v1/'
  end

  def resource_base_url
    'projects/{{project}}/locations/{{zone}}/instances/{{name}}'
  end
end
