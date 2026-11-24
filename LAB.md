# Lab

## Invariants
1. The power to all devices is always on and stable
2. All barriers, sensors, and alarms are functional
3. All trains go the correct way on its track
4. Trains only go in one direction per track
5. Cars and pedestrians never cross or block barriers
6. Trains travel at or below the speed limit for the track
7. All barriers are lowered when any train arrives at the crossing
8. Signals only detect train cars
9. Timer must start after alarm begins or barrier raises
10. The alarm is always on while the barrier is down
11. The barrier is only lowered when a train is present
12. At most one train is present on a track at a time

### Verifying Invariants
If a northbound train approaches, the state eventually transitions to `ringing, arms_down` state and the second `ringing, arms_up` state. A southbound train approaching during either of these states won't trigger the alarm to stay on and the barrier to stay lowered. This violates invariant 7.

If a train goes the opposite way, it will trigger the depart sensor before the approach sensor. The initial state only transistions to 'ringing, arms up'. The train will be present at the crossing, with no barrier lowered or alarm on. This violates invariants 3 and 4.

### Check your work

#### Josh's FSM
When a train triggers nb_depart or sb_depart first, the program won't leave the idle state, and thus the barriers are never lowered. Then the train triggers nb_approach or sb_approach afterwards, despite them requiring them to activate first. This violates invariant 3.

#### Nick's FSM
The only transition from the `present` state is if `nb_depart` and `sb_approach` are triggered. If no southbound train approaches, the system will stay in the `present` state even after the northbound train departs and triggers the `nb_depart` signal. This violates invariant 11.

## Prove it.

| number | arms_down | alarm_on | northbound_present | southbound_present | north_approach | south_approach | north_depart | south_depart | elapsed | safety_hazard |
|--------|-----------|----------|--------------------|--------------------|----------------|----------------|--------------|--------------|---------|---------------|
| 0      | 0         | 0        | 0                  | 0                  | 6              | 5              | 16           | 16           | 0       |               |
| 1      | 0         | 0        | 0                  | 1                  | 15             | 20             | 16           | 4            | 13      | 17            |
| 2      | 0         | 0        | 1                  | 0                  | 20             | 15             | 4            | 16           | 14      | 17            |
| 3      | 0         | 0        | 1                  | 1                  | 20             | 20             | 13           | 14           | 15      | 17            |
| 4      | 0         | 1        | 0                  | 0                  | 6              | 5              | 4            | 4            | 0       |               |
| 5      | 0         | 1        | 0                  | 1                  | 7              | 5              | 16           | 4            | 13      |               |
| 6      | 0         | 1        | 1                  | 0                  | 6              | 7              | 4            | 16           | 14      |               |
| 7      | 0         | 1        | 1                  | 1                  | 7              | 7              | 5            | 6            | 15      |               |
| 8      | 1         | 0        | 0                  | 0                  | 19             | 19             | 16           | 16           | 18      | 18            |
| 9      | 1         | 0        | 0                  | 1                  | 15             | 13             | 16           | 4            | 13      | 18            |
| 10     | 1         | 0        | 1                  | 0                  | 14             | 15             | 4            | 16           | 14      | 18            |
| 11     | 1         | 0        | 1                  | 1                  | 15             | 15             | 13           | 14           | 15      | 18            |
| 12     | 1         | 1        | 0                  | 0                  | 19             | 19             | 16           | 16           | 18      |               |
| 13     | 1         | 1        | 0                  | 1                  | 15             | 20             | 16           | 4            | 18      |               |
| 14     | 1         | 1        | 1                  | 0                  | 20             | 15             | 4            | 16           | 18      |               |
| 15     | 1         | 1        | 1                  | 1                  | 20             | 20             | 13           | 14           | 18      |               |

| number | invariant |
|--------|-----------|
| 16     | All trains go the correct way on its track |
| 17     | All barriers are lowered when any train arrives at the crossing |
| 18     | The alarm is always on while the barrier is down |
| 19     | The barrier is only lowered when a train is present |
| 20     | At most one train is present on a track at a time |


## Model checking
