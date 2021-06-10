- dashboard: cdn_internal
  title: cdn_internal
  layout: newspaper
  preferred_viewer: dashboards
  elements:
  - name: Response Size by Country
    title: Response Size by Country
    model: tx_cdn
    explore: cdn_transform
    type: looker_grid
    fields: [cdn_transform.sum_cache_fill, cdn_transform.sum_resp_size_hit, cdn_transform.sum_resp_size_miss,
      geo_ip_country_mask.country, geo_ip_isp_mask.asn]
    sorts: [cdn_transform.sum_cache_fill desc]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      cdn_transform.sum_cache_fill:
        is_active: true
      cdn_transform.sum_resp_size_hit:
        is_active: true
        palette:
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      cdn_transform.sum_resp_size_miss:
        is_active: true
        palette:
          palette_id: 4a543302-b64d-409c-9863-679b5b230aac
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    series_types: {}
    defaults_version: 1
    listen:
      metro: cdn_transform.metro
      cacheid: cdn_transform.cacheid
      url: cdn_transform.request_url
      asn: geo_ip_isp_mask.asn
      time: cdn_transform.timestamp_time
    row: 77
    col: 0
    width: 24
    height: 12
  - name: URL Exchange History
    title: URL Exchange History
    model: tx_cdn
    explore: retention_interval
    type: looker_grid
    fields: [retention_interval.request_url, retention_interval.timestamp_time, retention_interval.cache_hit,
      retention_interval.prev_timestamp_time, retention_interval.prev_cache_hit, retention_interval.retention_interval]
    sorts: [retention_interval.timestamp_time desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      metro: retention_interval.metro
      cacheid: retention_interval.cacheid
      url: retention_interval.request_url
      asn: geo_ip_isp_mask.asn
      time: retention_interval.timestamp_time
    row: 42
    col: 0
    width: 24
    height: 11
  - title: Retention by Metro
    name: Retention by Metro
    model: tx_cdn
    explore: retention_interval
    type: looker_grid
    fields: [retention_interval.metro, retention_interval.retention_interval_p50,
      retention_interval.retention_interval_p90, retention_interval.retention_interval_p95,
      retention_interval.retention_interval_p99]
    sorts: [retention_interval.retention_interval_p50 desc]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      retention_interval.retention_interval_p50:
        is_active: true
      retention_interval.retention_interval_p95:
        is_active: true
        palette:
          palette_id: 471a8295-662d-46fc-bd2d-2d0acd370c1e
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      retention_interval.retention_interval_p90:
        is_active: true
        palette:
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      retention_interval.retention_interval_p99:
        is_active: true
        palette:
          palette_id: afd46b40-e939-4ace-bffd-69d1bb16ee05
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    defaults_version: 1
    listen:
      metro: retention_interval.metro
      cacheid: retention_interval.cacheid
      url: retention_interval.request_url
      asn: geo_ip_isp_mask.asn
      time: retention_interval.timestamp_time
    row: 8
    col: 0
    width: 24
    height: 10
  - title: URL Exchange Summary
    name: URL Exchange Summary
    model: tx_cdn
    explore: retention_interval
    type: looker_grid
    fields: [retention_interval.metro, retention_interval.request_url, retention_interval.retention_avg,
      retention_interval.count]
    sorts: [retention_interval.retention_avg desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      retention_interval.retention_avg:
        is_active: true
      retention_interval.count:
        is_active: true
    series_types: {}
    defaults_version: 1
    listen:
      metro: retention_interval.metro
      cacheid: retention_interval.cacheid
      url: retention_interval.request_url
      asn: geo_ip_isp_mask.asn
      time: retention_interval.timestamp_time
    row: 32
    col: 0
    width: 24
    height: 10
  - title: URL Access History
    name: URL Access History
    model: tx_cdn
    explore: cdn_transform
    type: looker_grid
    fields: [cdn_transform.request_url, cdn_transform.timestamp_time, cdn_transform.cache_hit,
      cdn_transform.status, cdn_transform.statusdetails]
    sorts: [cdn_transform.timestamp_time desc]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      metro: cdn_transform.metro
      cacheid: cdn_transform.cacheid
      url: cdn_transform.request_url
      asn: geo_ip_isp_mask.asn
      time: cdn_transform.timestamp_time
    row: 53
    col: 0
    width: 24
    height: 10
  - title: Retention Interval by Hour
    name: Retention Interval by Hour
    model: tx_cdn
    explore: retention_interval
    type: looker_line
    fields: [retention_interval.timestamp_hour, retention_interval.retention_avg,
      retention_interval.retention_interval_p50, retention_interval.retention_interval_p90,
      retention_interval.retention_interval_p95, retention_interval.retention_interval_p99]
    fill_fields: [retention_interval.timestamp_hour]
    sorts: [retention_interval.timestamp_hour desc]
    limit: 500
    query_timezone: UTC
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    defaults_version: 1
    listen:
      metro: retention_interval.metro
      cacheid: retention_interval.cacheid
      url: retention_interval.request_url
      asn: geo_ip_isp_mask.asn
      time: retention_interval.timestamp_time
    row: 18
    col: 0
    width: 24
    height: 12
  - title: Response Size by Seconds
    name: Response Size by Seconds
    model: tx_cdn
    explore: cdn_transform
    type: looker_line
    fields: [cdn_transform.timekey, cdn_transform.bandwidth]
    filters: {}
    sorts: [cdn_transform.timekey desc]
    limit: 3000
    query_timezone: UTC
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      metro: cdn_transform.metro
      cacheid: cdn_transform.cacheid
      url: cdn_transform.request_url
      asn: geo_ip_isp_mask.asn
      time: cdn_transform.timestamp_time
      "# of seconds": cdn_transform.num_of_seconds
      "# of bits": cdn_transform.num_of_bits
    row: 65
    col: 0
    width: 24
    height: 12
  - title: Expect Hit Rate
    name: Expect Hit Rate
    model: tx_cdn
    explore: cdn_transform
    type: single_value
    fields: [cdn_transform.expect_hit_rate, cdn_transform.real_hit_rate]
    filters: {}
    limit: 500
    column_limit: 50
    query_timezone: UTC
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    defaults_version: 1
    listen:
      metro: cdn_transform.metro
      cacheid: cdn_transform.cacheid
      url: cdn_transform.request_url
      asn: geo_ip_isp_mask.asn
      time: cdn_transform.timestamp_time
    row: 4
    col: 0
    width: 13
    height: 2
  - title: Real Hit Rate
    name: Real Hit Rate
    model: tx_cdn
    explore: cdn_transform
    type: single_value
    fields: [cdn_transform.real_hit_rate]
    filters: {}
    limit: 500
    column_limit: 50
    query_timezone: UTC
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    defaults_version: 1
    listen:
      metro: cdn_transform.metro
      cacheid: cdn_transform.cacheid
      url: cdn_transform.request_url
      asn: geo_ip_isp_mask.asn
      time: cdn_transform.timestamp_time
    row: 4
    col: 13
    width: 11
    height: 2
  - name: "<span class='fa fa-road'>Expect Hit Rate vs Real Hit Rate</span>"
    type: text
    title_text: "<span class='fa fa-road'>Expect Hit Rate vs Real Hit Rate</span>"
    subtitle_text: "<p>How far to get to the optimum hit rate?</p>"
    row: 2
    col: 0
    width: 24
    height: 2
  - name: "<span class='fa fa-retweet'> Retention Analysis </span>"
    type: text
    title_text: "<span class='fa fa-retweet'> Retention Analysis </span>"
    subtitle_text: "<p>How fast url is exchanged? </p>"
    row: 6
    col: 0
    width: 24
    height: 2
  - name: "<span class='fa fa-usd'> Financial Analysis </span>"
    type: text
    title_text: "<span class='fa fa-usd'> Financial Analysis </span>"
    subtitle_text: "<p>Is the bill to customer right? </p>"
    row: 63
    col: 0
    width: 24
    height: 2
  - name: "<span class='fa fa-info-circle'> URL Exchange Analysis </span>"
    type: text
    title_text: "<span class='fa fa-info-circle'> URL Exchange Analysis </span>"
    subtitle_text: "<p>Search each URL exchange </p>"
    row: 30
    col: 0
    width: 24
    height: 2
  - title: navigation_bar
    name: navigation_bar
    model: tx_cdn
    explore: cdnlog
    type: single_value
    fields: [cdnlog.dash_nav]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    row: 0
    col: 0
    width: 24
    height: 2
  filters:
  - name: metro
    title: metro
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: tx_cdn
    explore: retention_interval
    listens_to_filters: []
    field: retention_interval.metro
  - name: cacheid
    title: cacheid
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: tx_cdn
    explore: cdn_transform
    listens_to_filters: []
    field: cdn_transform.cacheid
  - name: url
    title: url
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: tx_cdn
    explore: retention_interval
    listens_to_filters: []
    field: retention_interval.request_url
  - name: asn
    title: asn
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: tx_cdn
    explore: cdn_transform
    listens_to_filters: []
    field: geo_ip_isp_mask.asn
  - name: time
    title: time
    type: field_filter
    default_value: 20 days
    allow_multiple_values: true
    required: false
    model: tx_cdn
    explore: cdn_transform
    listens_to_filters: []
    field: cdn_transform.timestamp_time
  - name: "# of seconds"
    title: "# of seconds"
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: tx_cdn
    explore: cdn_transform
    listens_to_filters: []
    field: cdn_transform.num_of_seconds
  - name: "# of bits"
    title: "# of bits"
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: tx_cdn
    explore: cdn_transform
    listens_to_filters: []
    field: cdn_transform.num_of_bits
