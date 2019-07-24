Thanks for considering contributing! The league only exists with the support of the community.

## How Can I Contribute?

### Do you have an idea to improve the rules?

Please open [a new GitHub issue](https://github.com/RoboCupAtHome/RuleBook/issues) describing your idea.

### Did you write a fix for a bug?

Contributions to the rulebook must be in the form of pull requests and meet the conventions and policies described in the [contribution guidelines](https://github.com/RoboCupAtHome/RuleBook/wiki/Guidelines:-Contributing). For guidelines about the workflow check [here](https://github.com/RoboCupAtHome/RuleBook/wiki/Guidelines:-Workflow).

### I want to help maintain the league website

We're always looking for volunteers to help in tasks such as organizing and categorizing publications, team videos, memories, scores, press, and writing examples and extended rule explanations. 
Please contact the Organizing Committee.

### Do you want to develop a utility for the competition?

Great! The league has benefited from contributions like the [command generator](https://github.com/kyordhel/GPSRCmdGen) and [VizBox](https://github.com/RoboCupAtHome/vizbox). If you have a specific idea for a new tool for teams or for refereeing, please  [open a new GitHub issue](https://github.com/RoboCupAtHome/RuleBook/issues) describing your proposal.

### Do you want to help run the competition?

The RoboCup @Home Organizing Committee is always looking for volunteers to help run the event. Please contact the committee.


## Contribution Naming Conventions

### Files
TeX files describing test files are named using a *Letter-case separated words* convention in which the first letter of each word is capital. When using acronyms, the next word can be separated with an underscore. All other file names are specified in lowercase (with the exception of acronyms), and separating words with underscores.

The following practices must also be followed:
- Spaces in filenames must be avoided.
- The format for date designations is YYYYMMDD (to ensure chronological order over years).
- File names should be as short as possible (max 25 characters + extension).
- Special characters such as  ~ ! @ # $ % ^ & * ( ) ` ; < > ? , [ ] { } ' " and | should be avoided.
- When using a sequential numbering system, three leading zeros are added for clarity.

### Branches
Branch names use always small caps (except by acronyms) with words separated with the underscore character.

The name of a branch strongly depends on the introduced change type and the function of the change. Branch names must always be short and descriptive, avoiding sequences and special characters. The following branch types are set:
- **```year/```** Used for tests mainly, and other changes targeting an specific year.
  - ```2020/taking_the_bus```
  - ```2025/IKEA_assembly```
- **```feature/```** Used to introduce new features and general rules in the rulebook, as well as changes that affect many tests, or modify the scoring.
  - ```feature/description_of_new_stuff```
  - ```feature/eegpsr_example_scoresheet```
- **```fix/```** Used to address or solve an specific issue
  - ```fix/#185_remove_exact_numbers```
  - ```fix/#500```

**Important Remark:** Branches shall never be merged into ```master```, nor ```master``` shall merge into any branches. Pull Requests are mandatory for merging, and rebase for updating. Also, squash commits are not permitted.