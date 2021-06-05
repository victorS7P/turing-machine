
<h1>
Turing Machine
</h1>
This is the code of a turing machine that does multiplication or potentiation on a binary tape.

### ▶️ Running

You can use the machine just using Ruby to running the main script with some flags:
```bash
ruby ./main.rb -m 0011 true
```
- The first flag need to be `-m` for the multiplication machine or `-p` for the power of machine.
- The second flag need to be the initial tape state
- The last flag is optional, and means that you wish to have a print of the machine proccess.  

<b>The output will be the final state of the tape.</b>

#### Examples:

Do 2 * 2 with print process:
```bash
ruby ./main.rb -m 0011 true
```
<br/>

Do 3 ^ 1 ^ 4 without printing the process:
```bash
ruby ./main.rb -p 00010000
```
<br/>

Do 2 * 2 * 2 *2 without printing the process:
```bash
ruby ./main.rb -m 00110011
```

<br/>
---
<h4>Victor Costa - BCC IV</h4>