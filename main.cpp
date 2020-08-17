#include <Windows.h>
#include <iostream>
#include <vector>
#include <TlHelp32.h>
#include <tchar.h>
 
using namespace std;
 
 
DWORD FindModuleNameAddr(TCHAR *lpszModuleName, DWORD pID) { //func to squeeze the module from the process
	DWORD dwModuleBaseAddress = 0;
	HANDLE hSnapshot = CreateToolhelp32Snapshot(TH32CS_SNAPMODULE, pID);
	MODULEENTRY32 ModuleEntry32 = { 0 };
	ModuleEntry32.dwSize = sizeof(MODULEENTRY32);
 
	if (Module32First(hSnapshot, &ModuleEntry32))
	{
		do {
			if (_tcscmp(ModuleEntry32.szModule, lpszModuleName) == 0)
			{
				dwModuleBaseAddress = (DWORD)ModuleEntry32.modBaseAddr;
				break;
			}
		} while (Module32Next(hSnapshot, &ModuleEntry32));
 
 
	}
	CloseHandle(hSnapshot);
	return dwModuleBaseAddress;
}
 
 
 
 
 
int main() {
	DWORD pID;
	DWORD offset1, offset2, offset3, offset4;
	DWORD baseAddress;
	DWORD stimAddress;
	int newHealth = 5;
	int currentHealth;
	char moduleName[] = "starwarsjedifallenorder.exe";
	HWND hGameWindow;
	HANDLE pHandle;
 
 
 
	//Get Handles
	hGameWindow = FindWindow(NULL, "STAR WARS Jedi: Fallen Order™"); //find the window
	GetWindowThreadProcessId(hGameWindow, &pID);//find the pid using the windows
	cout << "PID is: " <<pID<<'\n';
	pHandle = OpenProcess(PROCESS_ALL_ACCESS, FALSE, pID);// ptiha shel ha RAM of window
 	

	DWORD clientBase = FindModuleNameAddr(_T(moduleName), pID); //search for module
	cout << "clientBase DBG - " << clientBase << '\n';
	ReadProcessMemory(pHandle, (LPCVOID)(
	
	clientBase+0x03368018), &baseAddress, sizeof(baseAddress), NULL);
	cout << "Base ADDR after offset: " << std::hex << baseAddress << std::endl;
	ReadProcessMemory(pHandle, (LPCVOID)(baseAddress+0x4a0), &offset1, sizeof(offset1), NULL);
	cout << "Offset 1: " << std::hex << offset1 << std::endl;
	ReadProcessMemory(pHandle, (LPCVOID)(offset1 + 0x40), &offset2, sizeof(offset2), NULL);
	cout << "Offset 2: " << std::hex << offset2 << std::endl;
	ReadProcessMemory(pHandle, (LPCVOID)(offset2 + 0x2a0), &offset3, sizeof(offset3), NULL);
	cout << "Offset 3: " << std::hex << offset3 << std::endl;
	stimAddress = baseAddress+0x4d0;
	cout << "Final Addy: " << std::hex << stimAddress << std::endl;
	ReadProcessMemory(pHandle, (LPCVOID)(stimAddress), &currentHealth, 4, NULL);
	cout << "Stims Before: " << currentHealth << std::endl;
	WriteProcessMemory(pHandle,(LPVOID)(stimAddress), &newHealth, sizeof(newHealth), 0);
	//ReadProcessMemory(pHandle, (LPCVOID)(stimAddress), &currentHealth, 4, NULL);
	//cout << "Stims After: " << currentHealth << std::endl;
	cin.get();
}
