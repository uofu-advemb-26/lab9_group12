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

### Verifying Invariants
If a northbound train approaches, the state eventually transitions to `ringing, arms_down` state and the second `ringing, arms_up` state. A southbound train approaching during either of these states won't trigger the alarm to stay on and the barrier to stay lowered. This violates invariant 7.

If a train goes the opposite way, it will trigger the depart sensor before the approach sensor. The initial state only transistions to 'ringing, arms up'. The train will be present at the crossing, with no barrier lowered or alarm on. This violates invariants 3 and 4.

### Check your work


## Prove it.

| number | arms_down | alarm_on | northbound_present | southbound_present | north_approach | south_approach | north_depart | south_depart | elapsed | safety_hazard |
|--------|-----------|----------|--------------------|--------------------|----------------|----------------|--------------|--------------|---------|---------------|
| 0      | 0         | 0        | 0                  | 0                  |                |                |              |              |         |               |
| 1      | 0         | 0        | 0                  | 1                  |                |                |              |              |         |               |
| 2      | 0         | 0        | 1                  | 0                  |                |                |              |              |         |               |
| 3      | 0         | 0        | 1                  | 1                  |                |                |              |              |         |               |
| 4      | 0         | 1        | 0                  | 0                  |                |                |              |              |         |               |
| 5      | 0         | 1        | 0                  | 1                  |                |                |              |              |         |               |
| 6      | 0         | 1        | 1                  | 0                  |                |                |              |              |         |               |
| 7      | 0         | 1        | 1                  | 1                  |                |                |              |              |         |               |
| 8      | 1         | 0        | 0                  | 0                  | 14             | 13             | 16           | 16           | 19      | 19            |
| 9      | 1         | 0        | 0                  | 1                  | 15             | 13             | 16           | 4            | 19      | 19            |
| 10     | 1         | 0        | 1                  | 0                  | 14             | 15             | 4            | 16           | 19      | 19            |
| 11     | 1         | 0        | 1                  | 1                  | 15             | 15             | 13           | 14           | 19      | 19            |
| 12     | 1         | 1        | 0                  | 0                  | 14             | 13             | 16           | 16           | 19      |               |
| 13     | 1         | 1        | 0                  | 1                  | 15             | 13             | 16           | 12           | 19      |               |
| 14     | 1         | 1        | 1                  | 0                  | 14             | 15             | 12           | 16           | 19      |               |
| 15     | 1         | 1        | 1                  | 1                  | 15             | 15             | 13           | 14           | 19      |               |

| number | invariant |
|--------|-----------|
| 16     |           |
| 19     | alarm not on when barrier low |

## Model checking
