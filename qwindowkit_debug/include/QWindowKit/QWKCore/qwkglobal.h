// Copyright (C) 2023-2024 Stdware Collections
// SPDX-License-Identifier: Apache-2.0

#ifndef QWKGLOBAL_H
#define QWKGLOBAL_H

#include <functional>

#include <QtCore/QEvent>
#include <QtGui/QtEvents>

#ifndef QWK_CORE_EXPORT
#  ifdef QWK_CORE_STATIC
#    define QWK_CORE_EXPORT
#  else
#    ifdef QWK_CORE_LIBRARY
#      define QWK_CORE_EXPORT Q_DECL_EXPORT
#    else
#      define QWK_CORE_EXPORT Q_DECL_IMPORT
#    endif
#  endif
#endif

#if (QT_VERSION >= QT_VERSION_CHECK(6, 0, 0))
using QT_NATIVE_EVENT_RESULT_TYPE = qintptr;
using QT_ENTER_EVENT_TYPE = QEnterEvent;
#else
using QT_NATIVE_EVENT_RESULT_TYPE = long;
using QT_ENTER_EVENT_TYPE = QEvent;
#endif

#ifndef QWINDOWKIT_CONFIG
#  define QWINDOWKIT_CONFIG(feature) ((1 / QWINDOWKIT_##feature) == 1)
#endif

namespace QWK {

    using ScreenRectCallback = std::function<QRect(const QSize &)>;

}

#endif // QWKGLOBAL_H
