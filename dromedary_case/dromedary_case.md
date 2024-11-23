# Dromedary case

> "Dromedary Camels only have one hump on its back."

**Your task is to produce a 'dromedary_case' function formatting any string input with a single hump on the proper place

## What's the proper place for the hump

On the 1st letter of a word. This letter should be as close as possible to the middle of the dromedarized sentence.

## Examples

Let's start with an easy one:
(8 characters before the hump, 8 after)
```ruby
"i am a nice dromedary".dromedary_case
# -> "iamaniceDromedary"
```

But sometimes, the hump balance can be more complex:
(7 characters before the hump and 16 after. But still the better possibility)
```ruby
"camelus-dromedarius for you".dromedary_case
# -> "camelusDromedariusforyou"
```

Only one word? no problem! Let's dromaderize the characters
```ruby
"hump".dromedary_case
# -> "huMp"
```

When the hump lands on a digit, that's fine
```ruby
"you can't find 3 humps camels".dromedary_case
# -> "youcantfind3humpscamels"
```

Nothing to display? 'dromedary' as a backup!
```ruby
"%%%% **** $$$$".dromedary_case
# -> "dromEdary"
```

## Detailed example

Let's list all possibilities for an example. Count letters before and after the capital letter. Then calculate the diff. The best solution is the possibility with the lowest diff.

```text
From: "i wish to do some xenotransplantation on some new planets"

Iwishtodosomexenotransplantationonsomenewplanets => 0 (before) / 47 (after) => 47 (diff)
iWishtodosomexenotransplantationonsomenewplanets => 1 / 46 => 45
iwishTodosomexenotransplantationonsomenewplanets => 5 / 42 => 37
iwishtoDosomexenotransplantationonsomenewplanets => 7 / 40 => 33
iwishtodoSomexenotransplantationonsomenewplanets => 9 / 38 => 29
iwishtodosomeXenotransplantationonsomenewplanets => 13 / 34 => 21
iwishtodosomexenotransplantationOnsomenewplanets => 32 / 15 => 17 [Best Solution]
iwishtodosomexenotransplantationonSomenewplanets => 34 / 13 => 21
iwishtodosomexenotransplantationonsomeNewplanets => 38 / 9 => 29
iwishtodosomexenotransplantationonsomenewPlanets => 41 / 6 => 35

```

This is one way to do the implem, maybe not the best one ^_^

## Additional Rules

Characters:
- word separators: spaces ' ', dashs '-' and underscrores '_'
- words are composed with: letters and digits
- other characters (example: $€,;:/\!§}) should be removed before the dromedarization process
- if there are some digits (on the hump position or not), nevermind

Hump position:
- hump on the right if have to choose (example: 'huMp')

Rescue value:
- returns "dromEdary" if nothing left to process (example: '%% %%')

```text
        _   ___ goodLuck
    .--' | /
   /___^ |     .--.
       ) |    /    \
      /  |  /`      '.
     |   '-'    /     \
     \         |      |\
      \    /   \      /\|
       \  /'----`\   /
       |||       \\ |
       ((|        ((|
       |||        |||
jgs   //_(       //_(
```

### Sources
- camel ascii art: https://www.asciiart.eu/animals/camels

### Versions

- 2023-05-13: bug-fixes & doc
- 2023-05-12: initial
