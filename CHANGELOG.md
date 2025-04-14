# Changelog

[Current Draft]: https://github.com/RoboCupAtHome/RuleBook/compare/2025.1..HEAD
[2025.1]: https://github.com/RoboCupAtHome/RuleBook/compare/2024.2..2025.1
[2024.2]: https://github.com/RoboCupAtHome/RuleBook/compare/2024.1..2024.2
[2024.1]: https://github.com/RoboCupAtHome/RuleBook/compare/2023.2..2024.1
[2023.2]: https://github.com/RoboCupAtHome/RuleBook/compare/2023.1..2023.2
[2023.1]: https://github.com/RoboCupAtHome/RuleBook/compare/2019.v1..2023.1


All notable changes to this project will be documented in this file.

## Rulebook [Current Draft]

## Rulebook [2025.1] - 2025-04-14
* [#946](https://github.com/RoboCupAtHome/RuleBook/pull/946), [#947](https://github.com/RoboCupAtHome/RuleBook/pull/947): Various small Scoring Changes.
  * Receptionist: The Time of the test only starts after the fist person enters the arena or 2mins after start signal which results in up to two extra minutes for opening the door for the first guest.
* [#943](https://github.com/RoboCupAtHome/RuleBook/pull/943): New HRI Task `Give Me A Hand` replacing Stickler. Checkout the pull request for more information.
* [#938](https://github.com/RoboCupAtHome/RuleBook/pull/938): Higher number of problems for egpsr.
  * Increase number of generated problems to increase audience engagement.
  * Solving the same category repeatedly now gives less points.
  * Setup Generator is now hosted in [RoboCupAtHome/CommandGenerator](https://github.com/RoboCupAtHome/CommandGenerator)
* [#928](https://github.com/RoboCupAtHome/RuleBook/pull/928): New Finals. Checkout the pullrequest for the rationale.
  * Task-like final instead of presentation
  * Based on EGPSR with addtion of opening and closing doors (arena, cabinet and dishwasher)
* [#921](https://github.com/RoboCupAtHome/RuleBook/pull/921): Restart of the robot during Challenge
  * Introduced a rule allowing teams to request a single restart per attempt with specific conditions, including a 30-second penalty. Teams must leave the arena with the robot, requeue, and begin again within their remaining time.
* [#935](https://github.com/RoboCupAtHome/RuleBook/pull/935): Add additional task to storing groceries
  * Use both doors
  * add refilling storage containers (pouring)
  * add grasping from shopping bag
  * increase time limit to 7 minutes
* [#936](https://github.com/RoboCupAtHome/RuleBook/pull/936): Extend Clean The Table
  * Put drink items into Trash
  * Wipe the Table under Drinks
  * misc scoring changes
* [#933](https://github.com/RoboCupAtHome/RuleBook/pull/933): Remove serve breakfast task to free up time during stage one
* [#920](https://github.com/RoboCupAtHome/RuleBook/pull/920): DSPL: Allow a mounted microphone on hsr.
* [#922](https://github.com/RoboCupAtHome/RuleBook/pull/922): Remove Bonus for perceived social intelligence as the survey was too hard to conduct in Robocup settings.
* [#917](https://github.com/RoboCupAtHome/RuleBook/pull/917) revert: split document into Rulebook and Organization document
* [#887](https://github.com/RoboCupAtHome/RuleBook/pull/887): Remove Social Standard Platform League. 
  * The League does have a low number of participants. 
  * Former SSPL Teams can participate in the OPL and thus modify the Robot.
* [#903](https://github.com/RoboCupAtHome/RuleBook/pull/903): `Carry my luggage` to `Help Me Carry`
* [#908](https://github.com/RoboCupAtHome/RuleBook/pull/908): Remove the possibility of doing other task during gpsr slot 

## Rulebook [2024.2] - 2024-05-03
Updated release based on German Open feedback.
* [#862](https://github.com/RoboCupAtHome/RuleBook/pull/862): Storing Groceries
* [#863](https://github.com/RoboCupAtHome/RuleBook/pull/863): Receptionist
* [#864](https://github.com/RoboCupAtHome/RuleBook/pull/864): Carry my Luggage
* [#865](https://github.com/RoboCupAtHome/RuleBook/pull/865): GPSR
* [#866](https://github.com/RoboCupAtHome/RuleBook/pull/866): Restaurant
* [#867](https://github.com/RoboCupAtHome/RuleBook/pull/867): Stickler for the Rules
* [#868](https://github.com/RoboCupAtHome/RuleBook/pull/868): EGPSR
* [#869](https://github.com/RoboCupAtHome/RuleBook/pull/869): Serve Breakfast
* [#870](https://github.com/RoboCupAtHome/RuleBook/pull/870): Scoresheet cleanup

## Rulebook [2024.1] - 2024-03-05
* split document into Rulebook and Organization document [(PR)](https://github.com/RoboCupAtHome/RuleBook/pull/831)
  * RoboCup@Home Rulebook: Rules and Regulations for the competition.
  * RoboCup@Home Organization document: Rules and Regulations on the organization of the competition
* [New Command Generator for GPSR](https://github.com/johaq/CommandGenerator/tree/master)
* updated Task: EGPSR [(PR)](https://github.com/RoboCupAtHome/RuleBook/pull/844)
  * Robot has to restore the default arena state and requests
* add a social survey in restaurant and receptionist tasks [(PR)](https://github.com/RoboCupAtHome/RuleBook/pull/839)
* requesting Deus Ex Machina assistance now requires the robot to show its perception [(PR)](https://github.com/RoboCupAtHome/RuleBook/pull/838)
* small scoring items for attempting tasks, and more consistent scoring between tests [(PR)](https://github.com/RoboCupAtHome/RuleBook/pull/843)
