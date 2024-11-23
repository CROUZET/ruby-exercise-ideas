# Data Correlation

A new feature is under AB tests in our company.

Here some logs from the server:
```text
I, [2023-03-18T19:22:00.152079 #642]  INFO -- : Request_ID:1485, Variant_A: 45€
I, [2023-03-18T19:22:00.152084 #643]  INFO -- : Request_ID:1486, Variant_A: 71€
I, [2023-03-18T19:22:00.152114 #644]  INFO -- : Request_ID:1485, Variant_B: 47€
I, [2023-03-18T19:22:00.152148 #645]  INFO -- : Request_ID:1486, Variant_B: 84€
I, [2023-03-18T19:22:00.152171 #646]  INFO -- : Request_ID:1487, Variant_A: 22€
```

Your goal is tell the market team what is the 'global increase price rate'.

It represent the percent progress between the prices sum of correlable variants A and variants B.

In this example, it should return `12.93`
```text
last line is ignored as there is no Variant_B for the same Request_ID (1487)

45 + 71 = 116 (sum of Variant_A)
47 + 84 = 131 (sum of Variant_B)
(131 - 116) / 116 = 12.93 (global increase rate)
```

Data are taken in consideration only when for a same Request_ID, there are:
- 1 Variant_A (only 1)
- 1 Variant_B (only 1)

Some additional details:
- log lines without request id, variant A or B declaration or price must be ignored
- request ids and variant prices are integers
- Variant_B is always greater or equal to Variant_A for a request id
- the global increase price rate is rounded 2 digits after the decimal point
- global increase price rate is 0 if any of variants sum is zero

---

_Kata updates:_
- _2023-03-20: instructions update + additionnal tests_
- _2023-03-19: add randomly generated spec test_
- _2023-03-18: original_
