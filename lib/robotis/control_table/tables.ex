defmodule Robotis.ControlTable.Tables do
  @moduledoc false

  @velocity_factor 0.229
  @position_factor 0.087890625

  @xl330_m288 %{
    model_number: {0, 2, 1},
    model_information: {2, 4},
    firmware_version: {6, 1, 1},
    id: {7, 1, 1},
    baud_rate:
      {8, 1,
       [
         {9_600, <<0>>},
         {57_000, <<1>>},
         {115_200, <<2>>},
         {1_000_000, <<3>>},
         {2_000_000, <<4>>},
         {3_000_000, <<5>>},
         {4_000_000, <<6>>}
       ]},
    return_delay_time: {9, 1, 2},
    drive_mode:
      {10, 1,
       [
         {{:velocity_based, false}, <<0>>},
         {{:velocity_based, true}, <<1>>},
         {{:time_based, false}, <<4>>},
         {{:time_based, true}, <<5>>}
       ]},
    operating_mode:
      {11, 1,
       [
         current_control: <<0>>,
         velocity_control: <<1>>,
         position_control: <<3>>,
         extended_position_control: <<4>>,
         current_based_position_control: <<5>>,
         pwm_control_mode: <<16>>
       ]},
    secondary_id: {12, 1, 1},
    protocol_type:
      {13, 1,
       [
         {:dynamixel_protocol_2, <<2>>},
         {:s_bus, <<20>>},
         {:ibus, <<21>>},
         {:rc_pwm, <<22>>}
       ]},
    homing_offset: {20, 4, @position_factor},
    moving_threshold: {24, 4, @velocity_factor},
    temperature_limit: {31, 1, 1},
    max_voltage_limit: {32, 2, 0.1},
    min_voltage_limit: {34, 2, 0.1},
    pwm_limit: {36, 2, 0.113},
    current_limit: {38, 2, 0.001},
    velocity_limit: {44, 4, @velocity_factor},
    max_angle_limit: {48, 4, @position_factor},
    max_position_limit: {48, 4, @position_factor},
    min_position_limit: {52, 4, @position_factor},
    min_angle_limit: {52, 4, @position_factor},
    startup_configuration: {60, 1, nil},
    pwm_slope: {62, 1, 1.977},
    shutdown: {63, 1, {Robotis.ControlTable, :xl330_decode_shutdown, :xl330_encode_shutdown}},
    torque_enable: {64, 1, :bool},
    led: {65, 1, :bool},
    status_return_level: {68, 1, [{:ping, <<0>>}, {:ping_read, <<1>>}, {:all, <<2>>}]},
    registered_instruction: {69, 1, :bool},
    hardware_error_status: {70, 1, nil},
    velocity_i_gain: {76, 2, 1 / 65_536},
    velocity_p_gain: {78, 2, 1 / 128},
    position_d_gain: {80, 2, 1 / 16},
    position_i_gain: {82, 2, 1 / 65_536},
    position_p_gain: {84, 2, 1 / 128},
    feedforward_2nd_gain: {88, 2, 1 / 4},
    feedforward_1st_gain: {90, 2, 1 / 4},
    bus_watchdog: {98, 1, nil},
    goal_pwm: {100, 2, 0.113},
    goal_current: {102, 2, 0.001},
    goal_velocity: {104, 4, @velocity_factor},
    profile_acceleration: {108, 4, 1},
    profile_velocity: {112, 4, 1},
    goal_position: {116, 4, @position_factor},
    realtime_tick: {120, 2, 1},
    moving: {122, 1, :bool},
    moving_status: {123, 1, {Robotis.ControlTable, :decode_moving_status, nil}},
    present_pwm: {124, 2, 0.113},
    present_current: {126, 2, 0.001},
    present_velocity: {128, 4, @velocity_factor},
    present_position: {132, 4, @position_factor},
    velocity_trajectory: {136, 4, @velocity_factor},
    position_trajectory: {140, 4, @position_factor},
    present_input_voltage: {144, 2, 0.1},
    present_temperature: {146, 1, 1},
    backup_ready: {147, 1, :bool},
    indirect_address_1: {168, 2, 1},
    indirect_address_2: {170, 2, 1},
    indirect_address_3: {172, 2, 1},
    indirect_address_4: {174, 2, 1},
    indirect_address_5: {176, 2, 1},
    indirect_address_6: {178, 2, 1},
    indirect_address_7: {180, 2, 1},
    indirect_address_8: {182, 2, 1},
    indirect_address_9: {184, 2, 1},
    indirect_address_10: {186, 2, 1},
    indirect_address_11: {188, 2, 1},
    indirect_address_12: {190, 2, 1},
    indirect_address_13: {192, 2, 1},
    indirect_address_14: {194, 2, 1},
    indirect_address_15: {196, 2, 1},
    indirect_address_16: {198, 2, 1},
    indirect_address_17: {200, 2, 1},
    indirect_address_18: {202, 2, 1},
    indirect_address_19: {204, 2, 1},
    indirect_address_20: {206, 2, 1},
    indirect_data_1: {208, 1, 1},
    indirect_data_2: {209, 1, 1},
    indirect_data_3: {210, 1, 1},
    indirect_data_4: {211, 1, 1},
    indirect_data_5: {212, 1, 1},
    indirect_data_6: {213, 1, 1},
    indirect_data_7: {214, 1, 1},
    indirect_data_8: {215, 1, 1},
    indirect_data_9: {216, 1, 1},
    indirect_data_10: {217, 1, 1},
    indirect_data_11: {218, 1, 1},
    indirect_data_12: {219, 1, 1},
    indirect_data_13: {220, 1, 1},
    indirect_data_14: {221, 1, 1},
    indirect_data_15: {222, 1, 1},
    indirect_data_16: {223, 1, 1},
    indirect_data_17: {224, 1, 1},
    indirect_data_18: {225, 1, 1},
    indirect_data_19: {226, 1, 1},
    indirect_data_20: {227, 1, 1}
  }

  @xl320 %{
    model_number: {0, 2, 1},
    firmware_version: {2, 1, 1},
    id: {3, 1, 1},
    baud_rate:
      {4, 1,
       [
         {9_600, <<0>>},
         {57_000, <<1>>},
         {115_200, <<2>>},
         {1_000_000, <<3>>},
         {2_000_000, <<4>>},
         {3_000_000, <<5>>},
         {4_000_000, <<6>>}
       ]},
    return_delay_time: {5, 1, 2},
    cw_angle_limit: {6, 2, 0.29},
    ccw_angle_limit: {8, 2, 0.29},
    control_mode: {11, 1, [{:wheel_mode, <<1>>}, {:joint_mode, <<2>>}]},
    temperature_limit: {12, 1, 1},
    min_voltage_limit: {13, 1, 0.1},
    max_voltage_limit: {14, 1, 0.1},
    max_torque: {15, 2, 0.001},
    status_return_level: {17, 1, [{:ping, <<0>>}, {:ping_read, <<1>>}, {:all, <<2>>}]},
    shutdown: {18, 1, {Robotis.ControlTable, :xl320_decode_shutdown, :xl320_encode_shutdown}},
    torque_enable: {24, 1, :bool},
    led: {25, 1, 1},
    d_gain: {27, 1, 1 / 8},
    i_gain: {28, 1, 1000 / 2048},
    p_gain: {29, 1, 4 / 1000},
    goal_position: {30, 2, 0.29},
    moving_speed: {32, 2, 0.111},
    torque_limit: {35, 2, 0.001},
    present_position: {37, 2, 0.29},
    present_speed: {39, 2, 0.111},
    present_load: {41, 2, 0.001},
    present_voltage: {45, 1, 0.1},
    present_temperature: {46, 1, 1},
    registered_instruction: {47, 1, :bool},
    moving: {49, 1, :bool},
    hardware_error_status: {50, 1, 1},
    punch: {51, 2, 0.001}
  }

  @spec table(:xl320 | :xl330_m288) :: map()
  def table(:xl330_m288), do: @xl330_m288
  def table(:xl320), do: @xl320
end
