//Manipulation of Stim injectors with level4 pointers and shared Health address that is divided to Friendly and Enemy.
//shows how to manage and eliminate Unreal engine 4 case of "ENEMY GOD MODES".
<?xml version="1.0" encoding="utf-8"?>
<CheatTable CheatEngineTableVersion="20">
  <CheatEntries>
    <CheatEntry>
      <ID>1</ID>
      <Description>"Health"</Description>
      <LastState/>
      <VariableType>Auto Assembler Script</VariableType>
      <AssemblerScript>[ENABLE]
//code from here to '[DISABLE]' will be used to enable the cheat
alloc(newmem,2048,"starwarsjedifallenorder.exe"+EE0B8FD)
alloc(saveEAX,4)
label(player)
label(returnhere)
label(originalcode)
label(exit)

newmem: //this is allocated memory, you have read,write,execute access
//place your code here
cmp [rbx+000001BC+C],#16 //if player
je player
originalcode:
movss [rbx+000001BC],xmm1

exit:
jmp returnhere
///////////////
player:
mov [saveEAX],eax
mov eax,[rbx+000001BC-4] //this is MaxHP of Cal as of this point in game
mov [rbx+000001BC],eax //move the MaxHP to HP address
mov eax,[saveEAX] //restore eax
jmp exit

"starwarsjedifallenorder.exe"+EE0B8FD:
jmp newmem
nop
nop
nop
returnhere:


 
 
[DISABLE]
//code from here till the end of the code will be used to disable the cheat
dealloc(newmem)
"starwarsjedifallenorder.exe"+EE0B8FD:
movss [rbx+000001BC],xmm1
//Alt: db F3 0F 11 8B BC 01 00 00
</AssemblerScript>
    </CheatEntry>
    <CheatEntry>
      <ID>11</ID>
      <Description>"Stim Pointers"</Description>
      <Options moHideChildren="1"/>
      <LastState Value="" Activated="1" RealAddress="00000000"/>
      <GroupHeader>1</GroupHeader>
      <CheatEntries Activated="1">
        <CheatEntry>
          <ID>6</ID>
          <Description>"Stims"</Description>
          <VariableType>4 Bytes</VariableType>
          <Address>"OrangeEmu64.dll"+002D01B0</Address>
          <Offsets>
            <Offset>4A0</Offset>
            <Offset>380</Offset>
            <Offset>160</Offset>
            <Offset>220</Offset>
            <Offset>7C0</Offset>
          </Offsets>
        </CheatEntry>
        <CheatEntry>
          <ID>8</ID>
          <Description>"Stims"</Description>
          <VariableType>4 Bytes</VariableType>
          <Address>"OrangeEmu64.dll"+00333BB0</Address>
          <Offsets>
            <Offset>4A0</Offset>
            <Offset>380</Offset>
            <Offset>20</Offset>
            <Offset>220</Offset>
            <Offset>7C0</Offset>
          </Offsets>
        </CheatEntry>
        <CheatEntry>
          <ID>9</ID>
          <Description>"Stims"</Description>
          <LastState Value="0" RealAddress="79DC1680"/>
          <VariableType>4 Bytes</VariableType>
          <Address>"starwarsjedifallenorder.exe"+03368018</Address>
          <Offsets>
            <Offset>4A0</Offset>
            <Offset>40</Offset>
            <Offset>2A0</Offset>
            <Offset>4D0</Offset>
          </Offsets>
        </CheatEntry>
        <CheatEntry>
          <ID>10</ID>
          <Description>"Stims"</Description>
          <LastState Value="0" RealAddress="79DC1680"/>
          <VariableType>4 Bytes</VariableType>
          <Address>"THREADSTACK1"-000006B0</Address>
          <Offsets>
            <Offset>4A0</Offset>
            <Offset>70</Offset>
            <Offset>A0</Offset>
            <Offset>30</Offset>
            <Offset>4A0</Offset>
          </Offsets>
        </CheatEntry>
      </CheatEntries>
    </CheatEntry>
  </CheatEntries>
  <CheatCodes>
    <CodeEntry>
      <Description>Code :movss [rbx+000001BC],xmm1 health</Description>
      <Address>14EE0B8FD</Address>
      <ModuleName>starwarsjedifallenorder.exe</ModuleName>
      <ModuleNameOffset>EE0B8FD</ModuleNameOffset>
      <Before>
        <Byte>00</Byte>
        <Byte>00</Byte>
        <Byte>0F</Byte>
        <Byte>97</Byte>
        <Byte>D0</Byte>
      </Before>
      <Actual>
        <Byte>F3</Byte>
        <Byte>0F</Byte>
        <Byte>11</Byte>
        <Byte>8B</Byte>
        <Byte>BC</Byte>
        <Byte>01</Byte>
        <Byte>00</Byte>
        <Byte>00</Byte>
      </Actual>
      <After>
        <Byte>0F</Byte>
        <Byte>B6</Byte>
        <Byte>C8</Byte>
        <Byte>88</Byte>
        <Byte>83</Byte>
      </After>
    </CodeEntry>
    <CodeEntry>
      <Description>Code :mov [rax],ecx hpStims</Description>
      <Address>7FF93C6313BA</Address>
      <ModuleName>VCRUNTIME140.dll</ModuleName>
      <ModuleNameOffset>13BA</ModuleNameOffset>
      <Before>
        <Byte>48</Byte>
        <Byte>0A</Byte>
        <Byte>C3</Byte>
        <Byte>8B</Byte>
        <Byte>0A</Byte>
      </Before>
      <Actual>
        <Byte>89</Byte>
        <Byte>08</Byte>
      </Actual>
      <After>
        <Byte>C3</Byte>
        <Byte>0F</Byte>
        <Byte>1F</Byte>
        <Byte>00</Byte>
        <Byte>8B</Byte>
      </After>
    </CodeEntry>
  </CheatCodes>
  <UserdefinedSymbols/>
</CheatTable>
