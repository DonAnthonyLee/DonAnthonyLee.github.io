---
layout: post
title:  "用 C++/CX 写的最小 UWP 程序"
date:   2021-06-23 17:00:00 +0800
categories: UWP
---

看了一段时间的 C++/WinRT，显然不是美女。。。

C++/CX 还凑合，顺道弄了个最少代码的 UWP Hello World。


```c++
#include <SDKDDKVer.h>
#include <windows.h>
#include <collection.h>

using namespace Windows;
using namespace Windows::ApplicationModel::Core;
using namespace Windows::UI;
using namespace Windows::UI::Core;

ref class MyFrameworkView : IFrameworkView
{
public:
	virtual void Initialize(CoreApplicationView ^applicationView)
	{
		// 初始化，通常 Xaml 调用自动生成的 InitializeComponent()
	}

	virtual void Load(Platform::String ^entryPoint)
	{
	}

	virtual void SetWindow(CoreWindow ^window)
	{
		m_window = window;

		// UWP 应用窗口激活，否则将抛出异常
		m_window->Activate();
	}

	virtual void Run()
	{
		// 事件循环
		while(true)
		{
			m_window->Dispatcher->ProcessEvents(CoreProcessEventsOption::ProcessAllIfPresent);

			// 此处可加入终止循环判别，亦可处理 D2D、D3D 等等
		}
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
		// 返回对象将用于创建 CoreWindow 并调用其 Initialize() => Load() => Run() => Uninitialize() 序列
		// 每 CoreWindow 将对应创建相应线程
		return ref new MyFrameworkView();
	}
};


int __cdecl main(::Platform::Array<::Platform::String^>^ args)
{
	// 主线程运行 Application 事件循环
	CoreApplication::Run(ref new MyFrameworkViewSource());
	return 0;
}
```

