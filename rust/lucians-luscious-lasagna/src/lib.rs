// This stub file contains items that aren't used yet; feel free to remove this module attribute
// to enable stricter warnings.
#![allow(unused)]

const MINUTES_IN_OVEN: i32 = 40;
const PREPARATION_TIME_PER_LAYER: i32 = 2;

pub fn expected_minutes_in_oven() -> i32 {
    MINUTES_IN_OVEN
}

pub fn remaining_minutes_in_oven(actual_minutes_in_oven: i32) -> i32 {
    MINUTES_IN_OVEN - actual_minutes_in_oven
}

pub fn preparation_time_in_minutes(number_of_layers: i32) -> i32 {
    number_of_layers * PREPARATION_TIME_PER_LAYER
}

pub fn elapsed_time_in_minutes(number_of_layers: i32, actual_minutes_in_oven: i32) -> i32 {
    preparation_time_in_minutes(number_of_layers) + actual_minutes_in_oven
}
