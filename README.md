# flut_tube
跟著it幫的[Flutter---Google推出的跨平台框架，Android、iOS一起搞定](https://ithelp.ithome.com.tw/users/20119550/ironman/2221)一起實作
這個已經是3 4 年前的文章了 也遇到不少問題卡關

- flare_splash_screen 變成 rive_splash_screen
- bloc 已更新過和以前不一樣
    - BlocDelegate 變成 BlocObserver
    - BlocSupervisor.delegate 變成 Bloc.observer
    - Bloc.dispatch 變成 Bloc.add
