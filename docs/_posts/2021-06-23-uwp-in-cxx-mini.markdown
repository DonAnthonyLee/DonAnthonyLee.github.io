---
layout: post
title:  "用 C++/CX 写的最小 UWP 程序"
date:   2021-06-21 13:00:00 +0800
categories: UWP
---

看了一段时间的 C++/WinRT，显然不是美女。。。
C++/CX 还凑合，顺道弄了个最少代码的 UWP Hello World。


```c++
#include <SDKDDKVer.h>
#include <windows.h>

using namespace Windows;
using namespace Windows::ApplicationModel::Core;
using namespace Windows::UI;
using namespace Windows::UI::Core;

ref class MyFrameworkView : IFrameworkView
{
public:
	virtual void Initialize(CoreApplicationView ^applicationView)
	{
	}

	virtual void Load(Platform::String ^entryPoint)
	{
	}


	virtual void Run()
	{
		while(true)
		{
			m_window->Dispatcher->ProcessEvents(CoreProcessEventsOption::ProcessAllIfPresent);
			// TODO
		}
	}


	virtual void SetWindow(CoreWindow ^window)
	{
		m_window = window;
		m_window->PointerCursor = ref new CoreCursor(CoreCursorType::Arrow, 0);
	}

	virtual void Uninitialize()
	{
	}

private:
	Platform::Agile<CoreWindow> m_window;
};


ref class MyFrameworkViewSource : IFrameworkViewSource
{
public:
	virtual IFrameworkView^ CreateView()
	{
		return ref new MyFrameworkView();
	}
};


int __stdcall wWinMain(HINSTANCE, HINSTANCE, PWSTR, int)
{
	CoreApplication::Run(ref new MyFrameworkViewSource());
	return 0;
}
```

