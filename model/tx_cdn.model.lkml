connection: "txcdn"

# include all the views
include: "/views/**/*.view"
include: "/lookml_dashboard/**/*.dashboard"

datagroup: zl_su_sea_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: zl_su_sea_default_datagroup


  explore: cdn_transform {
    sql_always_where:BYTE_LENGTH(NET.SAFE_IP_FROM_STRING(${cdn_transform.remote_ip})) = 4;;
    always_join: [dummy,geo_ip_country_mask,dummy1,geo_ip_isp_mask]
    join: dummy {
      sql: ,unnest(GENERATE_ARRAY(9,32)) mask;;
    }
    join: geo_ip_country_mask {
      type: inner
      sql_on: NET.SAFE_IP_FROM_STRING(${cdn_transform.remote_ip}) & NET.IP_NET_MASK(4, mask) = ${geo_ip_country_mask.network_bin} and mask=${geo_ip_country_mask.mask};;
      relationship: many_to_one
    }
    join: dummy1 {
      sql: ,unnest(GENERATE_ARRAY(9,32)) mask1;;
    }
    join: geo_ip_isp_mask {
      type: inner
      sql_on: NET.SAFE_IP_FROM_STRING(${cdn_transform.remote_ip}) & NET.IP_NET_MASK(4, mask1) = ${geo_ip_isp_mask.network_bin} and mask1=${geo_ip_isp_mask.mask};;
      relationship: many_to_one
    }
    # sql_always_where:NET.SAFE_IP_FROM_STRING(${cdn_transform.remote_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.end_ip})
    # and NET.SAFE_IP_FROM_STRING(${cdn_transform.remote_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.end_ip})
    #     ;;
    # join: geo_ip_country_range {
    #   type: left_outer
    #   sql_on: NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${cdn_transform.remote_ip}),16) = NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}),16) ;;
    #   relationship: many_to_one
    # }
    # join: geo_ip_isp_range {
    #   type: left_outer
    #   sql_on: NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${cdn_transform.remote_ip}),16) = NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}),16) ;;
    #   relationship: many_to_one
    # }

  }

  explore: cdn_transform_base {
    view_name: cdn_transform
  }


  explore: retention_interval {
    sql_always_where:BYTE_LENGTH(NET.SAFE_IP_FROM_STRING(${retention_interval.remote_ip})) = 4;;
    always_join: [dummy,geo_ip_country_mask,dummy1,geo_ip_isp_mask]
    join: dummy {
      sql: ,unnest(GENERATE_ARRAY(9,32)) mask;;
    }
    join: geo_ip_country_mask {
      type: inner
      sql_on: NET.SAFE_IP_FROM_STRING(${retention_interval.remote_ip}) & NET.IP_NET_MASK(4, mask) = ${geo_ip_country_mask.network_bin} and mask=${geo_ip_country_mask.mask};;
      relationship: many_to_one
    }
    join: dummy1 {
      sql: ,unnest(GENERATE_ARRAY(9,32)) mask1;;
    }
    join: geo_ip_isp_mask {
      type: inner
      sql_on: NET.SAFE_IP_FROM_STRING(${retention_interval.remote_ip}) & NET.IP_NET_MASK(4, mask1) = ${geo_ip_isp_mask.network_bin} and mask1=${geo_ip_isp_mask.mask};;
      relationship: many_to_one
    }
    # sql_always_where:NET.SAFE_IP_FROM_STRING(${retention_interval.remote_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.end_ip})
    # and NET.SAFE_IP_FROM_STRING(${retention_interval.remote_ip}) BETWEEN NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}) AND NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.end_ip});;
    # join: geo_ip_country_range {
    #   type: left_outer
    #   sql_on: NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${retention_interval.remote_ip}),16) = NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${geo_ip_country_range.start_ip}),16) ;;
    #   relationship: many_to_one
    # }
    # join: geo_ip_isp_range {
    #   type: left_outer
    #   sql_on: NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${retention_interval.remote_ip}),16) = NET.IP_TRUNC(NET.SAFE_IP_FROM_STRING(${geo_ip_isp_range.start_ip}),16) ;;
    #   relationship: many_to_one
    # }
  }

  explore: cdnlog {
    join: cdnlog__resource {
      view_label: "Cdnlog: Resource"
      sql: LEFT JOIN UNNEST([${cdnlog.resource}]) as cdnlog__resource ;;
      relationship: one_to_one
    }

    join: cdnlog__resource__labels {
      view_label: "Cdnlog: Resource Labels"
      sql: LEFT JOIN UNNEST([${cdnlog__resource.labels}]) as cdnlog__resource__labels ;;
      relationship: one_to_one
    }

    join: cdnlog__jsonpayload_type_loadbalancerlogentry {
      view_label: "Cdnlog: Jsonpayload Type Loadbalancerlogentry"
      sql: LEFT JOIN UNNEST([${cdnlog.jsonpayload_type_loadbalancerlogentry}]) as cdnlog__jsonpayload_type_loadbalancerlogentry ;;
      relationship: one_to_one
    }

    join: cdnlog__http_request {
      view_label: "Cdnlog: Httprequest"
      sql: LEFT JOIN UNNEST([${cdnlog.http_request}]) as cdnlog__http_request ;;
      relationship: one_to_one
    }

    join: cdnlog__source_location {
      view_label: "Cdnlog: Sourcelocation"
      sql: LEFT JOIN UNNEST([${cdnlog.source_location}]) as cdnlog__source_location ;;
      relationship: one_to_one
    }

    join: cdnlog__operation {
      view_label: "Cdnlog: Operation"
      sql: LEFT JOIN UNNEST([${cdnlog.operation}]) as cdnlog__operation ;;
      relationship: one_to_one
    }
  }
