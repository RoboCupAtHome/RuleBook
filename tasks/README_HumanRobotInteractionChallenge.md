# Human Robot Interaction Challenge - design notes

> Temporary working document. This file records design intent while the 2027
> task is being developed and is not part of the published rulebook.

## Motivation

The task should reward generic service-robot behavior rather than solutions
scripted around information announced in advance. If teams know, for example,
that a person in the bedroom will ask for a drink, a robot can drive directly to
the bedroom and ask which drink the person wants. That demonstrates execution
of a known script, but not the ability to notice and assist people naturally in
a domestic environment.

Instead, the robot should enter a populated house, explore it, and determine who
needs assistance from natural social cues. A person calls or waves to attract
the robot's attention only while the robot is in the same room as that person,
so waiting for a call does not replace exploration. The robot should approach
only someone who is requesting its
attention, rather than treating every detected person as a task endpoint.

## Scenario

- A social event or party takes place throughout the house.
- Seven designated requesters are distributed naturally across several rooms.
- Additional people may be present throughout the house as bystanders.
- Both designated requesters and bystanders may move naturally around the house,
  as people would during a normal social event.
- Teams do not know in advance who needs assistance, where requesters are, or
  what requests they will make.
- Requests are embedded in the six defined interaction scenarios and emphasize
  conversation, social attention, interruption handling, and learning through
  interaction rather than general-purpose command understanding and execution.
- The robot maintains dynamic gaze toward its conversation partner while still
  allowing natural or safety-related gaze shifts.

## Interaction types

There are only two interaction types. The six scenarios define how one of these
two types is presented and handled; they are not an additional type.

1. **Provide information:** The robot answers a question during the
   conversation. Questions are limited to objects and object classes, rooms and
   furniture inside the arena, the date and time, the competition, or the robot
   and its team, including the team's history and past events in which the team
   participated.
2. **Deliver an object:** All requested objects are kept at a barman table. The
   robot communicates the order to the barman, asks the barman to place the
   object on the robot, confirms that it has received the object, and returns it
   to the requester. The robot is not expected to search for, identify, or pick
   up the object itself.

The first version defines six interaction scenarios for the seven requesters.
The two-person drink request uses two requesters; the other five scenarios use
one requester each. Exact scripts, difficulty balance, and most numerical
scoring remain for a later design stage.

## Initial interaction scenarios

1. **Follow while conversing:** A person asks the robot to follow them and
   starts a conversation while the robot is following. This evaluates whether
   navigation and active conversation can run concurrently.
2. **Full-duplex conversation:** A person speaks or responds while the robot is
   speaking. The robot should detect the interruption, yield or adapt naturally,
   and continue without losing conversational context.
3. **Correcting a request:** A person gives a command and, as the robot begins
   moving, calls it, asks it to stop, and changes part of the command. The robot
   should stop safely and execute the corrected request rather than the original
   one.
4. **Two simultaneous drink requests:** Two people ask for different drinks at
   approximately the same time. The robot should manage the overlap, understand
   both requests, retain the correct drink-to-person association, communicate
   both orders to the barman, and deliver each drink to the correct person.
5. **Local-language interaction:** A person speaks a language used in the host
   region, and the robot should understand and reply in the same language. The
   OC selects the language used for the test.
6. **Learning a new drink:** A person teaches the robot about a drink outside
   the announced known and common object lists, provides uniquely distinguishing
   information, and then asks for it. The robot must communicate the learned
   drink to the barman and deliver the drink that the barman places on the robot.
   This evaluates learning from interaction rather than recognition from a
   pre-trained object set.

## Design goals

1. Encourage a reusable explore-observe-interact-assist loop instead of a fixed
   sequence tied to known people and rooms.
2. Evaluate whether the robot understands that a person is requesting its
   attention through speech, waving, or other natural cues used only when the
   robot is present in the same room.
3. Evaluate selective social attention: the robot should assist requesters
   without disturbing bystanders.
4. Support varied, measurable interactions that can later cover multimodal
   communication, clarification, interruption handling, and multi-person
   dialogue.
5. Keep the research focus on human--robot interaction rather than
   general-purpose command understanding and execution.
6. Evaluate attentive behavior through dynamic gaze during conversation.
7. Keep the scenario understandable to teams, referees, volunteers, and
   spectators while avoiding disclosure that enables hard-coded solutions.

## Known environment decision

The former Restaurant task evaluated capabilities in an unknown environment.
When that task was removed, the rulebook change stated that relevant research
topics would be incorporated into other tasks. One candidate was navigation in
unknown or changed environments, including discussion of moving furniture for
this HRI task.

This task will not deliberately move furniture or invalidate the robot's map.
The intended deployment scenario is a domestic robot operating in the home of
the person who owns it; it is reasonable to assume that the robot is allowed to
map that home. The research focus here is discovering requests and managing
natural interaction, not remapping a deliberately rearranged arena. Robots must
still handle ordinary incidental variation, people moving through the house,
and safe navigation in a populated environment.

## Open design questions

- How should each interaction scenario be scored objectively and balanced
  against the others?
- Should attention cues be verbal, gestural, or selected from both at runtime?
- How should partial credit distinguish discovering a requester, understanding
  the request, and completing the interaction successfully?
- Which information and objects may be announced during setup without making
  the solution scriptable?
- How much variation should volunteers be allowed within each interaction while
  preserving comparable difficulty between teams?

## Related issues

- [#996 - Discuss HRI](https://github.com/RoboCupAtHome/RuleBook/issues/996)
- [#941 - Ideas for HRI Task (Receptionist & Stage 2)](https://github.com/RoboCupAtHome/RuleBook/issues/941)

## Suggestions for future improvements

- Increase variation within each interaction scenario while keeping the
  assessed capability centered on natural communication and social behavior.
- Add further multimodal interaction cues and conversational repair strategies
  once objective and repeatable scoring criteria have been established.
