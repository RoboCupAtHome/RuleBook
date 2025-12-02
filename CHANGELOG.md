# Changelog

[Current Draft]: https://github.com/RoboCupAtHome/RuleBook/compare/2025.1..HEAD
[2026.1]: https://github.com/RoboCupAtHome/RuleBook/compare/2025.1..2026.1
[2025.1]: https://github.com/RoboCupAtHome/RuleBook/compare/2024.2..2025.1
[2024.2]: https://github.com/RoboCupAtHome/RuleBook/compare/2024.1..2024.2
[2024.1]: https://github.com/RoboCupAtHome/RuleBook/compare/2023.2..2024.1
[2023.2]: https://github.com/RoboCupAtHome/RuleBook/compare/2023.1..2023.2
[2023.1]: https://github.com/RoboCupAtHome/RuleBook/compare/2019.v1..2023.1


All notable changes to this project will be documented in this file.

## Rulebook [Current Draft]

* [1007](https://github.com/RoboCupAtHome/RuleBook/pull/1007) fix using wrong 'not attending penalty' in penalty section

## Rulebook [2026.1] - 2025-12-01

* [#998](https://github.com/RoboCupAtHome/RuleBook/pull/998) Update **GPSR**
  * Add rephrasing by llm and corresponding rulings.
  * Removed non-expert operator as rephrasing is now included.
* [#999](https://github.com/RoboCupAtHome/RuleBook/pull/999) Update **Final**
  * Just add rulings - **Final** still uses old EGPSR Task Rulings
* [#994](https://github.com/RoboCupAtHome/RuleBook/pull/994): New Task **Pick and Place Challenge**
  * Combines aspects of **Storing Groceries**, **Serve Breakfast** and **Clean the Table**
  * Robot is free to choose what parts to solve.
* [#995](https://github.com/RoboCupAtHome/RuleBook/pull/995): Rename **Receptionist** → **Human Robot Interaction Challenge**
  * Removed predetermined list of names and drinks; now any English name can be chosen.
  * Removed drink location requirement, as object recognition is not the task focus.
  * Added a short following (“help me carry”) procedure at the end.
  * Added doorbell/knock recognition.
* [#997](https://github.com/RoboCupAtHome/RuleBook/pull/997): Removed QR codes from Rulebook.
  * Showing QR code is too unnatural.
  * added clarifications to natural alternative HRI (i.e. touchscreens)
* [#990](https://github.com/RoboCupAtHome/RuleBook/pull/990): New Restart Rule
  * A restart no longer requires requeuing. Instead the team immediately continues with the second attempt.
  * Test time continues running, and the team must resume the test within 1 minute.
  * All points scored before the restart are voided.
* [#990](https://github.com/RoboCupAtHome/RuleBook/pull/990): Remove Stage system
  * The stage system was removed to simplify the competition format.
  * Previously, only a subset of teams advanced to later stages, which limited participation and reduced the number of runs per team. In the new format, all teams compete in the same set of tasks across multiple days, ensuring more consistent evaluation.
  * The new structure also allows teams to demonstrate progress and improve their performance over the course of the competition.
  * The number of tasks was reduced to four (repeated each day) plus the Restaurant test.
    * Removed **EGPSR**
    * Removed **Help me Carry**
  * A goal is to reduce unnecessary repetition of skills across tasks, making each task more meaningful and distinct.
* [#987](https://github.com/RoboCupAtHome/RuleBook/pull/987): Merge both leagues - Remove DSPL. 
  * A single, unified RoboCup@Home league takes effect immediately. 
* [#969](https://github.com/RoboCupAtHome/RuleBook/pull/969): Remove optional Tray in **Clean the Table**

## Rulebook [2025.1] - 2025-04-14
* [#946](https://github.com/RoboCupAtHome/RuleBook/pull/946), [#947](https://github.com/RoboCupAtHome/RuleBook/pull/947): Various small scoring changes.
  * **Receptionist**: : Test time now starts only after the first person enters the arena or two minutes after the start signal, allowing up to two extra minutes to open the door for the first guest.
* [#943](https://github.com/RoboCupAtHome/RuleBook/pull/943): New HRI task **Give Me A Hand** replacing Stickler. See the pull request for full details.
* [#938](https://github.com/RoboCupAtHome/RuleBook/pull/938): Expanded problem set for **EGPSR**.
  * Increased the number of generated problems to boost audience engagement.
  * Repeatedly solving the same category now awards fewer points.
  * Setup generator moved to [RoboCupAtHome/CommandGenerator](https://github.com/RoboCupAtHome/CommandGenerator).
* [#928](https://github.com/RoboCupAtHome/RuleBook/pull/928): New **Finals** format introduced. Check out the pull request for the rationale.
  * Finals are now task-like instead of a presentation.
  * Based on **EGPSR**, with the addition of opening and closing doors (arena, cabinet, and dishwasher).
* [#921](https://github.com/RoboCupAtHome/RuleBook/pull/921):  New Robot restart procedure during challenges.
  * Teams may request one restart per attempt, subject to a 30-second penalty. 
  * Restart requires the team to leave the arena, requeue, and restart within their remaining time.
* [#935](https://github.com/RoboCupAtHome/RuleBook/pull/935): Add additional tasks to storing groceries.
  * Use of both cabinet doors required.
  * Add refilling storage containers (pouring).
  * Add grasping from the shopping bag.
  * Increase time limit to 7 minutes.
* [#936](https://github.com/RoboCupAtHome/RuleBook/pull/936): Extend **Clean the Table**.
  * Put drink items into trash.
  * Wipe the table under drinks.
  * Miscellaneous scoring changes.
* [#933](https://github.com/RoboCupAtHome/RuleBook/pull/933): Remove **Serve Breakfast** task to optimize Stage 1 schedule.
* [#920](https://github.com/RoboCupAtHome/RuleBook/pull/920): DSPL: Mounted microphones now permitted on the HSR robot.
* [#922](https://github.com/RoboCupAtHome/RuleBook/pull/922): Removed bonus for perceived social intelligence, as the evaluation was impractical at RoboCup.
* [#917](https://github.com/RoboCupAtHome/RuleBook/pull/917): Reverted the split between Rulebook and Organization document.
* [#887](https://github.com/RoboCupAtHome/RuleBook/pull/887): Discontinued the **Social Standard Platform League**.
  * Low participation levels.
  * Former SSPL teams may now join the Open Platform League (OPL) and modify their robots.
* [#903](https://github.com/RoboCupAtHome/RuleBook/pull/903): Rename **Carry My Luggage** to **Help Me Carry**.
* [#908](https://github.com/RoboCupAtHome/RuleBook/pull/908): Remove the possibility of doing other tasks during the **GPSR** slot.

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
