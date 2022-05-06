---
layout: post
title:  "Win32API+WinRT+WinUI 杂揉"
date:   2022-05-06 23:59:00 +0800
categories: UWP
---

实在看不惯 WinUI 和 C# 紧紧地绑在一起，于是乎查了很多微软的文档，也上网搜了一下，整出个 Win32API、WinRT、WinUI 三者杂揉在一起的简单程序。

功能：显示 WinUI 弹出式菜单。

特点：无需像此前 UWP 需要有 CoreWindow 才能工作的要求，也不需要打包成 Package 运行。


```c++
#include <SDKDDKVer.h>
#include <windows.h>
#include <collection.h>
#include <shobjidl.h>
#include <ppltasks.h>
#include <iostream>

#include <winrt/Windows.Foundation.Collections.h>
#pragma comment(lib, "windowsapp")

using namespace Concurrency;
using namespace Platform;
using namespace Windows;
using namespace Windows::Foundation;
using namespace Windows::Foundation::Collections;

using namespace Windows::UI;
using namespace Windows::UI::Core;
using namespace Windows::UI::Popups;


void winui_popup_menu_test(HWND hwnd)
{
        auto menu = ref new PopupMenu();

	IInitializeWithWindow* pInitializeWithWindow = NULL;
	reinterpret_cast<::IUnknown*>(menu)->QueryInterface(IID_IInitializeWithWindow, (LPVOID*)(&pInitializeWithWindow));
	pInitializeWithWindow->Initialize(hwnd);
	pInitializeWithWindow->Release();

        menu->Commands->Append(ref new UICommand("Item 1", nullptr, PropertyValue::CreateInt32(1)));
        menu->Commands->Append(ref new UICommandSeparator());
        menu->Commands->Append(ref new UICommand("Item 2", nullptr, PropertyValue::CreateInt32(2)));
        menu->Commands->Append(ref new UICommand("Item 3", nullptr, PropertyValue::CreateInt32(3)));

	Rect rectContent(100, 100, 200, 500);
        create_task(menu->ShowForSelectionAsync(rectContent)).then([](IUICommand^ command)
        {
            if (command != nullptr)
            {
                int const id = safe_cast<IBox<int>^>(command->Id)->Value;
		std::cout << "Item " << id << " selected" << std::endl;
            }
	    else
	    {
		std::cout << "Context menu dismissed" << std::endl;
	    }
        });
        std::cout << "Context menu shown" << std::endl;
}


static UINT msg_test = 0;
static LRESULT CALLBACK MainWndProc(HWND hWnd, UINT umsg, WPARAM wParam, LPARAM lParam)
{
	if (umsg == msg_test)
	{
		winui_popup_menu_test(hWnd);
		return 0;
	}

	return DefWindowProc(hWnd, umsg, wParam, lParam);
}


int main(int argc, char **argv)
{
	winrt::init_apartment(winrt::apartment_type::single_threaded);

	WNDCLASSEX wcApp = {0};
	ZeroMemory(&wcApp, sizeof(wcApp));
	wcApp.lpszClassName = "test";
	wcApp.hInstance = GetModuleHandle(NULL);
	wcApp.lpfnWndProc = MainWndProc;
	wcApp.cbSize = sizeof(wcApp);
	RegisterClassEx(&wcApp);

	HWND hWnd = CreateWindowExA(0, "test", "test", WS_DISABLED, 0, 0, 500, 500, NULL, NULL, GetModuleHandle(NULL), NULL);
	msg_test = RegisterWindowMessage("MY_TEST");
	PostMessageA(hWnd, msg_test, 0, 0);

	MSG message;
 	while(GetMessage(&message, nullptr, 0, 0))
	{
		DispatchMessage(&message);
	}

	winrt::clear_factory_cache();
	winrt::uninit_apartment();

	return 0;
}
```

