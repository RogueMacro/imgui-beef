// -- GENERATION INFORMATION --
// Date: 04/19/2023 06:29:50
// Constructors: 96
// Destructors: 75
// Enums: 73
// Global methods: 872
// Instance methods: 356
// Structs: 111
// Typedefs: 29

using System;

namespace ImGui
{
    public extension ImGui
    {
        public extension Vec2
        {
            public readonly static Vec2 Zero = .(0, 0);
            public readonly static Vec2 Ones = .(1, 1);
            public readonly static Vec2 OneZero = .(1, 0);
            public readonly static Vec2 ZeroOne = .(0, 1);
            public readonly static Vec2 NOneZero = .(-1, 0);
        }

        public extension Vec4
        {
            public readonly static Vec4 Zero = .(0, 0, 0, 0);
            public readonly static Vec4 Ones = .(1, 1, 1, 1);
        }
    }

	public static class ImGui
    {
		public static char8* VERSION = "1.89.5";
		public static int VERSION_NUM = 189500;
		public static bool CHECKVERSION()
		{
			bool result = DebugCheckVersionAndDataLayout(VERSION, sizeof(IO), sizeof(Style), sizeof(Vec2), sizeof(Vec4), sizeof(DrawVert), sizeof(DrawIdx));
			Runtime.Assert(result);
			return result;
		}

		public static mixin ASSERT(bool condition) { Runtime.Assert(condition); }
		public static mixin ASSERT(bool condition, String errorMsg) { Runtime.Assert(condition, errorMsg); }

		public static DrawCallback* DrawCallback_ResetRenderState = (.)(void*)-1;

        typealias char = char8;
        typealias uchar = uint8;
        typealias ushort = uint16;
        typealias short = int16;
        typealias size = uint64;
        typealias charPtr = char8*;

        [CRepr]
        public struct FILE
        {
            void* _Placeholder;
        }

        [CRepr]
		public enum DockRequestType
		{
		    None,
		    Dock,
		    Undock,
		    Split
		}

		[CRepr]
		public struct DockRequest
		{
		    DockRequestType Type;
		    Window* DockTargetWindow;
		    DockNode* DockTargetNode;
		    Window* DockPayload;
		    Dir DockSplitDir;
		    float DockSplitRatio;
		    bool DockSplitOuter;
		    Window* UndockTargetWindow;
		    DockNode* UndockTargetNode;
		}

		[CRepr]
		public struct DockNodeSettings
		{
		    ID             ID;
		    ID             ParentNodeId;
		    ID             ParentWindowId;
		    ID             SelectedWindowId;
		    char         SplitAxis;
		    char                Depth;
		    DockNodeFlags  Flags;
		    Vec2ih            Pos;
		    Vec2ih            Size;
		    Vec2ih            SizeRef;
		}

		[CRepr]
		public struct DockPreviewData
		{
		    DockNode FutureNode;
		    bool IsDropAllowed;
		    bool IsCenterAvailable;
		    bool IsSidesAvailable;
		    bool IsSplitDirExplicit;
		    DockNode* SplitNode;
		    Dir SplitDir;
		    float SplitRatio;
		    Rect[(.) Dir.COUNT] DropRectsDraw;
		}

		public static void FullscreenDockspace()
		{
			var viewport = ImGui.GetMainViewport();
			ImGui.SetNextWindowPos(viewport.Pos);
			ImGui.SetNextWindowSize(viewport.Size);
			ImGui.SetNextWindowViewport(viewport.ID);

			ImGui.PushStyleVar(.WindowPadding, .(0, 0));
			ImGui.PushStyleVar(.WindowRounding, 0.0f);
			ImGui.PushStyleVar(.WindowBorderSize, 0.0f);
			ImGui.WindowFlags windowFlags = .MenuBar | .NoDocking | .NoTitleBar | .NoResize | .NoMove | .NoBringToFrontOnFocus | .NoNavFocus;
			ImGui.Begin("MainDockspaceWindow", null, windowFlags);
			ImGui.PopStyleVar(3);

			ImGui.ID dockspaceId = ImGui.GetID("MainDockspace");
			ImGui.DockSpace(dockspaceId);
			ImGui.End();
		}

        // -- Auto-Generated --

        public typealias BitArrayForNamedKeys = BitArray<const Key.NamedKey_COUNT, const -Key.NamedKey_BEGIN>;
        public typealias BitArrayPtr = U32*;
        public typealias DrawCallback = function void(DrawList* parent_list, DrawCmd* cmd);
        public typealias DrawIdx = ushort;
        public typealias FileHandle = FILE*;
        public typealias ContextHookCallback = function void(Context* ctx, ContextHook* hook);
        public typealias ErrorLogCallback = function void(void* user_data, char* fmt,  ...);
        public typealias ID = uint32;
        public typealias InputTextCallback = function int(InputTextCallbackData* data);
        public typealias KeyChord = int32;
        public typealias KeyRoutingIndex = S16;
        public typealias MemAllocFunc = function void*(size sz, void* user_data);
        public typealias MemFreeFunc = function void(void* ptr, void* user_data);
        public typealias SizeCallback = function void(SizeCallbackData* data);
        public typealias TableColumnIdx = S16;
        public typealias TableDrawChannelIdx = U16;
        public typealias PoolIdx = int32;
        public typealias S16 = short;
        public typealias S32 = int32;
        public typealias S64 = int64;
        public typealias S8 = char;
        public typealias TextureID = void*;
        public typealias U16 = ushort;
        public typealias U32 = uint32;
        public typealias U64 = uint64;
        public typealias U8 = uchar;
        public typealias Wchar = Wchar16;
        public typealias Wchar16 = ushort;
        public typealias Wchar32 = uint32;
        
        [AllowDuplicates]
        public enum DrawFlags : int32
        {
            None = 0,
            Closed = 1,
            RoundCornersTopLeft = 16,
            RoundCornersTopRight = 32,
            RoundCornersBottomLeft = 64,
            RoundCornersBottomRight = 128,
            RoundCornersNone = 256,
            RoundCornersTop = 48,
            RoundCornersBottom = 192,
            RoundCornersLeft = 80,
            RoundCornersRight = 160,
            RoundCornersAll = 240,
            RoundCornersDefault_ = 240,
            RoundCornersMask_ = 496,
        
        }
        
        [AllowDuplicates]
        public enum DrawListFlags : int32
        {
            None = 0,
            AntiAliasedLines = 1,
            AntiAliasedLinesUseTex = 2,
            AntiAliasedFill = 4,
            AllowVtxOffset = 8,
        
        }
        
        [AllowDuplicates]
        public enum FontAtlasFlags : int32
        {
            None = 0,
            NoPowerOfTwoHeight = 1,
            NoMouseCursors = 2,
            NoBakedLines = 4,
        
        }
        
        [AllowDuplicates]
        public enum ActivateFlags : int32
        {
            None = 0,
            PreferInput = 1,
            PreferTweak = 2,
            TryToPreserveState = 4,
        
        }
        
        [AllowDuplicates]
        public enum Axis : int32
        {
            None = -1,
            X = 0,
            Y = 1,
        
        }
        
        [AllowDuplicates]
        public enum BackendFlags : int32
        {
            None = 0,
            HasGamepad = 1,
            HasMouseCursors = 2,
            HasSetMousePos = 4,
            RendererHasVtxOffset = 8,
            PlatformHasViewports = 1024,
            HasMouseHoveredViewport = 2048,
            RendererHasViewports = 4096,
        
        }
        
        [AllowDuplicates]
        public enum ButtonFlagsPrivate : int32
        {
            ButtonFlags_PressedOnClick = 16,
            ButtonFlags_PressedOnClickRelease = 32,
            ButtonFlags_PressedOnClickReleaseAnywhere = 64,
            ButtonFlags_PressedOnRelease = 128,
            ButtonFlags_PressedOnDoubleClick = 256,
            ButtonFlags_PressedOnDragDropHold = 512,
            ButtonFlags_Repeat = 1024,
            ButtonFlags_FlattenChildren = 2048,
            ButtonFlags_AllowItemOverlap = 4096,
            ButtonFlags_DontClosePopups = 8192,
            ButtonFlags_AlignTextBaseLine = 32768,
            ButtonFlags_NoKeyModifiers = 65536,
            ButtonFlags_NoHoldingActiveId = 131072,
            ButtonFlags_NoNavFocus = 262144,
            ButtonFlags_NoHoveredOnFocus = 524288,
            ButtonFlags_NoSetKeyOwner = 1048576,
            ButtonFlags_NoTestKeyOwner = 2097152,
            ButtonFlags_PressedOnMask_ = 1008,
            ButtonFlags_PressedOnDefault_ = 32,
        
        }
        
        [AllowDuplicates]
        public enum ButtonFlags : int32
        {
            None = 0,
            MouseButtonLeft = 1,
            MouseButtonRight = 2,
            MouseButtonMiddle = 4,
            MouseButtonMask_ = 7,
            MouseButtonDefault_ = 1,
        
        }
        
        [AllowDuplicates]
        public enum Col : int32
        {
            Text = 0,
            TextDisabled = 1,
            WindowBg = 2,
            ChildBg = 3,
            PopupBg = 4,
            Border = 5,
            BorderShadow = 6,
            FrameBg = 7,
            FrameBgHovered = 8,
            FrameBgActive = 9,
            TitleBg = 10,
            TitleBgActive = 11,
            TitleBgCollapsed = 12,
            MenuBarBg = 13,
            ScrollbarBg = 14,
            ScrollbarGrab = 15,
            ScrollbarGrabHovered = 16,
            ScrollbarGrabActive = 17,
            CheckMark = 18,
            SliderGrab = 19,
            SliderGrabActive = 20,
            Button = 21,
            ButtonHovered = 22,
            ButtonActive = 23,
            Header = 24,
            HeaderHovered = 25,
            HeaderActive = 26,
            Separator = 27,
            SeparatorHovered = 28,
            SeparatorActive = 29,
            ResizeGrip = 30,
            ResizeGripHovered = 31,
            ResizeGripActive = 32,
            Tab = 33,
            TabHovered = 34,
            TabActive = 35,
            TabUnfocused = 36,
            TabUnfocusedActive = 37,
            DockingPreview = 38,
            DockingEmptyBg = 39,
            PlotLines = 40,
            PlotLinesHovered = 41,
            PlotHistogram = 42,
            PlotHistogramHovered = 43,
            TableHeaderBg = 44,
            TableBorderStrong = 45,
            TableBorderLight = 46,
            TableRowBg = 47,
            TableRowBgAlt = 48,
            TextSelectedBg = 49,
            DragDropTarget = 50,
            NavHighlight = 51,
            NavWindowingHighlight = 52,
            NavWindowingDimBg = 53,
            ModalWindowDimBg = 54,
            COUNT = 55,
        
        }
        
        [AllowDuplicates]
        public enum ColorEditFlags : int32
        {
            None = 0,
            NoAlpha = 2,
            NoPicker = 4,
            NoOptions = 8,
            NoSmallPreview = 16,
            NoInputs = 32,
            NoTooltip = 64,
            NoLabel = 128,
            NoSidePreview = 256,
            NoDragDrop = 512,
            NoBorder = 1024,
            AlphaBar = 65536,
            AlphaPreview = 131072,
            AlphaPreviewHalf = 262144,
            HDR = 524288,
            DisplayRGB = 1048576,
            DisplayHSV = 2097152,
            DisplayHex = 4194304,
            Uint8 = 8388608,
            Float = 16777216,
            PickerHueBar = 33554432,
            PickerHueWheel = 67108864,
            InputRGB = 134217728,
            InputHSV = 268435456,
            DefaultOptions_ = 177209344,
            DisplayMask_ = 7340032,
            DataTypeMask_ = 25165824,
            PickerMask_ = 100663296,
            InputMask_ = 402653184,
        
        }
        
        [AllowDuplicates]
        public enum ComboFlagsPrivate : int32
        {
            ComboFlags_CustomPreview = 1048576,
        
        }
        
        [AllowDuplicates]
        public enum ComboFlags : int32
        {
            None = 0,
            PopupAlignLeft = 1,
            HeightSmall = 2,
            HeightRegular = 4,
            HeightLarge = 8,
            HeightLargest = 16,
            NoArrowButton = 32,
            NoPreview = 64,
            HeightMask_ = 30,
        
        }
        
        [AllowDuplicates]
        public enum Cond : int32
        {
            None = 0,
            Always = 1,
            Once = 2,
            FirstUseEver = 4,
            Appearing = 8,
        
        }
        
        [AllowDuplicates]
        public enum ConfigFlags : int32
        {
            None = 0,
            NavEnableKeyboard = 1,
            NavEnableGamepad = 2,
            NavEnableSetMousePos = 4,
            NavNoCaptureKeyboard = 8,
            NoMouse = 16,
            NoMouseCursorChange = 32,
            DockingEnable = 64,
            ViewportsEnable = 1024,
            DpiEnableScaleViewports = 16384,
            DpiEnableScaleFonts = 32768,
            IsSRGB = 1048576,
            IsTouchScreen = 2097152,
        
        }
        
        [AllowDuplicates]
        public enum ContextHookType : int32
        {
            NewFramePre = 0,
            NewFramePost = 1,
            EndFramePre = 2,
            EndFramePost = 3,
            RenderPre = 4,
            RenderPost = 5,
            Shutdown = 6,
            PendingRemoval_ = 7,
        
        }
        
        [AllowDuplicates]
        public enum DataAuthority : int32
        {
            Auto = 0,
            DockNode = 1,
            Window = 2,
        
        }
        
        [AllowDuplicates]
        public enum DataTypePrivate : int32
        {
            DataType_String = 11,
            DataType_Pointer = 12,
            DataType_ID = 13,
        
        }
        
        [AllowDuplicates]
        public enum DataType : int32
        {
            S8 = 0,
            U8 = 1,
            S16 = 2,
            U16 = 3,
            S32 = 4,
            U32 = 5,
            S64 = 6,
            U64 = 7,
            Float = 8,
            Double = 9,
            COUNT = 10,
        
        }
        
        [AllowDuplicates]
        public enum DebugLogFlags : int32
        {
            None = 0,
            EventActiveId = 1,
            EventFocus = 2,
            EventPopup = 4,
            EventNav = 8,
            EventClipper = 16,
            EventSelection = 32,
            EventIO = 64,
            EventDocking = 128,
            EventViewport = 256,
            EventMask_ = 511,
            OutputToTTY = 1024,
        
        }
        
        [AllowDuplicates]
        public enum Dir : int32
        {
            None = -1,
            Left = 0,
            Right = 1,
            Up = 2,
            Down = 3,
            COUNT = 4,
        
        }
        
        [AllowDuplicates]
        public enum DockNodeFlagsPrivate : int32
        {
            DockNodeFlags_DockSpace = 1024,
            DockNodeFlags_CentralNode = 2048,
            DockNodeFlags_NoTabBar = 4096,
            DockNodeFlags_HiddenTabBar = 8192,
            DockNodeFlags_NoWindowMenuButton = 16384,
            DockNodeFlags_NoCloseButton = 32768,
            DockNodeFlags_NoDocking = 65536,
            DockNodeFlags_NoDockingSplitMe = 131072,
            DockNodeFlags_NoDockingSplitOther = 262144,
            DockNodeFlags_NoDockingOverMe = 524288,
            DockNodeFlags_NoDockingOverOther = 1048576,
            DockNodeFlags_NoDockingOverEmpty = 2097152,
            DockNodeFlags_NoResizeX = 4194304,
            DockNodeFlags_NoResizeY = 8388608,
            DockNodeFlags_SharedFlagsInheritMask_ = -1,
            DockNodeFlags_NoResizeFlagsMask_ = 12582944,
            DockNodeFlags_LocalFlagsMask_ = 12713072,
            DockNodeFlags_LocalFlagsTransferMask_ = 12712048,
            DockNodeFlags_SavedFlagsMask_ = 12712992,
        
        }
        
        [AllowDuplicates]
        public enum DockNodeFlags : int32
        {
            None = 0,
            KeepAliveOnly = 1,
            NoDockingInCentralNode = 4,
            PassthruCentralNode = 8,
            NoSplit = 16,
            NoResize = 32,
            AutoHideTabBar = 64,
        
        }
        
        [AllowDuplicates]
        public enum DockNodeState : int32
        {
            Unknown = 0,
            HostWindowHiddenBecauseSingleWindow = 1,
            HostWindowHiddenBecauseWindowsAreResizing = 2,
            HostWindowVisible = 3,
        
        }
        
        [AllowDuplicates]
        public enum DragDropFlags : int32
        {
            None = 0,
            SourceNoPreviewTooltip = 1,
            SourceNoDisableHover = 2,
            SourceNoHoldToOpenOthers = 4,
            SourceAllowNullID = 8,
            SourceExtern = 16,
            SourceAutoExpirePayload = 32,
            AcceptBeforeDelivery = 1024,
            AcceptNoDrawDefaultRect = 2048,
            AcceptNoPreviewTooltip = 4096,
            AcceptPeekOnly = 3072,
        
        }
        
        [AllowDuplicates]
        public enum FocusedFlags : int32
        {
            None = 0,
            ChildWindows = 1,
            RootWindow = 2,
            AnyWindow = 4,
            NoPopupHierarchy = 8,
            DockHierarchy = 16,
            RootAndChildWindows = 3,
        
        }
        
        [AllowDuplicates]
        public enum HoveredFlags : int32
        {
            None = 0,
            ChildWindows = 1,
            RootWindow = 2,
            AnyWindow = 4,
            NoPopupHierarchy = 8,
            DockHierarchy = 16,
            AllowWhenBlockedByPopup = 32,
            AllowWhenBlockedByActiveItem = 128,
            AllowWhenOverlapped = 256,
            AllowWhenDisabled = 512,
            NoNavOverride = 1024,
            RectOnly = 416,
            RootAndChildWindows = 3,
            DelayNormal = 2048,
            DelayShort = 4096,
            NoSharedDelay = 8192,
        
        }
        
        [AllowDuplicates]
        public enum InputEventType : int32
        {
            None = 0,
            MousePos = 1,
            MouseWheel = 2,
            MouseButton = 3,
            MouseViewport = 4,
            Key = 5,
            Text = 6,
            Focus = 7,
            COUNT = 8,
        
        }
        
        [AllowDuplicates]
        public enum InputFlags : int32
        {
            None = 0,
            Repeat = 1,
            RepeatRateDefault = 2,
            RepeatRateNavMove = 4,
            RepeatRateNavTweak = 8,
            RepeatRateMask_ = 14,
            CondHovered = 16,
            CondActive = 32,
            CondDefault_ = 48,
            CondMask_ = 48,
            LockThisFrame = 64,
            LockUntilRelease = 128,
            RouteFocused = 256,
            RouteGlobalLow = 512,
            RouteGlobal = 1024,
            RouteGlobalHigh = 2048,
            RouteMask_ = 3840,
            RouteAlways = 4096,
            RouteUnlessBgFocused = 8192,
            RouteExtraMask_ = 12288,
            SupportedByIsKeyPressed = 15,
            SupportedByShortcut = 16143,
            SupportedBySetKeyOwner = 192,
            SupportedBySetItemKeyOwner = 240,
        
        }
        
        [AllowDuplicates]
        public enum InputSource : int32
        {
            None = 0,
            Mouse = 1,
            Keyboard = 2,
            Gamepad = 3,
            Clipboard = 4,
            COUNT = 5,
        
        }
        
        [AllowDuplicates]
        public enum InputTextFlagsPrivate : int32
        {
            InputTextFlags_Multiline = 67108864,
            InputTextFlags_NoMarkEdited = 134217728,
            InputTextFlags_MergedItem = 268435456,
        
        }
        
        [AllowDuplicates]
        public enum InputTextFlags : int32
        {
            None = 0,
            CharsDecimal = 1,
            CharsHexadecimal = 2,
            CharsUppercase = 4,
            CharsNoBlank = 8,
            AutoSelectAll = 16,
            EnterReturnsTrue = 32,
            CallbackCompletion = 64,
            CallbackHistory = 128,
            CallbackAlways = 256,
            CallbackCharFilter = 512,
            AllowTabInput = 1024,
            CtrlEnterForNewLine = 2048,
            NoHorizontalScroll = 4096,
            AlwaysOverwrite = 8192,
            ReadOnly = 16384,
            Password = 32768,
            NoUndoRedo = 65536,
            CharsScientific = 131072,
            CallbackResize = 262144,
            CallbackEdit = 524288,
            EscapeClearsAll = 1048576,
        
        }
        
        [AllowDuplicates]
        public enum ItemFlags : int32
        {
            None = 0,
            NoTabStop = 1,
            ButtonRepeat = 2,
            Disabled = 4,
            NoNav = 8,
            NoNavDefaultFocus = 16,
            SelectableDontClosePopup = 32,
            MixedValue = 64,
            ReadOnly = 128,
            NoWindowHoverableCheck = 256,
            Inputable = 1024,
        
        }
        
        [AllowDuplicates]
        public enum ItemStatusFlags : int32
        {
            None = 0,
            HoveredRect = 1,
            HasDisplayRect = 2,
            Edited = 4,
            ToggledSelection = 8,
            ToggledOpen = 16,
            HasDeactivated = 32,
            Deactivated = 64,
            HoveredWindow = 128,
            FocusedByTabbing = 256,
            Visible = 512,
        
        }
        
        [AllowDuplicates]
        public enum Key : int32
        {
            None = 0,
            Tab = 512,
            LeftArrow = 513,
            RightArrow = 514,
            UpArrow = 515,
            DownArrow = 516,
            PageUp = 517,
            PageDown = 518,
            Home = 519,
            End = 520,
            Insert = 521,
            Delete = 522,
            Backspace = 523,
            Space = 524,
            Enter = 525,
            Escape = 526,
            LeftCtrl = 527,
            LeftShift = 528,
            LeftAlt = 529,
            LeftSuper = 530,
            RightCtrl = 531,
            RightShift = 532,
            RightAlt = 533,
            RightSuper = 534,
            Menu = 535,
            N0 = 536,
            N1 = 537,
            N2 = 538,
            N3 = 539,
            N4 = 540,
            N5 = 541,
            N6 = 542,
            N7 = 543,
            N8 = 544,
            N9 = 545,
            A = 546,
            B = 547,
            C = 548,
            D = 549,
            E = 550,
            F = 551,
            G = 552,
            H = 553,
            I = 554,
            J = 555,
            K = 556,
            L = 557,
            M = 558,
            N = 559,
            O = 560,
            P = 561,
            Q = 562,
            R = 563,
            S = 564,
            T = 565,
            U = 566,
            V = 567,
            W = 568,
            X = 569,
            Y = 570,
            Z = 571,
            F1 = 572,
            F2 = 573,
            F3 = 574,
            F4 = 575,
            F5 = 576,
            F6 = 577,
            F7 = 578,
            F8 = 579,
            F9 = 580,
            F10 = 581,
            F11 = 582,
            F12 = 583,
            Apostrophe = 584,
            Comma = 585,
            Minus = 586,
            Period = 587,
            Slash = 588,
            Semicolon = 589,
            Equal = 590,
            LeftBracket = 591,
            Backslash = 592,
            RightBracket = 593,
            GraveAccent = 594,
            CapsLock = 595,
            ScrollLock = 596,
            NumLock = 597,
            PrintScreen = 598,
            Pause = 599,
            Keypad0 = 600,
            Keypad1 = 601,
            Keypad2 = 602,
            Keypad3 = 603,
            Keypad4 = 604,
            Keypad5 = 605,
            Keypad6 = 606,
            Keypad7 = 607,
            Keypad8 = 608,
            Keypad9 = 609,
            KeypadDecimal = 610,
            KeypadDivide = 611,
            KeypadMultiply = 612,
            KeypadSubtract = 613,
            KeypadAdd = 614,
            KeypadEnter = 615,
            KeypadEqual = 616,
            GamepadStart = 617,
            GamepadBack = 618,
            GamepadFaceLeft = 619,
            GamepadFaceRight = 620,
            GamepadFaceUp = 621,
            GamepadFaceDown = 622,
            GamepadDpadLeft = 623,
            GamepadDpadRight = 624,
            GamepadDpadUp = 625,
            GamepadDpadDown = 626,
            GamepadL1 = 627,
            GamepadR1 = 628,
            GamepadL2 = 629,
            GamepadR2 = 630,
            GamepadL3 = 631,
            GamepadR3 = 632,
            GamepadLStickLeft = 633,
            GamepadLStickRight = 634,
            GamepadLStickUp = 635,
            GamepadLStickDown = 636,
            GamepadRStickLeft = 637,
            GamepadRStickRight = 638,
            GamepadRStickUp = 639,
            GamepadRStickDown = 640,
            MouseLeft = 641,
            MouseRight = 642,
            MouseMiddle = 643,
            MouseX1 = 644,
            MouseX2 = 645,
            MouseWheelX = 646,
            MouseWheelY = 647,
            ReservedForModCtrl = 648,
            ReservedForModShift = 649,
            ReservedForModAlt = 650,
            ReservedForModSuper = 651,
            COUNT = 652,
            Mod_None = 0,
            Mod_Ctrl = 4096,
            Mod_Shift = 8192,
            Mod_Alt = 16384,
            Mod_Super = 32768,
            Mod_Shortcut = 2048,
            Mod_Mask_ = 63488,
            NamedKey_BEGIN = 512,
            NamedKey_END = 652,
            NamedKey_COUNT = 140,
            KeysData_SIZE = 652,
            KeysData_OFFSET = 0,
        
        }
        
        [AllowDuplicates]
        public enum LayoutType : int32
        {
            Horizontal = 0,
            Vertical = 1,
        
        }
        
        [AllowDuplicates]
        public enum LocKey : int32
        {
            TableSizeOne = 0,
            TableSizeAllFit = 1,
            TableSizeAllDefault = 2,
            TableResetOrder = 3,
            WindowingMainMenuBar = 4,
            WindowingPopup = 5,
            WindowingUntitled = 6,
            DockingHideTabBar = 7,
            COUNT = 8,
        
        }
        
        [AllowDuplicates]
        public enum LogType : int32
        {
            None = 0,
            TTY = 1,
            File = 2,
            Buffer = 3,
            Clipboard = 4,
        
        }
        
        [AllowDuplicates]
        public enum MouseButton : int32
        {
            Left = 0,
            Right = 1,
            Middle = 2,
            COUNT = 5,
        
        }
        
        [AllowDuplicates]
        public enum MouseCursor : int32
        {
            None = -1,
            Arrow = 0,
            TextInput = 1,
            ResizeAll = 2,
            ResizeNS = 3,
            ResizeEW = 4,
            ResizeNESW = 5,
            ResizeNWSE = 6,
            Hand = 7,
            NotAllowed = 8,
            COUNT = 9,
        
        }
        
        [AllowDuplicates]
        public enum MouseSource : int32
        {
            Mouse = 0,
            TouchScreen = 1,
            Pen = 2,
            COUNT = 3,
        
        }
        
        [AllowDuplicates]
        public enum NavHighlightFlags : int32
        {
            None = 0,
            TypeDefault = 1,
            TypeThin = 2,
            AlwaysDraw = 4,
            NoRounding = 8,
        
        }
        
        [AllowDuplicates]
        public enum NavInput : int32
        {
            Activate = 0,
            Cancel = 1,
            Input = 2,
            Menu = 3,
            DpadLeft = 4,
            DpadRight = 5,
            DpadUp = 6,
            DpadDown = 7,
            LStickLeft = 8,
            LStickRight = 9,
            LStickUp = 10,
            LStickDown = 11,
            FocusPrev = 12,
            FocusNext = 13,
            TweakSlow = 14,
            TweakFast = 15,
            COUNT = 16,
        
        }
        
        [AllowDuplicates]
        public enum NavLayer : int32
        {
            Main = 0,
            Menu = 1,
            COUNT = 2,
        
        }
        
        [AllowDuplicates]
        public enum NavMoveFlags : int32
        {
            None = 0,
            LoopX = 1,
            LoopY = 2,
            WrapX = 4,
            WrapY = 8,
            AllowCurrentNavId = 16,
            AlsoScoreVisibleSet = 32,
            ScrollToEdgeY = 64,
            Forwarded = 128,
            DebugNoResult = 256,
            FocusApi = 512,
            Tabbing = 1024,
            Activate = 2048,
            DontSetNavHighlight = 4096,
        
        }
        
        [AllowDuplicates]
        public enum NextItemDataFlags : int32
        {
            None = 0,
            HasWidth = 1,
            HasOpen = 2,
        
        }
        
        [AllowDuplicates]
        public enum NextWindowDataFlags : int32
        {
            None = 0,
            HasPos = 1,
            HasSize = 2,
            HasContentSize = 4,
            HasCollapsed = 8,
            HasSizeConstraint = 16,
            HasFocus = 32,
            HasBgAlpha = 64,
            HasScroll = 128,
            HasViewport = 256,
            HasDock = 512,
            HasWindowClass = 1024,
        
        }
        
        [AllowDuplicates]
        public enum OldColumnFlags : int32
        {
            None = 0,
            NoBorder = 1,
            NoResize = 2,
            NoPreserveWidths = 4,
            NoForceWithinWindow = 8,
            GrowParentContentsSize = 16,
        
        }
        
        [AllowDuplicates]
        public enum PlotType : int32
        {
            Lines = 0,
            Histogram = 1,
        
        }
        
        [AllowDuplicates]
        public enum PopupFlags : int32
        {
            None = 0,
            MouseButtonLeft = 0,
            MouseButtonRight = 1,
            MouseButtonMiddle = 2,
            MouseButtonMask_ = 31,
            MouseButtonDefault_ = 1,
            NoOpenOverExistingPopup = 32,
            NoOpenOverItems = 64,
            AnyPopupId = 128,
            AnyPopupLevel = 256,
            AnyPopup = 384,
        
        }
        
        [AllowDuplicates]
        public enum PopupPositionPolicy : int32
        {
            Default = 0,
            ComboBox = 1,
            Tooltip = 2,
        
        }
        
        [AllowDuplicates]
        public enum ScrollFlags : int32
        {
            None = 0,
            KeepVisibleEdgeX = 1,
            KeepVisibleEdgeY = 2,
            KeepVisibleCenterX = 4,
            KeepVisibleCenterY = 8,
            AlwaysCenterX = 16,
            AlwaysCenterY = 32,
            NoScrollParent = 64,
            MaskX_ = 21,
            MaskY_ = 42,
        
        }
        
        [AllowDuplicates]
        public enum SelectableFlagsPrivate : int32
        {
            SelectableFlags_NoHoldingActiveID = 1048576,
            SelectableFlags_SelectOnNav = 2097152,
            SelectableFlags_SelectOnClick = 4194304,
            SelectableFlags_SelectOnRelease = 8388608,
            SelectableFlags_SpanAvailWidth = 16777216,
            SelectableFlags_SetNavIdOnHover = 33554432,
            SelectableFlags_NoPadWithHalfSpacing = 67108864,
            SelectableFlags_NoSetKeyOwner = 134217728,
        
        }
        
        [AllowDuplicates]
        public enum SelectableFlags : int32
        {
            None = 0,
            DontClosePopups = 1,
            SpanAllColumns = 2,
            AllowDoubleClick = 4,
            Disabled = 8,
            AllowItemOverlap = 16,
        
        }
        
        [AllowDuplicates]
        public enum SeparatorFlags : int32
        {
            None = 0,
            Horizontal = 1,
            Vertical = 2,
            SpanAllColumns = 4,
        
        }
        
        [AllowDuplicates]
        public enum SliderFlagsPrivate : int32
        {
            SliderFlags_Vertical = 1048576,
            SliderFlags_ReadOnly = 2097152,
        
        }
        
        [AllowDuplicates]
        public enum SliderFlags : int32
        {
            None = 0,
            AlwaysClamp = 16,
            Logarithmic = 32,
            NoRoundToFormat = 64,
            NoInput = 128,
            InvalidMask_ = 1879048207,
        
        }
        
        [AllowDuplicates]
        public enum SortDirection : int32
        {
            None = 0,
            Ascending = 1,
            Descending = 2,
        
        }
        
        [AllowDuplicates]
        public enum StyleVar : int32
        {
            Alpha = 0,
            DisabledAlpha = 1,
            WindowPadding = 2,
            WindowRounding = 3,
            WindowBorderSize = 4,
            WindowMinSize = 5,
            WindowTitleAlign = 6,
            ChildRounding = 7,
            ChildBorderSize = 8,
            PopupRounding = 9,
            PopupBorderSize = 10,
            FramePadding = 11,
            FrameRounding = 12,
            FrameBorderSize = 13,
            ItemSpacing = 14,
            ItemInnerSpacing = 15,
            IndentSpacing = 16,
            CellPadding = 17,
            ScrollbarSize = 18,
            ScrollbarRounding = 19,
            GrabMinSize = 20,
            GrabRounding = 21,
            TabRounding = 22,
            ButtonTextAlign = 23,
            SelectableTextAlign = 24,
            SeparatorTextBorderSize = 25,
            SeparatorTextAlign = 26,
            SeparatorTextPadding = 27,
            COUNT = 28,
        
        }
        
        [AllowDuplicates]
        public enum TabBarFlagsPrivate : int32
        {
            TabBarFlags_DockNode = 1048576,
            TabBarFlags_IsFocused = 2097152,
            TabBarFlags_SaveSettings = 4194304,
        
        }
        
        [AllowDuplicates]
        public enum TabBarFlags : int32
        {
            None = 0,
            Reorderable = 1,
            AutoSelectNewTabs = 2,
            TabListPopupButton = 4,
            NoCloseWithMiddleMouseButton = 8,
            NoTabListScrollingButtons = 16,
            NoTooltip = 32,
            FittingPolicyResizeDown = 64,
            FittingPolicyScroll = 128,
            FittingPolicyMask_ = 192,
            FittingPolicyDefault_ = 64,
        
        }
        
        [AllowDuplicates]
        public enum TabItemFlagsPrivate : int32
        {
            TabItemFlags_SectionMask_ = 192,
            TabItemFlags_NoCloseButton = 1048576,
            TabItemFlags_Button = 2097152,
            TabItemFlags_Unsorted = 4194304,
            TabItemFlags_Preview = 8388608,
        
        }
        
        [AllowDuplicates]
        public enum TabItemFlags : int32
        {
            None = 0,
            UnsavedDocument = 1,
            SetSelected = 2,
            NoCloseWithMiddleMouseButton = 4,
            NoPushId = 8,
            NoTooltip = 16,
            NoReorder = 32,
            Leading = 64,
            Trailing = 128,
        
        }
        
        [AllowDuplicates]
        public enum TableBgTarget : int32
        {
            None = 0,
            RowBg0 = 1,
            RowBg1 = 2,
            CellBg = 3,
        
        }
        
        [AllowDuplicates]
        public enum TableColumnFlags : int32
        {
            None = 0,
            Disabled = 1,
            DefaultHide = 2,
            DefaultSort = 4,
            WidthStretch = 8,
            WidthFixed = 16,
            NoResize = 32,
            NoReorder = 64,
            NoHide = 128,
            NoClip = 256,
            NoSort = 512,
            NoSortAscending = 1024,
            NoSortDescending = 2048,
            NoHeaderLabel = 4096,
            NoHeaderWidth = 8192,
            PreferSortAscending = 16384,
            PreferSortDescending = 32768,
            IndentEnable = 65536,
            IndentDisable = 131072,
            IsEnabled = 16777216,
            IsVisible = 33554432,
            IsSorted = 67108864,
            IsHovered = 134217728,
            WidthMask_ = 24,
            IndentMask_ = 196608,
            StatusMask_ = 251658240,
            NoDirectResize_ = 1073741824,
        
        }
        
        [AllowDuplicates]
        public enum TableFlags : int32
        {
            None = 0,
            Resizable = 1,
            Reorderable = 2,
            Hideable = 4,
            Sortable = 8,
            NoSavedSettings = 16,
            ContextMenuInBody = 32,
            RowBg = 64,
            BordersInnerH = 128,
            BordersOuterH = 256,
            BordersInnerV = 512,
            BordersOuterV = 1024,
            BordersH = 384,
            BordersV = 1536,
            BordersInner = 640,
            BordersOuter = 1280,
            Borders = 1920,
            NoBordersInBody = 2048,
            NoBordersInBodyUntilResize = 4096,
            SizingFixedFit = 8192,
            SizingFixedSame = 16384,
            SizingStretchProp = 24576,
            SizingStretchSame = 32768,
            NoHostExtendX = 65536,
            NoHostExtendY = 131072,
            NoKeepColumnsVisible = 262144,
            PreciseWidths = 524288,
            NoClip = 1048576,
            PadOuterX = 2097152,
            NoPadOuterX = 4194304,
            NoPadInnerX = 8388608,
            ScrollX = 16777216,
            ScrollY = 33554432,
            SortMulti = 67108864,
            SortTristate = 134217728,
            SizingMask_ = 57344,
        
        }
        
        [AllowDuplicates]
        public enum TableRowFlags : int32
        {
            None = 0,
            Headers = 1,
        
        }
        
        [AllowDuplicates]
        public enum TextFlags : int32
        {
            None = 0,
            NoWidthForLargeClippedText = 1,
        
        }
        
        [AllowDuplicates]
        public enum TooltipFlags : int32
        {
            None = 0,
            OverridePreviousTooltip = 1,
        
        }
        
        [AllowDuplicates]
        public enum TreeNodeFlagsPrivate : int32
        {
            TreeNodeFlags_ClipLabelForTrailingButton = 1048576,
        
        }
        
        [AllowDuplicates]
        public enum TreeNodeFlags : int32
        {
            None = 0,
            Selected = 1,
            Framed = 2,
            AllowItemOverlap = 4,
            NoTreePushOnOpen = 8,
            NoAutoOpenOnLog = 16,
            DefaultOpen = 32,
            OpenOnDoubleClick = 64,
            OpenOnArrow = 128,
            Leaf = 256,
            Bullet = 512,
            FramePadding = 1024,
            SpanAvailWidth = 2048,
            SpanFullWidth = 4096,
            NavLeftJumpsBackHere = 8192,
            CollapsingHeader = 26,
        
        }
        
        [AllowDuplicates]
        public enum ViewportFlags : int32
        {
            None = 0,
            IsPlatformWindow = 1,
            IsPlatformMonitor = 2,
            OwnedByApp = 4,
            NoDecoration = 8,
            NoTaskBarIcon = 16,
            NoFocusOnAppearing = 32,
            NoFocusOnClick = 64,
            NoInputs = 128,
            NoRendererClear = 256,
            NoAutoMerge = 512,
            TopMost = 1024,
            CanHostOtherWindows = 2048,
            IsMinimized = 4096,
            IsFocused = 8192,
        
        }
        
        [AllowDuplicates]
        public enum WindowDockStyleCol : int32
        {
            Text = 0,
            Tab = 1,
            TabHovered = 2,
            TabActive = 3,
            TabUnfocused = 4,
            TabUnfocusedActive = 5,
            COUNT = 6,
        
        }
        
        [AllowDuplicates]
        public enum WindowFlags : int32
        {
            None = 0,
            NoTitleBar = 1,
            NoResize = 2,
            NoMove = 4,
            NoScrollbar = 8,
            NoScrollWithMouse = 16,
            NoCollapse = 32,
            AlwaysAutoResize = 64,
            NoBackground = 128,
            NoSavedSettings = 256,
            NoMouseInputs = 512,
            MenuBar = 1024,
            HorizontalScrollbar = 2048,
            NoFocusOnAppearing = 4096,
            NoBringToFrontOnFocus = 8192,
            AlwaysVerticalScrollbar = 16384,
            AlwaysHorizontalScrollbar = 32768,
            AlwaysUseWindowPadding = 65536,
            NoNavInputs = 262144,
            NoNavFocus = 524288,
            UnsavedDocument = 1048576,
            NoDocking = 2097152,
            NoNav = 786432,
            NoDecoration = 43,
            NoInputs = 786944,
            NavFlattened = 8388608,
            ChildWindow = 16777216,
            Tooltip = 33554432,
            Popup = 67108864,
            Modal = 134217728,
            ChildMenu = 268435456,
            DockNodeHost = 536870912,
        
        }
        
        [CRepr]
        public struct BitVector
        {
            public Vector<U32> Storage;
        
            [LinkName("ImBitVector_Clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
            [LinkName("ImBitVector_ClearBit")]
            private static extern void ClearBitImpl(Self* self, int32 n);
            public void ClearBit(int32 n) mut=> ClearBitImpl(&this, n);
            
            [LinkName("ImBitVector_Create")]
            private static extern void CreateImpl(Self* self, int32 sz);
            public void Create(int32 sz) mut=> CreateImpl(&this, sz);
            
            [LinkName("ImBitVector_SetBit")]
            private static extern void SetBitImpl(Self* self, int32 n);
            public void SetBit(int32 n) mut=> SetBitImpl(&this, n);
            
            [LinkName("ImBitVector_TestBit")]
            private static extern bool TestBitImpl(Self* self, int32 n);
            public bool TestBit(int32 n) mut=> TestBitImpl(&this, n);
            
        }
        
        [CRepr]
        public struct Color
        {
            public Vec4 Value;
        
            [LinkName("ImColor_ImColor_Nil")]
            private static extern Color* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImColor_ImColor_Float")]
            private static extern Color* CtorImpl(float r, float g, float b, float a);
            public this(float r, float g, float b, float a = (float) 1.0f)
            {
                this = *CtorImpl(r, g, b, a);
            }
            
            [LinkName("ImColor_ImColor_Vec4")]
            private static extern Color* CtorImpl(Vec4 col);
            public this(Vec4 col)
            {
                this = *CtorImpl(col);
            }
            
            [LinkName("ImColor_ImColor_Int")]
            private static extern Color* CtorImpl(int32 r, int32 g, int32 b, int32 a);
            public this(int32 r, int32 g, int32 b, int32 a = (int32) 255)
            {
                this = *CtorImpl(r, g, b, a);
            }
            
            [LinkName("ImColor_ImColor_U32")]
            private static extern Color* CtorImpl(U32 rgba);
            public this(U32 rgba)
            {
                this = *CtorImpl(rgba);
            }
            
            [LinkName("ImColor_SetHSV")]
            private static extern void SetHSVImpl(Self* self, float h, float s, float v, float a);
            public void SetHSV(float h, float s, float v, float a = (float) 1.0f) mut=> SetHSVImpl(&this, h, s, v, a);
            
        }
        
        [CRepr]
        public struct DrawChannel
        {
            public Vector<DrawCmd> _CmdBuffer;
            public Vector<DrawIdx> _IdxBuffer;
        
        }
        
        [CRepr]
        public struct DrawCmd
        {
            public Vec4 ClipRect;
            public TextureID TextureId;
            public uint32 VtxOffset;
            public uint32 IdxOffset;
            public uint32 ElemCount;
            public DrawCallback UserCallback;
            public void* UserCallbackData;
        
            [LinkName("ImDrawCmd_ImDrawCmd")]
            private static extern DrawCmd* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImDrawCmd_GetTexID")]
            private static extern TextureID GetTexIDImpl(Self* self);
            public TextureID GetTexID() mut=> GetTexIDImpl(&this);
            
        }
        
        [CRepr]
        public struct DrawCmdHeader
        {
            public Vec4 ClipRect;
            public TextureID TextureId;
            public uint32 VtxOffset;
        
        }
        
        [CRepr]
        public struct DrawData
        {
            public bool Valid;
            public int32 CmdListsCount;
            public int32 TotalIdxCount;
            public int32 TotalVtxCount;
            public DrawList** CmdLists;
            public Vec2 DisplayPos;
            public Vec2 DisplaySize;
            public Vec2 FramebufferScale;
            public Viewport* OwnerViewport;
        
            [LinkName("ImDrawData_ImDrawData")]
            private static extern DrawData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImDrawData_Clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
            [LinkName("ImDrawData_DeIndexAllBuffers")]
            private static extern void DeIndexAllBuffersImpl(Self* self);
            public void DeIndexAllBuffers() mut=> DeIndexAllBuffersImpl(&this);
            
            [LinkName("ImDrawData_ScaleClipRects")]
            private static extern void ScaleClipRectsImpl(Self* self, Vec2 fb_scale);
            public void ScaleClipRects(Vec2 fb_scale) mut=> ScaleClipRectsImpl(&this, fb_scale);
            
        }
        
        [CRepr]
        public struct DrawDataBuilder
        {
            public Vector<DrawList*>[2] Layers;
        
            [LinkName("ImDrawDataBuilder_Clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
            [LinkName("ImDrawDataBuilder_ClearFreeMemory")]
            private static extern void ClearFreeMemoryImpl(Self* self);
            public void ClearFreeMemory() mut=> ClearFreeMemoryImpl(&this);
            
            [LinkName("ImDrawDataBuilder_FlattenIntoSingleLayer")]
            private static extern void FlattenIntoSingleLayerImpl(Self* self);
            public void FlattenIntoSingleLayer() mut=> FlattenIntoSingleLayerImpl(&this);
            
            [LinkName("ImDrawDataBuilder_GetDrawListCount")]
            private static extern int32 GetDrawListCountImpl(Self* self);
            public int32 GetDrawListCount() mut=> GetDrawListCountImpl(&this);
            
        }
        
        [CRepr]
        public struct DrawList
        {
            public Vector<DrawCmd> CmdBuffer;
            public Vector<DrawIdx> IdxBuffer;
            public Vector<DrawVert> VtxBuffer;
            public DrawListFlags Flags;
            public uint32 _VtxCurrentIdx;
            public DrawListSharedData* _Data;
            public char* _OwnerName;
            public DrawVert* _VtxWritePtr;
            public DrawIdx* _IdxWritePtr;
            public Vector<Vec4> _ClipRectStack;
            public Vector<TextureID> _TextureIdStack;
            public Vector<Vec2> _Path;
            public DrawCmdHeader _CmdHeader;
            public DrawListSplitter _Splitter;
            public float _FringeScale;
        
            [LinkName("ImDrawList_ImDrawList")]
            private static extern DrawList* CtorImpl(DrawListSharedData* shared_data);
            public this(DrawListSharedData* shared_data)
            {
                this = *CtorImpl(shared_data);
            }
            
            [LinkName("ImDrawList_AddBezierCubic")]
            private static extern void AddBezierCubicImpl(Self* self, Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, U32 col, float thickness, int32 num_segments);
            public void AddBezierCubic(Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, U32 col, float thickness, int32 num_segments = (int32) 0) mut=> AddBezierCubicImpl(&this, p1, p2, p3, p4, col, thickness, num_segments);
            
            [LinkName("ImDrawList_AddBezierQuadratic")]
            private static extern void AddBezierQuadraticImpl(Self* self, Vec2 p1, Vec2 p2, Vec2 p3, U32 col, float thickness, int32 num_segments);
            public void AddBezierQuadratic(Vec2 p1, Vec2 p2, Vec2 p3, U32 col, float thickness, int32 num_segments = (int32) 0) mut=> AddBezierQuadraticImpl(&this, p1, p2, p3, col, thickness, num_segments);
            
            [LinkName("ImDrawList_AddCallback")]
            private static extern void AddCallbackImpl(Self* self, DrawCallback callback, void* callback_data);
            public void AddCallback(DrawCallback callback, void* callback_data) mut=> AddCallbackImpl(&this, callback, callback_data);
            
            [LinkName("ImDrawList_AddCircle")]
            private static extern void AddCircleImpl(Self* self, Vec2 center, float radius, U32 col, int32 num_segments, float thickness);
            public void AddCircle(Vec2 center, float radius, U32 col, int32 num_segments = (int32) 0, float thickness = (float) 1.0f) mut=> AddCircleImpl(&this, center, radius, col, num_segments, thickness);
            
            [LinkName("ImDrawList_AddCircleFilled")]
            private static extern void AddCircleFilledImpl(Self* self, Vec2 center, float radius, U32 col, int32 num_segments);
            public void AddCircleFilled(Vec2 center, float radius, U32 col, int32 num_segments = (int32) 0) mut=> AddCircleFilledImpl(&this, center, radius, col, num_segments);
            
            [LinkName("ImDrawList_AddConvexPolyFilled")]
            private static extern void AddConvexPolyFilledImpl(Self* self, Vec2* points, int32 num_points, U32 col);
            public void AddConvexPolyFilled(Vec2* points, int32 num_points, U32 col) mut=> AddConvexPolyFilledImpl(&this, points, num_points, col);
            
            [LinkName("ImDrawList_AddDrawCmd")]
            private static extern void AddDrawCmdImpl(Self* self);
            public void AddDrawCmd() mut=> AddDrawCmdImpl(&this);
            
            [LinkName("ImDrawList_AddImage")]
            private static extern void AddImageImpl(Self* self, TextureID user_texture_id, Vec2 p_min, Vec2 p_max, Vec2 uv_min, Vec2 uv_max, U32 col);
            public void AddImage(TextureID user_texture_id, Vec2 p_min, Vec2 p_max, Vec2 uv_min = Vec2.Zero, Vec2 uv_max = Vec2.Ones, U32 col = (U32) 4294967295) mut=> AddImageImpl(&this, user_texture_id, p_min, p_max, uv_min, uv_max, col);
            
            [LinkName("ImDrawList_AddImageQuad")]
            private static extern void AddImageQuadImpl(Self* self, TextureID user_texture_id, Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, Vec2 uv1, Vec2 uv2, Vec2 uv3, Vec2 uv4, U32 col);
            public void AddImageQuad(TextureID user_texture_id, Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, Vec2 uv1 = Vec2.Zero, Vec2 uv2 = Vec2.OneZero, Vec2 uv3 = Vec2.Ones, Vec2 uv4 = Vec2.ZeroOne, U32 col = (U32) 4294967295) mut=> AddImageQuadImpl(&this, user_texture_id, p1, p2, p3, p4, uv1, uv2, uv3, uv4, col);
            
            [LinkName("ImDrawList_AddImageRounded")]
            private static extern void AddImageRoundedImpl(Self* self, TextureID user_texture_id, Vec2 p_min, Vec2 p_max, Vec2 uv_min, Vec2 uv_max, U32 col, float rounding, DrawFlags flags);
            public void AddImageRounded(TextureID user_texture_id, Vec2 p_min, Vec2 p_max, Vec2 uv_min, Vec2 uv_max, U32 col, float rounding, DrawFlags flags = (DrawFlags) 0) mut=> AddImageRoundedImpl(&this, user_texture_id, p_min, p_max, uv_min, uv_max, col, rounding, flags);
            
            [LinkName("ImDrawList_AddLine")]
            private static extern void AddLineImpl(Self* self, Vec2 p1, Vec2 p2, U32 col, float thickness);
            public void AddLine(Vec2 p1, Vec2 p2, U32 col, float thickness = (float) 1.0f) mut=> AddLineImpl(&this, p1, p2, col, thickness);
            
            [LinkName("ImDrawList_AddNgon")]
            private static extern void AddNgonImpl(Self* self, Vec2 center, float radius, U32 col, int32 num_segments, float thickness);
            public void AddNgon(Vec2 center, float radius, U32 col, int32 num_segments, float thickness = (float) 1.0f) mut=> AddNgonImpl(&this, center, radius, col, num_segments, thickness);
            
            [LinkName("ImDrawList_AddNgonFilled")]
            private static extern void AddNgonFilledImpl(Self* self, Vec2 center, float radius, U32 col, int32 num_segments);
            public void AddNgonFilled(Vec2 center, float radius, U32 col, int32 num_segments) mut=> AddNgonFilledImpl(&this, center, radius, col, num_segments);
            
            [LinkName("ImDrawList_AddPolyline")]
            private static extern void AddPolylineImpl(Self* self, Vec2* points, int32 num_points, U32 col, DrawFlags flags, float thickness);
            public void AddPolyline(Vec2* points, int32 num_points, U32 col, DrawFlags flags, float thickness) mut=> AddPolylineImpl(&this, points, num_points, col, flags, thickness);
            
            [LinkName("ImDrawList_AddQuad")]
            private static extern void AddQuadImpl(Self* self, Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, U32 col, float thickness);
            public void AddQuad(Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, U32 col, float thickness = (float) 1.0f) mut=> AddQuadImpl(&this, p1, p2, p3, p4, col, thickness);
            
            [LinkName("ImDrawList_AddQuadFilled")]
            private static extern void AddQuadFilledImpl(Self* self, Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, U32 col);
            public void AddQuadFilled(Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, U32 col) mut=> AddQuadFilledImpl(&this, p1, p2, p3, p4, col);
            
            [LinkName("ImDrawList_AddRect")]
            private static extern void AddRectImpl(Self* self, Vec2 p_min, Vec2 p_max, U32 col, float rounding, DrawFlags flags, float thickness);
            public void AddRect(Vec2 p_min, Vec2 p_max, U32 col, float rounding = (float) 0.0f, DrawFlags flags = (DrawFlags) 0, float thickness = (float) 1.0f) mut=> AddRectImpl(&this, p_min, p_max, col, rounding, flags, thickness);
            
            [LinkName("ImDrawList_AddRectFilled")]
            private static extern void AddRectFilledImpl(Self* self, Vec2 p_min, Vec2 p_max, U32 col, float rounding, DrawFlags flags);
            public void AddRectFilled(Vec2 p_min, Vec2 p_max, U32 col, float rounding = (float) 0.0f, DrawFlags flags = (DrawFlags) 0) mut=> AddRectFilledImpl(&this, p_min, p_max, col, rounding, flags);
            
            [LinkName("ImDrawList_AddRectFilledMultiColor")]
            private static extern void AddRectFilledMultiColorImpl(Self* self, Vec2 p_min, Vec2 p_max, U32 col_upr_left, U32 col_upr_right, U32 col_bot_right, U32 col_bot_left);
            public void AddRectFilledMultiColor(Vec2 p_min, Vec2 p_max, U32 col_upr_left, U32 col_upr_right, U32 col_bot_right, U32 col_bot_left) mut=> AddRectFilledMultiColorImpl(&this, p_min, p_max, col_upr_left, col_upr_right, col_bot_right, col_bot_left);
            
            [LinkName("ImDrawList_AddText_Vec2")]
            private static extern void AddTextImpl(Self* self, Vec2 pos, U32 col, char* text_begin, char* text_end);
            public void AddText(Vec2 pos, U32 col, char* text_begin, char* text_end = null) mut=> AddTextImpl(&this, pos, col, text_begin, text_end);
            
            [LinkName("ImDrawList_AddText_FontPtr")]
            private static extern void AddTextImpl(Self* self, Font* font, float font_size, Vec2 pos, U32 col, char* text_begin, char* text_end, float wrap_width, Vec4* cpu_fine_clip_rect);
            public void AddText(Font* font, float font_size, Vec2 pos, U32 col, char* text_begin, char* text_end = null, float wrap_width = (float) 0.0f, Vec4* cpu_fine_clip_rect = null) mut=> AddTextImpl(&this, font, font_size, pos, col, text_begin, text_end, wrap_width, cpu_fine_clip_rect);
            
            [LinkName("ImDrawList_AddTriangle")]
            private static extern void AddTriangleImpl(Self* self, Vec2 p1, Vec2 p2, Vec2 p3, U32 col, float thickness);
            public void AddTriangle(Vec2 p1, Vec2 p2, Vec2 p3, U32 col, float thickness = (float) 1.0f) mut=> AddTriangleImpl(&this, p1, p2, p3, col, thickness);
            
            [LinkName("ImDrawList_AddTriangleFilled")]
            private static extern void AddTriangleFilledImpl(Self* self, Vec2 p1, Vec2 p2, Vec2 p3, U32 col);
            public void AddTriangleFilled(Vec2 p1, Vec2 p2, Vec2 p3, U32 col) mut=> AddTriangleFilledImpl(&this, p1, p2, p3, col);
            
            [LinkName("ImDrawList_ChannelsMerge")]
            private static extern void ChannelsMergeImpl(Self* self);
            public void ChannelsMerge() mut=> ChannelsMergeImpl(&this);
            
            [LinkName("ImDrawList_ChannelsSetCurrent")]
            private static extern void ChannelsSetCurrentImpl(Self* self, int32 n);
            public void ChannelsSetCurrent(int32 n) mut=> ChannelsSetCurrentImpl(&this, n);
            
            [LinkName("ImDrawList_ChannelsSplit")]
            private static extern void ChannelsSplitImpl(Self* self, int32 count);
            public void ChannelsSplit(int32 count) mut=> ChannelsSplitImpl(&this, count);
            
            [LinkName("ImDrawList_CloneOutput")]
            private static extern DrawList* CloneOutputImpl(Self* self);
            public DrawList* CloneOutput() mut=> CloneOutputImpl(&this);
            
            [LinkName("ImDrawList_GetClipRectMax")]
            private static extern Vec2 GetClipRectMaxImpl(Vec2* pOut, Self* self);
            public Vec2 GetClipRectMax() mut
            {
                Vec2 pOut = default;
                GetClipRectMaxImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImDrawList_GetClipRectMin")]
            private static extern Vec2 GetClipRectMinImpl(Vec2* pOut, Self* self);
            public Vec2 GetClipRectMin() mut
            {
                Vec2 pOut = default;
                GetClipRectMinImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImDrawList_PathArcTo")]
            private static extern void PathArcToImpl(Self* self, Vec2 center, float radius, float a_min, float a_max, int32 num_segments);
            public void PathArcTo(Vec2 center, float radius, float a_min, float a_max, int32 num_segments = (int32) 0) mut=> PathArcToImpl(&this, center, radius, a_min, a_max, num_segments);
            
            [LinkName("ImDrawList_PathArcToFast")]
            private static extern void PathArcToFastImpl(Self* self, Vec2 center, float radius, int32 a_min_of_12, int32 a_max_of_12);
            public void PathArcToFast(Vec2 center, float radius, int32 a_min_of_12, int32 a_max_of_12) mut=> PathArcToFastImpl(&this, center, radius, a_min_of_12, a_max_of_12);
            
            [LinkName("ImDrawList_PathBezierCubicCurveTo")]
            private static extern void PathBezierCubicCurveToImpl(Self* self, Vec2 p2, Vec2 p3, Vec2 p4, int32 num_segments);
            public void PathBezierCubicCurveTo(Vec2 p2, Vec2 p3, Vec2 p4, int32 num_segments = (int32) 0) mut=> PathBezierCubicCurveToImpl(&this, p2, p3, p4, num_segments);
            
            [LinkName("ImDrawList_PathBezierQuadraticCurveTo")]
            private static extern void PathBezierQuadraticCurveToImpl(Self* self, Vec2 p2, Vec2 p3, int32 num_segments);
            public void PathBezierQuadraticCurveTo(Vec2 p2, Vec2 p3, int32 num_segments = (int32) 0) mut=> PathBezierQuadraticCurveToImpl(&this, p2, p3, num_segments);
            
            [LinkName("ImDrawList_PathClear")]
            private static extern void PathClearImpl(Self* self);
            public void PathClear() mut=> PathClearImpl(&this);
            
            [LinkName("ImDrawList_PathFillConvex")]
            private static extern void PathFillConvexImpl(Self* self, U32 col);
            public void PathFillConvex(U32 col) mut=> PathFillConvexImpl(&this, col);
            
            [LinkName("ImDrawList_PathLineTo")]
            private static extern void PathLineToImpl(Self* self, Vec2 pos);
            public void PathLineTo(Vec2 pos) mut=> PathLineToImpl(&this, pos);
            
            [LinkName("ImDrawList_PathLineToMergeDuplicate")]
            private static extern void PathLineToMergeDuplicateImpl(Self* self, Vec2 pos);
            public void PathLineToMergeDuplicate(Vec2 pos) mut=> PathLineToMergeDuplicateImpl(&this, pos);
            
            [LinkName("ImDrawList_PathRect")]
            private static extern void PathRectImpl(Self* self, Vec2 rect_min, Vec2 rect_max, float rounding, DrawFlags flags);
            public void PathRect(Vec2 rect_min, Vec2 rect_max, float rounding = (float) 0.0f, DrawFlags flags = (DrawFlags) 0) mut=> PathRectImpl(&this, rect_min, rect_max, rounding, flags);
            
            [LinkName("ImDrawList_PathStroke")]
            private static extern void PathStrokeImpl(Self* self, U32 col, DrawFlags flags, float thickness);
            public void PathStroke(U32 col, DrawFlags flags = (DrawFlags) 0, float thickness = (float) 1.0f) mut=> PathStrokeImpl(&this, col, flags, thickness);
            
            [LinkName("ImDrawList_PopClipRect")]
            private static extern void PopClipRectImpl(Self* self);
            public void PopClipRect() mut=> PopClipRectImpl(&this);
            
            [LinkName("ImDrawList_PopTextureID")]
            private static extern void PopTextureIDImpl(Self* self);
            public void PopTextureID() mut=> PopTextureIDImpl(&this);
            
            [LinkName("ImDrawList_PrimQuadUV")]
            private static extern void PrimQuadUVImpl(Self* self, Vec2 a, Vec2 b, Vec2 c, Vec2 d, Vec2 uv_a, Vec2 uv_b, Vec2 uv_c, Vec2 uv_d, U32 col);
            public void PrimQuadUV(Vec2 a, Vec2 b, Vec2 c, Vec2 d, Vec2 uv_a, Vec2 uv_b, Vec2 uv_c, Vec2 uv_d, U32 col) mut=> PrimQuadUVImpl(&this, a, b, c, d, uv_a, uv_b, uv_c, uv_d, col);
            
            [LinkName("ImDrawList_PrimRect")]
            private static extern void PrimRectImpl(Self* self, Vec2 a, Vec2 b, U32 col);
            public void PrimRect(Vec2 a, Vec2 b, U32 col) mut=> PrimRectImpl(&this, a, b, col);
            
            [LinkName("ImDrawList_PrimRectUV")]
            private static extern void PrimRectUVImpl(Self* self, Vec2 a, Vec2 b, Vec2 uv_a, Vec2 uv_b, U32 col);
            public void PrimRectUV(Vec2 a, Vec2 b, Vec2 uv_a, Vec2 uv_b, U32 col) mut=> PrimRectUVImpl(&this, a, b, uv_a, uv_b, col);
            
            [LinkName("ImDrawList_PrimReserve")]
            private static extern void PrimReserveImpl(Self* self, int32 idx_count, int32 vtx_count);
            public void PrimReserve(int32 idx_count, int32 vtx_count) mut=> PrimReserveImpl(&this, idx_count, vtx_count);
            
            [LinkName("ImDrawList_PrimUnreserve")]
            private static extern void PrimUnreserveImpl(Self* self, int32 idx_count, int32 vtx_count);
            public void PrimUnreserve(int32 idx_count, int32 vtx_count) mut=> PrimUnreserveImpl(&this, idx_count, vtx_count);
            
            [LinkName("ImDrawList_PrimVtx")]
            private static extern void PrimVtxImpl(Self* self, Vec2 pos, Vec2 uv, U32 col);
            public void PrimVtx(Vec2 pos, Vec2 uv, U32 col) mut=> PrimVtxImpl(&this, pos, uv, col);
            
            [LinkName("ImDrawList_PrimWriteIdx")]
            private static extern void PrimWriteIdxImpl(Self* self, DrawIdx idx);
            public void PrimWriteIdx(DrawIdx idx) mut=> PrimWriteIdxImpl(&this, idx);
            
            [LinkName("ImDrawList_PrimWriteVtx")]
            private static extern void PrimWriteVtxImpl(Self* self, Vec2 pos, Vec2 uv, U32 col);
            public void PrimWriteVtx(Vec2 pos, Vec2 uv, U32 col) mut=> PrimWriteVtxImpl(&this, pos, uv, col);
            
            [LinkName("ImDrawList_PushClipRect")]
            private static extern void PushClipRectImpl(Self* self, Vec2 clip_rect_min, Vec2 clip_rect_max, bool intersect_with_current_clip_rect);
            public void PushClipRect(Vec2 clip_rect_min, Vec2 clip_rect_max, bool intersect_with_current_clip_rect = false) mut=> PushClipRectImpl(&this, clip_rect_min, clip_rect_max, intersect_with_current_clip_rect);
            
            [LinkName("ImDrawList_PushClipRectFullScreen")]
            private static extern void PushClipRectFullScreenImpl(Self* self);
            public void PushClipRectFullScreen() mut=> PushClipRectFullScreenImpl(&this);
            
            [LinkName("ImDrawList_PushTextureID")]
            private static extern void PushTextureIDImpl(Self* self, TextureID texture_id);
            public void PushTextureID(TextureID texture_id) mut=> PushTextureIDImpl(&this, texture_id);
            
            [LinkName("ImDrawList__CalcCircleAutoSegmentCount")]
            private static extern int32 CalcCircleAutoSegmentCountImpl(Self* self, float radius);
            public int32 CalcCircleAutoSegmentCount(float radius) mut=> CalcCircleAutoSegmentCountImpl(&this, radius);
            
            [LinkName("ImDrawList__ClearFreeMemory")]
            private static extern void ClearFreeMemoryImpl(Self* self);
            public void ClearFreeMemory() mut=> ClearFreeMemoryImpl(&this);
            
            [LinkName("ImDrawList__OnChangedClipRect")]
            private static extern void OnChangedClipRectImpl(Self* self);
            public void OnChangedClipRect() mut=> OnChangedClipRectImpl(&this);
            
            [LinkName("ImDrawList__OnChangedTextureID")]
            private static extern void OnChangedTextureIDImpl(Self* self);
            public void OnChangedTextureID() mut=> OnChangedTextureIDImpl(&this);
            
            [LinkName("ImDrawList__OnChangedVtxOffset")]
            private static extern void OnChangedVtxOffsetImpl(Self* self);
            public void OnChangedVtxOffset() mut=> OnChangedVtxOffsetImpl(&this);
            
            [LinkName("ImDrawList__PathArcToFastEx")]
            private static extern void PathArcToFastExImpl(Self* self, Vec2 center, float radius, int32 a_min_sample, int32 a_max_sample, int32 a_step);
            public void PathArcToFastEx(Vec2 center, float radius, int32 a_min_sample, int32 a_max_sample, int32 a_step) mut=> PathArcToFastExImpl(&this, center, radius, a_min_sample, a_max_sample, a_step);
            
            [LinkName("ImDrawList__PathArcToN")]
            private static extern void PathArcToNImpl(Self* self, Vec2 center, float radius, float a_min, float a_max, int32 num_segments);
            public void PathArcToN(Vec2 center, float radius, float a_min, float a_max, int32 num_segments) mut=> PathArcToNImpl(&this, center, radius, a_min, a_max, num_segments);
            
            [LinkName("ImDrawList__PopUnusedDrawCmd")]
            private static extern void PopUnusedDrawCmdImpl(Self* self);
            public void PopUnusedDrawCmd() mut=> PopUnusedDrawCmdImpl(&this);
            
            [LinkName("ImDrawList__ResetForNewFrame")]
            private static extern void ResetForNewFrameImpl(Self* self);
            public void ResetForNewFrame() mut=> ResetForNewFrameImpl(&this);
            
            [LinkName("ImDrawList__TryMergeDrawCmds")]
            private static extern void TryMergeDrawCmdsImpl(Self* self);
            public void TryMergeDrawCmds() mut=> TryMergeDrawCmdsImpl(&this);
            
        }
        
        [CRepr]
        public struct DrawListSharedData
        {
            public Vec2 TexUvWhitePixel;
            public Font* Font;
            public float FontSize;
            public float CurveTessellationTol;
            public float CircleSegmentMaxError;
            public Vec4 ClipRectFullscreen;
            public DrawListFlags InitialFlags;
            public Vector<Vec2> TempBuffer;
            public Vec2[48] ArcFastVtx;
            public float ArcFastRadiusCutoff;
            public U8[64] CircleSegmentCounts;
            public Vec4* TexUvLines;
        
            [LinkName("ImDrawListSharedData_ImDrawListSharedData")]
            private static extern DrawListSharedData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImDrawListSharedData_SetCircleTessellationMaxError")]
            private static extern void SetCircleTessellationMaxErrorImpl(Self* self, float max_error);
            public void SetCircleTessellationMaxError(float max_error) mut=> SetCircleTessellationMaxErrorImpl(&this, max_error);
            
        }
        
        [CRepr]
        public struct DrawListSplitter
        {
            public int32 _Current;
            public int32 _Count;
            public Vector<DrawChannel> _Channels;
        
            [LinkName("ImDrawListSplitter_ImDrawListSplitter")]
            private static extern DrawListSplitter* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImDrawListSplitter_Clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
            [LinkName("ImDrawListSplitter_ClearFreeMemory")]
            private static extern void ClearFreeMemoryImpl(Self* self);
            public void ClearFreeMemory() mut=> ClearFreeMemoryImpl(&this);
            
            [LinkName("ImDrawListSplitter_Merge")]
            private static extern void MergeImpl(Self* self, DrawList* draw_list);
            public void Merge(DrawList* draw_list) mut=> MergeImpl(&this, draw_list);
            
            [LinkName("ImDrawListSplitter_SetCurrentChannel")]
            private static extern void SetCurrentChannelImpl(Self* self, DrawList* draw_list, int32 channel_idx);
            public void SetCurrentChannel(DrawList* draw_list, int32 channel_idx) mut=> SetCurrentChannelImpl(&this, draw_list, channel_idx);
            
            [LinkName("ImDrawListSplitter_Split")]
            private static extern void SplitImpl(Self* self, DrawList* draw_list, int32 count);
            public void Split(DrawList* draw_list, int32 count) mut=> SplitImpl(&this, draw_list, count);
            
        }
        
        [CRepr]
        public struct DrawVert
        {
            public Vec2 pos;
            public Vec2 uv;
            public U32 col;
        
        }
        
        [CRepr]
        public struct Font
        {
            public Vector<float> IndexAdvanceX;
            public float FallbackAdvanceX;
            public float FontSize;
            public Vector<Wchar> IndexLookup;
            public Vector<FontGlyph> Glyphs;
            public FontGlyph* FallbackGlyph;
            public FontAtlas* ContainerAtlas;
            public FontConfig* ConfigData;
            public short ConfigDataCount;
            public Wchar FallbackChar;
            public Wchar EllipsisChar;
            public short EllipsisCharCount;
            public float EllipsisWidth;
            public float EllipsisCharStep;
            public bool DirtyLookupTables;
            public float Scale;
            public float Ascent;
            public float Descent;
            public int32 MetricsTotalSurface;
            public U8[2] Used4kPagesMap;
        
            [LinkName("ImFont_ImFont")]
            private static extern Font* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImFont_AddGlyph")]
            private static extern void AddGlyphImpl(Self* self, FontConfig* src_cfg, Wchar c, float x0, float y0, float x1, float y1, float u0, float v0, float u1, float v1, float advance_x);
            public void AddGlyph(FontConfig* src_cfg, Wchar c, float x0, float y0, float x1, float y1, float u0, float v0, float u1, float v1, float advance_x) mut=> AddGlyphImpl(&this, src_cfg, c, x0, y0, x1, y1, u0, v0, u1, v1, advance_x);
            
            [LinkName("ImFont_AddRemapChar")]
            private static extern void AddRemapCharImpl(Self* self, Wchar dst, Wchar src, bool overwrite_dst);
            public void AddRemapChar(Wchar dst, Wchar src, bool overwrite_dst = true) mut=> AddRemapCharImpl(&this, dst, src, overwrite_dst);
            
            [LinkName("ImFont_BuildLookupTable")]
            private static extern void BuildLookupTableImpl(Self* self);
            public void BuildLookupTable() mut=> BuildLookupTableImpl(&this);
            
            [LinkName("ImFont_CalcTextSizeA")]
            private static extern Vec2 CalcTextSizeAImpl(Vec2* pOut, Self* self, float size, float max_width, float wrap_width, char* text_begin, char* text_end, char** remaining);
            public Vec2 CalcTextSizeA(float size, float max_width, float wrap_width, char* text_begin, char* text_end = null, char** remaining = null) mut
            {
                Vec2 pOut = default;
                CalcTextSizeAImpl(&pOut, &this, size, max_width, wrap_width, text_begin, text_end, remaining);
                return pOut;
            }
            
            [LinkName("ImFont_CalcWordWrapPositionA")]
            private static extern char* CalcWordWrapPositionAImpl(Self* self, float scale, char* text, char* text_end, float wrap_width);
            public char* CalcWordWrapPositionA(float scale, char* text, char* text_end, float wrap_width) mut=> CalcWordWrapPositionAImpl(&this, scale, text, text_end, wrap_width);
            
            [LinkName("ImFont_ClearOutputData")]
            private static extern void ClearOutputDataImpl(Self* self);
            public void ClearOutputData() mut=> ClearOutputDataImpl(&this);
            
            [LinkName("ImFont_FindGlyph")]
            private static extern FontGlyph* FindGlyphImpl(Self* self, Wchar c);
            public FontGlyph* FindGlyph(Wchar c) mut=> FindGlyphImpl(&this, c);
            
            [LinkName("ImFont_FindGlyphNoFallback")]
            private static extern FontGlyph* FindGlyphNoFallbackImpl(Self* self, Wchar c);
            public FontGlyph* FindGlyphNoFallback(Wchar c) mut=> FindGlyphNoFallbackImpl(&this, c);
            
            [LinkName("ImFont_GetCharAdvance")]
            private static extern float GetCharAdvanceImpl(Self* self, Wchar c);
            public float GetCharAdvance(Wchar c) mut=> GetCharAdvanceImpl(&this, c);
            
            [LinkName("ImFont_GetDebugName")]
            private static extern char* GetDebugNameImpl(Self* self);
            public char* GetDebugName() mut=> GetDebugNameImpl(&this);
            
            [LinkName("ImFont_GrowIndex")]
            private static extern void GrowIndexImpl(Self* self, int32 new_size);
            public void GrowIndex(int32 new_size) mut=> GrowIndexImpl(&this, new_size);
            
            [LinkName("ImFont_IsGlyphRangeUnused")]
            private static extern bool IsGlyphRangeUnusedImpl(Self* self, uint32 c_begin, uint32 c_last);
            public bool IsGlyphRangeUnused(uint32 c_begin, uint32 c_last) mut=> IsGlyphRangeUnusedImpl(&this, c_begin, c_last);
            
            [LinkName("ImFont_IsLoaded")]
            private static extern bool IsLoadedImpl(Self* self);
            public bool IsLoaded() mut=> IsLoadedImpl(&this);
            
            [LinkName("ImFont_RenderChar")]
            private static extern void RenderCharImpl(Self* self, DrawList* draw_list, float size, Vec2 pos, U32 col, Wchar c);
            public void RenderChar(DrawList* draw_list, float size, Vec2 pos, U32 col, Wchar c) mut=> RenderCharImpl(&this, draw_list, size, pos, col, c);
            
            [LinkName("ImFont_RenderText")]
            private static extern void RenderTextImpl(Self* self, DrawList* draw_list, float size, Vec2 pos, U32 col, Vec4 clip_rect, char* text_begin, char* text_end, float wrap_width, bool cpu_fine_clip);
            public void RenderText(DrawList* draw_list, float size, Vec2 pos, U32 col, Vec4 clip_rect, char* text_begin, char* text_end, float wrap_width = (float) 0.0f, bool cpu_fine_clip = false) mut=> RenderTextImpl(&this, draw_list, size, pos, col, clip_rect, text_begin, text_end, wrap_width, cpu_fine_clip);
            
            [LinkName("ImFont_SetGlyphVisible")]
            private static extern void SetGlyphVisibleImpl(Self* self, Wchar c, bool visible);
            public void SetGlyphVisible(Wchar c, bool visible) mut=> SetGlyphVisibleImpl(&this, c, visible);
            
        }
        
        [CRepr]
        public struct FontAtlas
        {
            public FontAtlasFlags Flags;
            public TextureID TexID;
            public int32 TexDesiredWidth;
            public int32 TexGlyphPadding;
            public bool Locked;
            public void* UserData;
            public bool TexReady;
            public bool TexPixelsUseColors;
            public uchar* TexPixelsAlpha8;
            public uint32* TexPixelsRGBA32;
            public int32 TexWidth;
            public int32 TexHeight;
            public Vec2 TexUvScale;
            public Vec2 TexUvWhitePixel;
            public Vector<Font*> Fonts;
            public Vector<FontAtlasCustomRect> CustomRects;
            public Vector<FontConfig> ConfigData;
            public Vec4[64] TexUvLines;
            public FontBuilderIO* FontBuilderIO;
            public uint32 FontBuilderFlags;
            public int32 PackIdMouseCursors;
            public int32 PackIdLines;
        
            [LinkName("ImFontAtlas_ImFontAtlas")]
            private static extern FontAtlas* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImFontAtlas_AddCustomRectFontGlyph")]
            private static extern int32 AddCustomRectFontGlyphImpl(Self* self, Font* font, Wchar id, int32 width, int32 height, float advance_x, Vec2 offset);
            public int32 AddCustomRectFontGlyph(Font* font, Wchar id, int32 width, int32 height, float advance_x, Vec2 offset = Vec2.Zero) mut=> AddCustomRectFontGlyphImpl(&this, font, id, width, height, advance_x, offset);
            
            [LinkName("ImFontAtlas_AddCustomRectRegular")]
            private static extern int32 AddCustomRectRegularImpl(Self* self, int32 width, int32 height);
            public int32 AddCustomRectRegular(int32 width, int32 height) mut=> AddCustomRectRegularImpl(&this, width, height);
            
            [LinkName("ImFontAtlas_AddFont")]
            private static extern Font* AddFontImpl(Self* self, FontConfig* font_cfg);
            public Font* AddFont(FontConfig* font_cfg) mut=> AddFontImpl(&this, font_cfg);
            
            [LinkName("ImFontAtlas_AddFontDefault")]
            private static extern Font* AddFontDefaultImpl(Self* self, FontConfig* font_cfg);
            public Font* AddFontDefault(FontConfig* font_cfg = null) mut=> AddFontDefaultImpl(&this, font_cfg);
            
            [LinkName("ImFontAtlas_AddFontFromFileTTF")]
            private static extern Font* AddFontFromFileTTFImpl(Self* self, char* filename, float size_pixels, FontConfig* font_cfg, Wchar* glyph_ranges);
            public Font* AddFontFromFileTTF(char* filename, float size_pixels, FontConfig* font_cfg = null, Wchar* glyph_ranges = null) mut=> AddFontFromFileTTFImpl(&this, filename, size_pixels, font_cfg, glyph_ranges);
            
            [LinkName("ImFontAtlas_AddFontFromMemoryCompressedBase85TTF")]
            private static extern Font* AddFontFromMemoryCompressedBase85TTFImpl(Self* self, char* compressed_font_data_base85, float size_pixels, FontConfig* font_cfg, Wchar* glyph_ranges);
            public Font* AddFontFromMemoryCompressedBase85TTF(char* compressed_font_data_base85, float size_pixels, FontConfig* font_cfg = null, Wchar* glyph_ranges = null) mut=> AddFontFromMemoryCompressedBase85TTFImpl(&this, compressed_font_data_base85, size_pixels, font_cfg, glyph_ranges);
            
            [LinkName("ImFontAtlas_AddFontFromMemoryCompressedTTF")]
            private static extern Font* AddFontFromMemoryCompressedTTFImpl(Self* self, void* compressed_font_data, int32 compressed_font_size, float size_pixels, FontConfig* font_cfg, Wchar* glyph_ranges);
            public Font* AddFontFromMemoryCompressedTTF(void* compressed_font_data, int32 compressed_font_size, float size_pixels, FontConfig* font_cfg = null, Wchar* glyph_ranges = null) mut=> AddFontFromMemoryCompressedTTFImpl(&this, compressed_font_data, compressed_font_size, size_pixels, font_cfg, glyph_ranges);
            
            [LinkName("ImFontAtlas_AddFontFromMemoryTTF")]
            private static extern Font* AddFontFromMemoryTTFImpl(Self* self, void* font_data, int32 font_size, float size_pixels, FontConfig* font_cfg, Wchar* glyph_ranges);
            public Font* AddFontFromMemoryTTF(void* font_data, int32 font_size, float size_pixels, FontConfig* font_cfg = null, Wchar* glyph_ranges = null) mut=> AddFontFromMemoryTTFImpl(&this, font_data, font_size, size_pixels, font_cfg, glyph_ranges);
            
            [LinkName("ImFontAtlas_Build")]
            private static extern bool BuildImpl(Self* self);
            public bool Build() mut=> BuildImpl(&this);
            
            [LinkName("ImFontAtlas_CalcCustomRectUV")]
            private static extern void CalcCustomRectUVImpl(Self* self, FontAtlasCustomRect* rect, Vec2* out_uv_min, Vec2* out_uv_max);
            public void CalcCustomRectUV(FontAtlasCustomRect* rect, out Vec2 out_uv_min, out Vec2 out_uv_max) mut
            {
                out_uv_min = ?;
                out_uv_max = ?;
            	CalcCustomRectUVImpl(&this, rect, &out_uv_min, &out_uv_max);
            }
            
            [LinkName("ImFontAtlas_Clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
            [LinkName("ImFontAtlas_ClearFonts")]
            private static extern void ClearFontsImpl(Self* self);
            public void ClearFonts() mut=> ClearFontsImpl(&this);
            
            [LinkName("ImFontAtlas_ClearInputData")]
            private static extern void ClearInputDataImpl(Self* self);
            public void ClearInputData() mut=> ClearInputDataImpl(&this);
            
            [LinkName("ImFontAtlas_ClearTexData")]
            private static extern void ClearTexDataImpl(Self* self);
            public void ClearTexData() mut=> ClearTexDataImpl(&this);
            
            [LinkName("ImFontAtlas_GetCustomRectByIndex")]
            private static extern FontAtlasCustomRect* GetCustomRectByIndexImpl(Self* self, int32 index);
            public FontAtlasCustomRect* GetCustomRectByIndex(int32 index) mut=> GetCustomRectByIndexImpl(&this, index);
            
            [LinkName("ImFontAtlas_GetGlyphRangesChineseFull")]
            private static extern Wchar* GetGlyphRangesChineseFullImpl(Self* self);
            public Wchar* GetGlyphRangesChineseFull() mut=> GetGlyphRangesChineseFullImpl(&this);
            
            [LinkName("ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon")]
            private static extern Wchar* GetGlyphRangesChineseSimplifiedCommonImpl(Self* self);
            public Wchar* GetGlyphRangesChineseSimplifiedCommon() mut=> GetGlyphRangesChineseSimplifiedCommonImpl(&this);
            
            [LinkName("ImFontAtlas_GetGlyphRangesCyrillic")]
            private static extern Wchar* GetGlyphRangesCyrillicImpl(Self* self);
            public Wchar* GetGlyphRangesCyrillic() mut=> GetGlyphRangesCyrillicImpl(&this);
            
            [LinkName("ImFontAtlas_GetGlyphRangesDefault")]
            private static extern Wchar* GetGlyphRangesDefaultImpl(Self* self);
            public Wchar* GetGlyphRangesDefault() mut=> GetGlyphRangesDefaultImpl(&this);
            
            [LinkName("ImFontAtlas_GetGlyphRangesGreek")]
            private static extern Wchar* GetGlyphRangesGreekImpl(Self* self);
            public Wchar* GetGlyphRangesGreek() mut=> GetGlyphRangesGreekImpl(&this);
            
            [LinkName("ImFontAtlas_GetGlyphRangesJapanese")]
            private static extern Wchar* GetGlyphRangesJapaneseImpl(Self* self);
            public Wchar* GetGlyphRangesJapanese() mut=> GetGlyphRangesJapaneseImpl(&this);
            
            [LinkName("ImFontAtlas_GetGlyphRangesKorean")]
            private static extern Wchar* GetGlyphRangesKoreanImpl(Self* self);
            public Wchar* GetGlyphRangesKorean() mut=> GetGlyphRangesKoreanImpl(&this);
            
            [LinkName("ImFontAtlas_GetGlyphRangesThai")]
            private static extern Wchar* GetGlyphRangesThaiImpl(Self* self);
            public Wchar* GetGlyphRangesThai() mut=> GetGlyphRangesThaiImpl(&this);
            
            [LinkName("ImFontAtlas_GetGlyphRangesVietnamese")]
            private static extern Wchar* GetGlyphRangesVietnameseImpl(Self* self);
            public Wchar* GetGlyphRangesVietnamese() mut=> GetGlyphRangesVietnameseImpl(&this);
            
            [LinkName("ImFontAtlas_GetMouseCursorTexData")]
            private static extern bool GetMouseCursorTexDataImpl(Self* self, MouseCursor cursor, Vec2* out_offset, Vec2* out_size, Vec2[2] out_uv_border, Vec2[2] out_uv_fill);
            public bool GetMouseCursorTexData(MouseCursor cursor, out Vec2 out_offset, out Vec2 out_size, ref Vec2[2] out_uv_border, ref Vec2[2] out_uv_fill) mut
            {
                out_offset = ?;
                out_size = ?;
                return GetMouseCursorTexDataImpl(&this, cursor, &out_offset, &out_size, out_uv_border, out_uv_fill);
            }
            
            [LinkName("ImFontAtlas_GetTexDataAsAlpha8")]
            private static extern void GetTexDataAsAlpha8Impl(Self* self, uchar** out_pixels, int32* out_width, int32* out_height, int32* out_bytes_per_pixel);
            public void GetTexDataAsAlpha8(out uchar* out_pixels, out int32 out_width, out int32 out_height, int32* out_bytes_per_pixel = null) mut
            {
                out_pixels = ?;
                out_width = ?;
                out_height = ?;
            	GetTexDataAsAlpha8Impl(&this, &out_pixels, &out_width, &out_height, out_bytes_per_pixel);
            }
            
            [LinkName("ImFontAtlas_GetTexDataAsRGBA32")]
            private static extern void GetTexDataAsRGBA32Impl(Self* self, uchar** out_pixels, int32* out_width, int32* out_height, int32* out_bytes_per_pixel);
            public void GetTexDataAsRGBA32(out uchar* out_pixels, out int32 out_width, out int32 out_height, int32* out_bytes_per_pixel = null) mut
            {
                out_pixels = ?;
                out_width = ?;
                out_height = ?;
            	GetTexDataAsRGBA32Impl(&this, &out_pixels, &out_width, &out_height, out_bytes_per_pixel);
            }
            
            [LinkName("ImFontAtlas_IsBuilt")]
            private static extern bool IsBuiltImpl(Self* self);
            public bool IsBuilt() mut=> IsBuiltImpl(&this);
            
            [LinkName("ImFontAtlas_SetTexID")]
            private static extern void SetTexIDImpl(Self* self, TextureID id);
            public void SetTexID(TextureID id) mut=> SetTexIDImpl(&this, id);
            
        }
        
        [CRepr]
        public struct FontAtlasCustomRect
        {
            public ushort Width;
            public ushort Height;
            public ushort X;
            public ushort Y;
            public uint32 GlyphID;
            public float GlyphAdvanceX;
            public Vec2 GlyphOffset;
            public Font* Font;
        
            [LinkName("ImFontAtlasCustomRect_ImFontAtlasCustomRect")]
            private static extern FontAtlasCustomRect* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImFontAtlasCustomRect_IsPacked")]
            private static extern bool IsPackedImpl(Self* self);
            public bool IsPacked() mut=> IsPackedImpl(&this);
            
        }
        
        [CRepr]
        public struct FontBuilderIO
        {
            public function bool(FontAtlas* atlas) FontBuilder_Build;
        
        }
        
        [CRepr]
        public struct FontConfig
        {
            public void* FontData;
            public int32 FontDataSize;
            public bool FontDataOwnedByAtlas;
            public int32 FontNo;
            public float SizePixels;
            public int32 OversampleH;
            public int32 OversampleV;
            public bool PixelSnapH;
            public Vec2 GlyphExtraSpacing;
            public Vec2 GlyphOffset;
            public Wchar* GlyphRanges;
            public float GlyphMinAdvanceX;
            public float GlyphMaxAdvanceX;
            public bool MergeMode;
            public uint32 FontBuilderFlags;
            public float RasterizerMultiply;
            public Wchar EllipsisChar;
            public char[40] Name;
            public Font* DstFont;
        
            [LinkName("ImFontConfig_ImFontConfig")]
            private static extern FontConfig* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct FontGlyph
        {
            public uint32 Colored;
            public uint32 Visible;
            public uint32 Codepoint;
            public float AdvanceX;
            public float X0;
            public float Y0;
            public float X1;
            public float Y1;
            public float U0;
            public float V0;
            public float U1;
            public float V1;
        
        }
        
        [CRepr]
        public struct FontGlyphRangesBuilder
        {
            public Vector<U32> UsedChars;
        
            [LinkName("ImFontGlyphRangesBuilder_ImFontGlyphRangesBuilder")]
            private static extern FontGlyphRangesBuilder* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImFontGlyphRangesBuilder_AddChar")]
            private static extern void AddCharImpl(Self* self, Wchar c);
            public void AddChar(Wchar c) mut=> AddCharImpl(&this, c);
            
            [LinkName("ImFontGlyphRangesBuilder_AddRanges")]
            private static extern void AddRangesImpl(Self* self, Wchar* ranges);
            public void AddRanges(Wchar* ranges) mut=> AddRangesImpl(&this, ranges);
            
            [LinkName("ImFontGlyphRangesBuilder_AddText")]
            private static extern void AddTextImpl(Self* self, char* text, char* text_end);
            public void AddText(char* text, char* text_end = null) mut=> AddTextImpl(&this, text, text_end);
            
            [LinkName("ImFontGlyphRangesBuilder_BuildRanges")]
            private static extern void BuildRangesImpl(Self* self, Vector<Wchar*> out_ranges);
            public void BuildRanges(Vector<Wchar*> out_ranges) mut=> BuildRangesImpl(&this, out_ranges);
            
            [LinkName("ImFontGlyphRangesBuilder_Clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
            [LinkName("ImFontGlyphRangesBuilder_GetBit")]
            private static extern bool GetBitImpl(Self* self, size n);
            public bool GetBit(size n) mut=> GetBitImpl(&this, n);
            
            [LinkName("ImFontGlyphRangesBuilder_SetBit")]
            private static extern void SetBitImpl(Self* self, size n);
            public void SetBit(size n) mut=> SetBitImpl(&this, n);
            
        }
        
        [CRepr]
        public struct ColorMod
        {
            public Col Col;
            public Vec4 BackupValue;
        
        }
        
        [CRepr]
        public struct ComboPreviewData
        {
            public Rect PreviewRect;
            public Vec2 BackupCursorPos;
            public Vec2 BackupCursorMaxPos;
            public Vec2 BackupCursorPosPrevLine;
            public float BackupPrevLineTextBaseOffset;
            public LayoutType BackupLayout;
        
            [LinkName("ImGuiComboPreviewData_ImGuiComboPreviewData")]
            private static extern ComboPreviewData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct Context
        {
            public bool Initialized;
            public bool FontAtlasOwnedByContext;
            public IO IO;
            public PlatformIO PlatformIO;
            public Style Style;
            public ConfigFlags ConfigFlagsCurrFrame;
            public ConfigFlags ConfigFlagsLastFrame;
            public Font* Font;
            public float FontSize;
            public float FontBaseSize;
            public DrawListSharedData DrawListSharedData;
            public double Time;
            public int32 FrameCount;
            public int32 FrameCountEnded;
            public int32 FrameCountPlatformEnded;
            public int32 FrameCountRendered;
            public bool WithinFrameScope;
            public bool WithinFrameScopeWithImplicitWindow;
            public bool WithinEndChild;
            public bool GcCompactAll;
            public bool TestEngineHookItems;
            public void* TestEngine;
            public Vector<InputEvent> InputEventsQueue;
            public Vector<InputEvent> InputEventsTrail;
            public MouseSource InputEventsNextMouseSource;
            public U32 InputEventsNextEventId;
            public Vector<Window*> Windows;
            public Vector<Window*> WindowsFocusOrder;
            public Vector<Window*> WindowsTempSortBuffer;
            public Vector<WindowStackData> CurrentWindowStack;
            public Storage WindowsById;
            public int32 WindowsActiveCount;
            public Vec2 WindowsHoverPadding;
            public Window* CurrentWindow;
            public Window* HoveredWindow;
            public Window* HoveredWindowUnderMovingWindow;
            public Window* MovingWindow;
            public Window* WheelingWindow;
            public Vec2 WheelingWindowRefMousePos;
            public int32 WheelingWindowStartFrame;
            public float WheelingWindowReleaseTimer;
            public Vec2 WheelingWindowWheelRemainder;
            public Vec2 WheelingAxisAvg;
            public ID DebugHookIdInfo;
            public ID HoveredId;
            public ID HoveredIdPreviousFrame;
            public bool HoveredIdAllowOverlap;
            public bool HoveredIdDisabled;
            public float HoveredIdTimer;
            public float HoveredIdNotActiveTimer;
            public ID ActiveId;
            public ID ActiveIdIsAlive;
            public float ActiveIdTimer;
            public bool ActiveIdIsJustActivated;
            public bool ActiveIdAllowOverlap;
            public bool ActiveIdNoClearOnFocusLoss;
            public bool ActiveIdHasBeenPressedBefore;
            public bool ActiveIdHasBeenEditedBefore;
            public bool ActiveIdHasBeenEditedThisFrame;
            public Vec2 ActiveIdClickOffset;
            public Window* ActiveIdWindow;
            public InputSource ActiveIdSource;
            public int32 ActiveIdMouseButton;
            public ID ActiveIdPreviousFrame;
            public bool ActiveIdPreviousFrameIsAlive;
            public bool ActiveIdPreviousFrameHasBeenEditedBefore;
            public Window* ActiveIdPreviousFrameWindow;
            public ID LastActiveId;
            public float LastActiveIdTimer;
            public KeyOwnerData[140] KeysOwnerData;
            public KeyRoutingTable KeysRoutingTable;
            public U32 ActiveIdUsingNavDirMask;
            public bool ActiveIdUsingAllKeyboardKeys;
            public U32 ActiveIdUsingNavInputMask;
            public ID CurrentFocusScopeId;
            public ItemFlags CurrentItemFlags;
            public ID DebugLocateId;
            public NextItemData NextItemData;
            public LastItemData LastItemData;
            public NextWindowData NextWindowData;
            public Vector<ColorMod> ColorStack;
            public Vector<StyleMod> StyleVarStack;
            public Vector<Font*> FontStack;
            public Vector<ID> FocusScopeStack;
            public Vector<ItemFlags> ItemFlagsStack;
            public Vector<GroupData> GroupStack;
            public Vector<PopupData> OpenPopupStack;
            public Vector<PopupData> BeginPopupStack;
            public int32 BeginMenuCount;
            public Vector<ViewportP*> Viewports;
            public float CurrentDpiScale;
            public ViewportP* CurrentViewport;
            public ViewportP* MouseViewport;
            public ViewportP* MouseLastHoveredViewport;
            public ID PlatformLastFocusedViewportId;
            public PlatformMonitor FallbackMonitor;
            public int32 ViewportFocusedStampCount;
            public Window* NavWindow;
            public ID NavId;
            public ID NavFocusScopeId;
            public ID NavActivateId;
            public ID NavActivateDownId;
            public ID NavActivatePressedId;
            public ActivateFlags NavActivateFlags;
            public ID NavJustMovedToId;
            public ID NavJustMovedToFocusScopeId;
            public KeyChord NavJustMovedToKeyMods;
            public ID NavNextActivateId;
            public ActivateFlags NavNextActivateFlags;
            public InputSource NavInputSource;
            public NavLayer NavLayer;
            public bool NavIdIsAlive;
            public bool NavMousePosDirty;
            public bool NavDisableHighlight;
            public bool NavDisableMouseHover;
            public bool NavAnyRequest;
            public bool NavInitRequest;
            public bool NavInitRequestFromMove;
            public ID NavInitResultId;
            public Rect NavInitResultRectRel;
            public bool NavMoveSubmitted;
            public bool NavMoveScoringItems;
            public bool NavMoveForwardToNextFrame;
            public NavMoveFlags NavMoveFlags;
            public ScrollFlags NavMoveScrollFlags;
            public KeyChord NavMoveKeyMods;
            public Dir NavMoveDir;
            public Dir NavMoveDirForDebug;
            public Dir NavMoveClipDir;
            public Rect NavScoringRect;
            public Rect NavScoringNoClipRect;
            public int32 NavScoringDebugCount;
            public int32 NavTabbingDir;
            public int32 NavTabbingCounter;
            public NavItemData NavMoveResultLocal;
            public NavItemData NavMoveResultLocalVisible;
            public NavItemData NavMoveResultOther;
            public NavItemData NavTabbingResultFirst;
            public KeyChord ConfigNavWindowingKeyNext;
            public KeyChord ConfigNavWindowingKeyPrev;
            public Window* NavWindowingTarget;
            public Window* NavWindowingTargetAnim;
            public Window* NavWindowingListWindow;
            public float NavWindowingTimer;
            public float NavWindowingHighlightAlpha;
            public bool NavWindowingToggleLayer;
            public Vec2 NavWindowingAccumDeltaPos;
            public Vec2 NavWindowingAccumDeltaSize;
            public float DimBgRatio;
            public MouseCursor MouseCursor;
            public bool DragDropActive;
            public bool DragDropWithinSource;
            public bool DragDropWithinTarget;
            public DragDropFlags DragDropSourceFlags;
            public int32 DragDropSourceFrameCount;
            public int32 DragDropMouseButton;
            public Payload DragDropPayload;
            public Rect DragDropTargetRect;
            public ID DragDropTargetId;
            public DragDropFlags DragDropAcceptFlags;
            public float DragDropAcceptIdCurrRectSurface;
            public ID DragDropAcceptIdCurr;
            public ID DragDropAcceptIdPrev;
            public int32 DragDropAcceptFrameCount;
            public ID DragDropHoldJustPressedId;
            public Vector<uchar> DragDropPayloadBufHeap;
            public uchar[16] DragDropPayloadBufLocal;
            public int32 ClipperTempDataStacked;
            public Vector<ListClipperData> ClipperTempData;
            public Table* CurrentTable;
            public int32 TablesTempDataStacked;
            public Vector<TableTempData> TablesTempData;
            public Pool<Table> Tables;
            public Vector<float> TablesLastTimeActive;
            public Vector<DrawChannel> DrawChannelsTempMergeBuffer;
            public TabBar* CurrentTabBar;
            public Pool<TabBar> TabBars;
            public Vector<PtrOrIndex> CurrentTabBarStack;
            public Vector<ShrinkWidthItem> ShrinkWidthBuffer;
            public ID HoverDelayId;
            public ID HoverDelayIdPreviousFrame;
            public float HoverDelayTimer;
            public float HoverDelayClearTimer;
            public Vec2 MouseLastValidPos;
            public InputTextState InputTextState;
            public InputTextDeactivatedState InputTextDeactivatedState;
            public Font InputTextPasswordFont;
            public ID TempInputId;
            public ColorEditFlags ColorEditOptions;
            public ID ColorEditCurrentID;
            public ID ColorEditSavedID;
            public float ColorEditSavedHue;
            public float ColorEditSavedSat;
            public U32 ColorEditSavedColor;
            public Vec4 ColorPickerRef;
            public ComboPreviewData ComboPreviewData;
            public float SliderGrabClickOffset;
            public float SliderCurrentAccum;
            public bool SliderCurrentAccumDirty;
            public bool DragCurrentAccumDirty;
            public float DragCurrentAccum;
            public float DragSpeedDefaultRatio;
            public float ScrollbarClickDeltaToGrabCenter;
            public float DisabledAlphaBackup;
            public short DisabledStackSize;
            public short TooltipOverrideCount;
            public Vector<char> ClipboardHandlerData;
            public Vector<ID> MenusIdSubmittedThisFrame;
            public PlatformImeData PlatformImeData;
            public PlatformImeData PlatformImeDataPrev;
            public ID PlatformImeViewport;
            public char PlatformLocaleDecimalPoint;
            public DockContext DockContext;
            public function void(Context* ctx, DockNode* node, TabBar* tab_bar) DockNodeWindowMenuHandler;
            public bool SettingsLoaded;
            public float SettingsDirtyTimer;
            public TextBuffer SettingsIniData;
            public Vector<SettingsHandler> SettingsHandlers;
            public ChunkStream<WindowSettings> SettingsWindows;
            public ChunkStream<TableSettings> SettingsTables;
            public Vector<ContextHook> Hooks;
            public ID HookIdNext;
            public char*[8] LocalizationTable;
            public bool LogEnabled;
            public LogType LogType;
            public FileHandle LogFile;
            public TextBuffer LogBuffer;
            public char* LogNextPrefix;
            public char* LogNextSuffix;
            public float LogLinePosY;
            public bool LogLineFirstItem;
            public int32 LogDepthRef;
            public int32 LogDepthToExpand;
            public int32 LogDepthToExpandDefault;
            public DebugLogFlags DebugLogFlags;
            public TextBuffer DebugLogBuf;
            public TextIndex DebugLogIndex;
            public U8 DebugLogClipperAutoDisableFrames;
            public U8 DebugLocateFrames;
            public S8 DebugBeginReturnValueCullDepth;
            public bool DebugItemPickerActive;
            public U8 DebugItemPickerMouseButton;
            public ID DebugItemPickerBreakId;
            public MetricsConfig DebugMetricsConfig;
            public StackTool DebugStackTool;
            public DockNode* DebugHoveredDockNode;
            public float[60] FramerateSecPerFrame;
            public int32 FramerateSecPerFrameIdx;
            public int32 FramerateSecPerFrameCount;
            public float FramerateSecPerFrameAccum;
            public int32 WantCaptureMouseNextFrame;
            public int32 WantCaptureKeyboardNextFrame;
            public int32 WantTextInputNextFrame;
            public Vector<char> TempBuffer;
        
            [LinkName("ImGuiContext_ImGuiContext")]
            private static extern Context* CtorImpl(FontAtlas* shared_font_atlas);
            public this(FontAtlas* shared_font_atlas)
            {
                this = *CtorImpl(shared_font_atlas);
            }
            
        }
        
        [CRepr]
        public struct ContextHook
        {
            public ID HookId;
            public ContextHookType Type;
            public ID Owner;
            public ContextHookCallback Callback;
            public void* UserData;
        
            [LinkName("ImGuiContextHook_ImGuiContextHook")]
            private static extern ContextHook* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct DataTypeInfo
        {
            public size Size;
            public char* Name;
            public char* PrintFmt;
            public char* ScanFmt;
        
        }
        
        [CRepr]
        public struct DataTypeTempStorage
        {
            public U8[8] Data;
        
        }
        
        [CRepr]
        public struct DataVarInfo
        {
            public DataType Type;
            public U32 Count;
            public U32 Offset;
        
            [LinkName("ImGuiDataVarInfo_GetVarPtr")]
            private static extern void* GetVarPtrImpl(Self* self, void* parent);
            public void* GetVarPtr(void* parent) mut=> GetVarPtrImpl(&this, parent);
            
        }
        
        [CRepr]
        public struct DockContext
        {
            public Storage Nodes;
            public Vector<DockRequest> Requests;
            public Vector<DockNodeSettings> NodesSettings;
            public bool WantFullRebuild;
        
            [LinkName("ImGuiDockContext_ImGuiDockContext")]
            private static extern DockContext* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct DockNode
        {
            public ID ID;
            public DockNodeFlags SharedFlags;
            public DockNodeFlags LocalFlags;
            public DockNodeFlags LocalFlagsInWindows;
            public DockNodeFlags MergedFlags;
            public DockNodeState State;
            public DockNode* ParentNode;
            public DockNode*[2] ChildNodes;
            public Vector<Window*> Windows;
            public TabBar* TabBar;
            public Vec2 Pos;
            public Vec2 Size;
            public Vec2 SizeRef;
            public Axis SplitAxis;
            public WindowClass WindowClass;
            public U32 LastBgColor;
            public Window* HostWindow;
            public Window* VisibleWindow;
            public DockNode* CentralNode;
            public DockNode* OnlyNodeWithWindows;
            public int32 CountNodeWithWindows;
            public int32 LastFrameAlive;
            public int32 LastFrameActive;
            public int32 LastFrameFocused;
            public ID LastFocusedNodeId;
            public ID SelectedTabId;
            public ID WantCloseTabId;
            public DataAuthority AuthorityForPos;
            public DataAuthority AuthorityForSize;
            public DataAuthority AuthorityForViewport;
            public bool IsVisible;
            public bool IsFocused;
            public bool IsBgDrawnThisFrame;
            public bool HasCloseButton;
            public bool HasWindowMenuButton;
            public bool HasCentralNodeChild;
            public bool WantCloseAll;
            public bool WantLockSizeOnce;
            public bool WantMouseMove;
            public bool WantHiddenTabBarUpdate;
            public bool WantHiddenTabBarToggle;
        
            [LinkName("ImGuiDockNode_ImGuiDockNode")]
            private static extern DockNode* CtorImpl(ID id);
            public this(ID id)
            {
                this = *CtorImpl(id);
            }
            
            [LinkName("ImGuiDockNode_IsCentralNode")]
            private static extern bool IsCentralNodeImpl(Self* self);
            public bool IsCentralNode() mut=> IsCentralNodeImpl(&this);
            
            [LinkName("ImGuiDockNode_IsDockSpace")]
            private static extern bool IsDockSpaceImpl(Self* self);
            public bool IsDockSpace() mut=> IsDockSpaceImpl(&this);
            
            [LinkName("ImGuiDockNode_IsEmpty")]
            private static extern bool IsEmptyImpl(Self* self);
            public bool IsEmpty() mut=> IsEmptyImpl(&this);
            
            [LinkName("ImGuiDockNode_IsFloatingNode")]
            private static extern bool IsFloatingNodeImpl(Self* self);
            public bool IsFloatingNode() mut=> IsFloatingNodeImpl(&this);
            
            [LinkName("ImGuiDockNode_IsHiddenTabBar")]
            private static extern bool IsHiddenTabBarImpl(Self* self);
            public bool IsHiddenTabBar() mut=> IsHiddenTabBarImpl(&this);
            
            [LinkName("ImGuiDockNode_IsLeafNode")]
            private static extern bool IsLeafNodeImpl(Self* self);
            public bool IsLeafNode() mut=> IsLeafNodeImpl(&this);
            
            [LinkName("ImGuiDockNode_IsNoTabBar")]
            private static extern bool IsNoTabBarImpl(Self* self);
            public bool IsNoTabBar() mut=> IsNoTabBarImpl(&this);
            
            [LinkName("ImGuiDockNode_IsRootNode")]
            private static extern bool IsRootNodeImpl(Self* self);
            public bool IsRootNode() mut=> IsRootNodeImpl(&this);
            
            [LinkName("ImGuiDockNode_IsSplitNode")]
            private static extern bool IsSplitNodeImpl(Self* self);
            public bool IsSplitNode() mut=> IsSplitNodeImpl(&this);
            
            [LinkName("ImGuiDockNode_Rect")]
            private static extern Rect RectImpl(Rect* pOut, Self* self);
            public Rect Rect() mut
            {
                Rect pOut = default;
                RectImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImGuiDockNode_SetLocalFlags")]
            private static extern void SetLocalFlagsImpl(Self* self, DockNodeFlags flags);
            public void SetLocalFlags(DockNodeFlags flags) mut=> SetLocalFlagsImpl(&this, flags);
            
            [LinkName("ImGuiDockNode_UpdateMergedFlags")]
            private static extern void UpdateMergedFlagsImpl(Self* self);
            public void UpdateMergedFlags() mut=> UpdateMergedFlagsImpl(&this);
            
        }
        
        [CRepr]
        public struct GroupData
        {
            public ID WindowID;
            public Vec2 BackupCursorPos;
            public Vec2 BackupCursorMaxPos;
            public Vec1 BackupIndent;
            public Vec1 BackupGroupOffset;
            public Vec2 BackupCurrLineSize;
            public float BackupCurrLineTextBaseOffset;
            public ID BackupActiveIdIsAlive;
            public bool BackupActiveIdPreviousFrameIsAlive;
            public bool BackupHoveredIdIsAlive;
            public bool EmitItem;
        
        }
        
        [CRepr]
        public struct IO
        {
            public ConfigFlags ConfigFlags;
            public BackendFlags BackendFlags;
            public Vec2 DisplaySize;
            public float DeltaTime;
            public float IniSavingRate;
            public char* IniFilename;
            public char* LogFilename;
            public float MouseDoubleClickTime;
            public float MouseDoubleClickMaxDist;
            public float MouseDragThreshold;
            public float KeyRepeatDelay;
            public float KeyRepeatRate;
            public float HoverDelayNormal;
            public float HoverDelayShort;
            public void* UserData;
            public FontAtlas* Fonts;
            public float FontGlobalScale;
            public bool FontAllowUserScaling;
            public Font* FontDefault;
            public Vec2 DisplayFramebufferScale;
            public bool ConfigDockingNoSplit;
            public bool ConfigDockingWithShift;
            public bool ConfigDockingAlwaysTabBar;
            public bool ConfigDockingTransparentPayload;
            public bool ConfigViewportsNoAutoMerge;
            public bool ConfigViewportsNoTaskBarIcon;
            public bool ConfigViewportsNoDecoration;
            public bool ConfigViewportsNoDefaultParent;
            public bool MouseDrawCursor;
            public bool ConfigMacOSXBehaviors;
            public bool ConfigInputTrickleEventQueue;
            public bool ConfigInputTextCursorBlink;
            public bool ConfigInputTextEnterKeepActive;
            public bool ConfigDragClickToInputText;
            public bool ConfigWindowsResizeFromEdges;
            public bool ConfigWindowsMoveFromTitleBarOnly;
            public float ConfigMemoryCompactTimer;
            public bool ConfigDebugBeginReturnValueOnce;
            public bool ConfigDebugBeginReturnValueLoop;
            public char* BackendPlatformName;
            public char* BackendRendererName;
            public void* BackendPlatformUserData;
            public void* BackendRendererUserData;
            public void* BackendLanguageUserData;
            public function char*(void* user_data) GetClipboardTextFn;
            public function void(void* user_data, char* text) SetClipboardTextFn;
            public void* ClipboardUserData;
            public function void(Viewport* viewport, PlatformImeData* data) SetPlatformImeDataFn;
            public void* _UnusedPadding;
            public bool WantCaptureMouse;
            public bool WantCaptureKeyboard;
            public bool WantTextInput;
            public bool WantSetMousePos;
            public bool WantSaveIniSettings;
            public bool NavActive;
            public bool NavVisible;
            public float Framerate;
            public int32 MetricsRenderVertices;
            public int32 MetricsRenderIndices;
            public int32 MetricsRenderWindows;
            public int32 MetricsActiveWindows;
            public int32 MetricsActiveAllocations;
            public Vec2 MouseDelta;
            public int32[652] KeyMap;
            public bool[652] KeysDown;
            public float[16] NavInputs;
            public Context* Ctx;
            public Vec2 MousePos;
            public bool[5] MouseDown;
            public float MouseWheel;
            public float MouseWheelH;
            public MouseSource MouseSource;
            public ID MouseHoveredViewport;
            public bool KeyCtrl;
            public bool KeyShift;
            public bool KeyAlt;
            public bool KeySuper;
            public KeyChord KeyMods;
            public KeyData[652] KeysData;
            public bool WantCaptureMouseUnlessPopupClose;
            public Vec2 MousePosPrev;
            public Vec2[5] MouseClickedPos;
            public double[5] MouseClickedTime;
            public bool[5] MouseClicked;
            public bool[5] MouseDoubleClicked;
            public U16[5] MouseClickedCount;
            public U16[5] MouseClickedLastCount;
            public bool[5] MouseReleased;
            public bool[5] MouseDownOwned;
            public bool[5] MouseDownOwnedUnlessPopupClose;
            public bool MouseWheelRequestAxisSwap;
            public float[5] MouseDownDuration;
            public float[5] MouseDownDurationPrev;
            public Vec2[5] MouseDragMaxDistanceAbs;
            public float[5] MouseDragMaxDistanceSqr;
            public float PenPressure;
            public bool AppFocusLost;
            public bool AppAcceptingEvents;
            public S8 BackendUsingLegacyKeyArrays;
            public bool BackendUsingLegacyNavInputArray;
            public Wchar16 InputQueueSurrogate;
            public Vector<Wchar> InputQueueCharacters;
        
            [LinkName("ImGuiIO_ImGuiIO")]
            private static extern IO* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiIO_AddFocusEvent")]
            private static extern void AddFocusEventImpl(Self* self, bool focused);
            public void AddFocusEvent(bool focused) mut=> AddFocusEventImpl(&this, focused);
            
            [LinkName("ImGuiIO_AddInputCharacter")]
            private static extern void AddInputCharacterImpl(Self* self, uint32 c);
            public void AddInputCharacter(uint32 c) mut=> AddInputCharacterImpl(&this, c);
            
            [LinkName("ImGuiIO_AddInputCharacterUTF16")]
            private static extern void AddInputCharacterUTF16Impl(Self* self, Wchar16 c);
            public void AddInputCharacterUTF16(Wchar16 c) mut=> AddInputCharacterUTF16Impl(&this, c);
            
            [LinkName("ImGuiIO_AddInputCharactersUTF8")]
            private static extern void AddInputCharactersUTF8Impl(Self* self, char* str);
            public void AddInputCharactersUTF8(char* str) mut=> AddInputCharactersUTF8Impl(&this, str);
            
            [LinkName("ImGuiIO_AddKeyAnalogEvent")]
            private static extern void AddKeyAnalogEventImpl(Self* self, Key key, bool down, float v);
            public void AddKeyAnalogEvent(Key key, bool down, float v) mut=> AddKeyAnalogEventImpl(&this, key, down, v);
            
            [LinkName("ImGuiIO_AddKeyEvent")]
            private static extern void AddKeyEventImpl(Self* self, Key key, bool down);
            public void AddKeyEvent(Key key, bool down) mut=> AddKeyEventImpl(&this, key, down);
            
            [LinkName("ImGuiIO_AddMouseButtonEvent")]
            private static extern void AddMouseButtonEventImpl(Self* self, int32 button, bool down);
            public void AddMouseButtonEvent(int32 button, bool down) mut=> AddMouseButtonEventImpl(&this, button, down);
            
            [LinkName("ImGuiIO_AddMousePosEvent")]
            private static extern void AddMousePosEventImpl(Self* self, float x, float y);
            public void AddMousePosEvent(float x, float y) mut=> AddMousePosEventImpl(&this, x, y);
            
            [LinkName("ImGuiIO_AddMouseSourceEvent")]
            private static extern void AddMouseSourceEventImpl(Self* self, MouseSource source);
            public void AddMouseSourceEvent(MouseSource source) mut=> AddMouseSourceEventImpl(&this, source);
            
            [LinkName("ImGuiIO_AddMouseViewportEvent")]
            private static extern void AddMouseViewportEventImpl(Self* self, ID id);
            public void AddMouseViewportEvent(ID id) mut=> AddMouseViewportEventImpl(&this, id);
            
            [LinkName("ImGuiIO_AddMouseWheelEvent")]
            private static extern void AddMouseWheelEventImpl(Self* self, float wheel_x, float wheel_y);
            public void AddMouseWheelEvent(float wheel_x, float wheel_y) mut=> AddMouseWheelEventImpl(&this, wheel_x, wheel_y);
            
            [LinkName("ImGuiIO_ClearInputCharacters")]
            private static extern void ClearInputCharactersImpl(Self* self);
            public void ClearInputCharacters() mut=> ClearInputCharactersImpl(&this);
            
            [LinkName("ImGuiIO_ClearInputKeys")]
            private static extern void ClearInputKeysImpl(Self* self);
            public void ClearInputKeys() mut=> ClearInputKeysImpl(&this);
            
            [LinkName("ImGuiIO_SetAppAcceptingEvents")]
            private static extern void SetAppAcceptingEventsImpl(Self* self, bool accepting_events);
            public void SetAppAcceptingEvents(bool accepting_events) mut=> SetAppAcceptingEventsImpl(&this, accepting_events);
            
            [LinkName("ImGuiIO_SetKeyEventNativeData")]
            private static extern void SetKeyEventNativeDataImpl(Self* self, Key key, int32 native_keycode, int32 native_scancode, int32 native_legacy_index);
            public void SetKeyEventNativeData(Key key, int32 native_keycode, int32 native_scancode, int32 native_legacy_index = -1) mut=> SetKeyEventNativeDataImpl(&this, key, native_keycode, native_scancode, native_legacy_index);
            
        }
        
        [CRepr]
        public struct InputEvent
        {
            public InputEventType Type;
            public InputSource Source;
            public U32 EventId;
            private InputEventUnion0 Union0 = .();
            public InputEventMousePos MousePos { get { return Union0.MousePos; } set mut { Union0.MousePos = value; } };
            public InputEventMouseWheel MouseWheel { get { return Union0.MouseWheel; } set mut { Union0.MouseWheel = value; } };
            public InputEventMouseButton MouseButton { get { return Union0.MouseButton; } set mut { Union0.MouseButton = value; } };
            public InputEventMouseViewport MouseViewport { get { return Union0.MouseViewport; } set mut { Union0.MouseViewport = value; } };
            public InputEventKey Key { get { return Union0.Key; } set mut { Union0.Key = value; } };
            public InputEventText Text { get { return Union0.Text; } set mut { Union0.Text = value; } };
            public InputEventAppFocused AppFocused { get { return Union0.AppFocused; } set mut { Union0.AppFocused = value; } };
            public bool AddedByTestEngine;
        
            [LinkName("ImGuiInputEvent_ImGuiInputEvent")]
            private static extern InputEvent* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            [CRepr, Union]
            public struct InputEventUnion0
            {
                public InputEventMousePos MousePos;
                public InputEventMouseWheel MouseWheel;
                public InputEventMouseButton MouseButton;
                public InputEventMouseViewport MouseViewport;
                public InputEventKey Key;
                public InputEventText Text;
                public InputEventAppFocused AppFocused;
            
            }
        }
        
        [CRepr]
        public struct InputEventAppFocused
        {
            public bool Focused;
        
        }
        
        [CRepr]
        public struct InputEventKey
        {
            public Key Key;
            public bool Down;
            public float AnalogValue;
        
        }
        
        [CRepr]
        public struct InputEventMouseButton
        {
            public int32 Button;
            public bool Down;
            public MouseSource MouseSource;
        
        }
        
        [CRepr]
        public struct InputEventMousePos
        {
            public float PosX;
            public float PosY;
            public MouseSource MouseSource;
        
        }
        
        [CRepr]
        public struct InputEventMouseViewport
        {
            public ID HoveredViewportID;
        
        }
        
        [CRepr]
        public struct InputEventMouseWheel
        {
            public float WheelX;
            public float WheelY;
            public MouseSource MouseSource;
        
        }
        
        [CRepr]
        public struct InputEventText
        {
            public uint32 Char;
        
        }
        
        [CRepr]
        public struct InputTextCallbackData
        {
            public Context* Ctx;
            public InputTextFlags EventFlag;
            public InputTextFlags Flags;
            public void* UserData;
            public Wchar EventChar;
            public Key EventKey;
            public char* Buf;
            public int32 BufTextLen;
            public int32 BufSize;
            public bool BufDirty;
            public int32 CursorPos;
            public int32 SelectionStart;
            public int32 SelectionEnd;
        
            [LinkName("ImGuiInputTextCallbackData_ImGuiInputTextCallbackData")]
            private static extern InputTextCallbackData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiInputTextCallbackData_ClearSelection")]
            private static extern void ClearSelectionImpl(Self* self);
            public void ClearSelection() mut=> ClearSelectionImpl(&this);
            
            [LinkName("ImGuiInputTextCallbackData_DeleteChars")]
            private static extern void DeleteCharsImpl(Self* self, int32 pos, int32 bytes_count);
            public void DeleteChars(int32 pos, int32 bytes_count) mut=> DeleteCharsImpl(&this, pos, bytes_count);
            
            [LinkName("ImGuiInputTextCallbackData_HasSelection")]
            private static extern bool HasSelectionImpl(Self* self);
            public bool HasSelection() mut=> HasSelectionImpl(&this);
            
            [LinkName("ImGuiInputTextCallbackData_InsertChars")]
            private static extern void InsertCharsImpl(Self* self, int32 pos, char* text, char* text_end);
            public void InsertChars(int32 pos, char* text, char* text_end = null) mut=> InsertCharsImpl(&this, pos, text, text_end);
            
            [LinkName("ImGuiInputTextCallbackData_SelectAll")]
            private static extern void SelectAllImpl(Self* self);
            public void SelectAll() mut=> SelectAllImpl(&this);
            
        }
        
        [CRepr]
        public struct InputTextDeactivatedState
        {
            public ID ID;
            public Vector<char> TextA;
        
            [LinkName("ImGuiInputTextDeactivatedState_ImGuiInputTextDeactivatedState")]
            private static extern InputTextDeactivatedState* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiInputTextDeactivatedState_ClearFreeMemory")]
            private static extern void ClearFreeMemoryImpl(Self* self);
            public void ClearFreeMemory() mut=> ClearFreeMemoryImpl(&this);
            
        }
        
        [CRepr]
        public struct InputTextState
        {
            public Context* Ctx;
            public ID ID;
            public int32 CurLenW;
            public int32 CurLenA;
            public Vector<Wchar> TextW;
            public Vector<char> TextA;
            public Vector<char> InitialTextA;
            public bool TextAIsValid;
            public int32 BufCapacityA;
            public float ScrollX;
            public STB_TexteditState Stb;
            public float CursorAnim;
            public bool CursorFollow;
            public bool SelectedAllMouseLock;
            public bool Edited;
            public InputTextFlags Flags;
        
            [LinkName("ImGuiInputTextState_ImGuiInputTextState")]
            private static extern InputTextState* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiInputTextState_ClearFreeMemory")]
            private static extern void ClearFreeMemoryImpl(Self* self);
            public void ClearFreeMemory() mut=> ClearFreeMemoryImpl(&this);
            
            [LinkName("ImGuiInputTextState_ClearSelection")]
            private static extern void ClearSelectionImpl(Self* self);
            public void ClearSelection() mut=> ClearSelectionImpl(&this);
            
            [LinkName("ImGuiInputTextState_ClearText")]
            private static extern void ClearTextImpl(Self* self);
            public void ClearText() mut=> ClearTextImpl(&this);
            
            [LinkName("ImGuiInputTextState_CursorAnimReset")]
            private static extern void CursorAnimResetImpl(Self* self);
            public void CursorAnimReset() mut=> CursorAnimResetImpl(&this);
            
            [LinkName("ImGuiInputTextState_CursorClamp")]
            private static extern void CursorClampImpl(Self* self);
            public void CursorClamp() mut=> CursorClampImpl(&this);
            
            [LinkName("ImGuiInputTextState_GetCursorPos")]
            private static extern int32 GetCursorPosImpl(Self* self);
            public int32 GetCursorPos() mut=> GetCursorPosImpl(&this);
            
            [LinkName("ImGuiInputTextState_GetRedoAvailCount")]
            private static extern int32 GetRedoAvailCountImpl(Self* self);
            public int32 GetRedoAvailCount() mut=> GetRedoAvailCountImpl(&this);
            
            [LinkName("ImGuiInputTextState_GetSelectionEnd")]
            private static extern int32 GetSelectionEndImpl(Self* self);
            public int32 GetSelectionEnd() mut=> GetSelectionEndImpl(&this);
            
            [LinkName("ImGuiInputTextState_GetSelectionStart")]
            private static extern int32 GetSelectionStartImpl(Self* self);
            public int32 GetSelectionStart() mut=> GetSelectionStartImpl(&this);
            
            [LinkName("ImGuiInputTextState_GetUndoAvailCount")]
            private static extern int32 GetUndoAvailCountImpl(Self* self);
            public int32 GetUndoAvailCount() mut=> GetUndoAvailCountImpl(&this);
            
            [LinkName("ImGuiInputTextState_HasSelection")]
            private static extern bool HasSelectionImpl(Self* self);
            public bool HasSelection() mut=> HasSelectionImpl(&this);
            
            [LinkName("ImGuiInputTextState_OnKeyPressed")]
            private static extern void OnKeyPressedImpl(Self* self, int32 key);
            public void OnKeyPressed(int32 key) mut=> OnKeyPressedImpl(&this, key);
            
            [LinkName("ImGuiInputTextState_SelectAll")]
            private static extern void SelectAllImpl(Self* self);
            public void SelectAll() mut=> SelectAllImpl(&this);
            
        }
        
        [CRepr]
        public struct KeyData
        {
            public bool Down;
            public float DownDuration;
            public float DownDurationPrev;
            public float AnalogValue;
        
        }
        
        [CRepr]
        public struct KeyOwnerData
        {
            public ID OwnerCurr;
            public ID OwnerNext;
            public bool LockThisFrame;
            public bool LockUntilRelease;
        
            [LinkName("ImGuiKeyOwnerData_ImGuiKeyOwnerData")]
            private static extern KeyOwnerData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct KeyRoutingData
        {
            public KeyRoutingIndex NextEntryIndex;
            public U16 Mods;
            public U8 RoutingNextScore;
            public ID RoutingCurr;
            public ID RoutingNext;
        
            [LinkName("ImGuiKeyRoutingData_ImGuiKeyRoutingData")]
            private static extern KeyRoutingData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct KeyRoutingTable
        {
            public KeyRoutingIndex[140] Index;
            public Vector<KeyRoutingData> Entries;
            public Vector<KeyRoutingData> EntriesNext;
        
            [LinkName("ImGuiKeyRoutingTable_ImGuiKeyRoutingTable")]
            private static extern KeyRoutingTable* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiKeyRoutingTable_Clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
        }
        
        [CRepr]
        public struct LastItemData
        {
            public ID ID;
            public ItemFlags InFlags;
            public ItemStatusFlags StatusFlags;
            public Rect Rect;
            public Rect NavRect;
            public Rect DisplayRect;
        
            [LinkName("ImGuiLastItemData_ImGuiLastItemData")]
            private static extern LastItemData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct ListClipper
        {
            public Context* Ctx;
            public int32 DisplayStart;
            public int32 DisplayEnd;
            public int32 ItemsCount;
            public float ItemsHeight;
            public float StartPosY;
            public void* TempData;
        
            [LinkName("ImGuiListClipper_ImGuiListClipper")]
            private static extern ListClipper* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiListClipper_Begin")]
            private static extern void BeginImpl(Self* self, int32 items_count, float items_height);
            public void Begin(int32 items_count, float items_height = -1.0f) mut=> BeginImpl(&this, items_count, items_height);
            
            [LinkName("ImGuiListClipper_End")]
            private static extern void EndImpl(Self* self);
            public void End() mut=> EndImpl(&this);
            
            [LinkName("ImGuiListClipper_ForceDisplayRangeByIndices")]
            private static extern void ForceDisplayRangeByIndicesImpl(Self* self, int32 item_min, int32 item_max);
            public void ForceDisplayRangeByIndices(int32 item_min, int32 item_max) mut=> ForceDisplayRangeByIndicesImpl(&this, item_min, item_max);
            
            [LinkName("ImGuiListClipper_Step")]
            private static extern bool StepImpl(Self* self);
            public bool Step() mut=> StepImpl(&this);
            
        }
        
        [CRepr]
        public struct ListClipperData
        {
            public ListClipper* ListClipper;
            public float LossynessOffset;
            public int32 StepNo;
            public int32 ItemsFrozen;
            public Vector<ListClipperRange> Ranges;
        
            [LinkName("ImGuiListClipperData_ImGuiListClipperData")]
            private static extern ListClipperData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiListClipperData_Reset")]
            private static extern void ResetImpl(Self* self, ListClipper* clipper);
            public void Reset(ListClipper* clipper) mut=> ResetImpl(&this, clipper);
            
        }
        
        [CRepr]
        public struct ListClipperRange
        {
            public int32 Min;
            public int32 Max;
            public bool PosToIndexConvert;
            public S8 PosToIndexOffsetMin;
            public S8 PosToIndexOffsetMax;
        
        }
        
        [CRepr]
        public struct LocEntry
        {
            public LocKey Key;
            public char* Text;
        
        }
        
        [CRepr]
        public struct MenuColumns
        {
            public U32 TotalWidth;
            public U32 NextTotalWidth;
            public U16 Spacing;
            public U16 OffsetIcon;
            public U16 OffsetLabel;
            public U16 OffsetShortcut;
            public U16 OffsetMark;
            public U16[4] Widths;
        
            [LinkName("ImGuiMenuColumns_ImGuiMenuColumns")]
            private static extern MenuColumns* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiMenuColumns_CalcNextTotalWidth")]
            private static extern void CalcNextTotalWidthImpl(Self* self, bool update_offsets);
            public void CalcNextTotalWidth(bool update_offsets) mut=> CalcNextTotalWidthImpl(&this, update_offsets);
            
            [LinkName("ImGuiMenuColumns_DeclColumns")]
            private static extern float DeclColumnsImpl(Self* self, float w_icon, float w_label, float w_shortcut, float w_mark);
            public float DeclColumns(float w_icon, float w_label, float w_shortcut, float w_mark) mut=> DeclColumnsImpl(&this, w_icon, w_label, w_shortcut, w_mark);
            
            [LinkName("ImGuiMenuColumns_Update")]
            private static extern void UpdateImpl(Self* self, float spacing, bool window_reappearing);
            public void Update(float spacing, bool window_reappearing) mut=> UpdateImpl(&this, spacing, window_reappearing);
            
        }
        
        [CRepr]
        public struct MetricsConfig
        {
            public bool ShowDebugLog;
            public bool ShowStackTool;
            public bool ShowWindowsRects;
            public bool ShowWindowsBeginOrder;
            public bool ShowTablesRects;
            public bool ShowDrawCmdMesh;
            public bool ShowDrawCmdBoundingBoxes;
            public bool ShowAtlasTintedWithTextColor;
            public bool ShowDockingNodes;
            public int32 ShowWindowsRectsType;
            public int32 ShowTablesRectsType;
        
        }
        
        [CRepr]
        public struct NavItemData
        {
            public Window* Window;
            public ID ID;
            public ID FocusScopeId;
            public Rect RectRel;
            public ItemFlags InFlags;
            public float DistBox;
            public float DistCenter;
            public float DistAxial;
        
            [LinkName("ImGuiNavItemData_ImGuiNavItemData")]
            private static extern NavItemData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiNavItemData_Clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
        }
        
        [CRepr]
        public struct NextItemData
        {
            public NextItemDataFlags Flags;
            public float Width;
            public ID FocusScopeId;
            public Cond OpenCond;
            public bool OpenVal;
        
            [LinkName("ImGuiNextItemData_ImGuiNextItemData")]
            private static extern NextItemData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiNextItemData_ClearFlags")]
            private static extern void ClearFlagsImpl(Self* self);
            public void ClearFlags() mut=> ClearFlagsImpl(&this);
            
        }
        
        [CRepr]
        public struct NextWindowData
        {
            public NextWindowDataFlags Flags;
            public Cond PosCond;
            public Cond SizeCond;
            public Cond CollapsedCond;
            public Cond DockCond;
            public Vec2 PosVal;
            public Vec2 PosPivotVal;
            public Vec2 SizeVal;
            public Vec2 ContentSizeVal;
            public Vec2 ScrollVal;
            public bool PosUndock;
            public bool CollapsedVal;
            public Rect SizeConstraintRect;
            public SizeCallback SizeCallback;
            public void* SizeCallbackUserData;
            public float BgAlphaVal;
            public ID ViewportId;
            public ID DockId;
            public WindowClass WindowClass;
            public Vec2 MenuBarOffsetMinVal;
        
            [LinkName("ImGuiNextWindowData_ImGuiNextWindowData")]
            private static extern NextWindowData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiNextWindowData_ClearFlags")]
            private static extern void ClearFlagsImpl(Self* self);
            public void ClearFlags() mut=> ClearFlagsImpl(&this);
            
        }
        
        [CRepr]
        public struct OldColumnData
        {
            public float OffsetNorm;
            public float OffsetNormBeforeResize;
            public OldColumnFlags Flags;
            public Rect ClipRect;
        
            [LinkName("ImGuiOldColumnData_ImGuiOldColumnData")]
            private static extern OldColumnData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct OldColumns
        {
            public ID ID;
            public OldColumnFlags Flags;
            public bool IsFirstFrame;
            public bool IsBeingResized;
            public int32 Current;
            public int32 Count;
            public float OffMinX;
            public float OffMaxX;
            public float LineMinY;
            public float LineMaxY;
            public float HostCursorPosY;
            public float HostCursorMaxPosX;
            public Rect HostInitialClipRect;
            public Rect HostBackupClipRect;
            public Rect HostBackupParentWorkRect;
            public Vector<OldColumnData> Columns;
            public DrawListSplitter Splitter;
        
            [LinkName("ImGuiOldColumns_ImGuiOldColumns")]
            private static extern OldColumns* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct OnceUponAFrame
        {
            public int32 RefFrame;
        
            [LinkName("ImGuiOnceUponAFrame_ImGuiOnceUponAFrame")]
            private static extern OnceUponAFrame* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct Payload
        {
            public void* Data;
            public int32 DataSize;
            public ID SourceId;
            public ID SourceParentId;
            public int32 DataFrameCount;
            public char[33] DataType;
            public bool Preview;
            public bool Delivery;
        
            [LinkName("ImGuiPayload_ImGuiPayload")]
            private static extern Payload* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiPayload_Clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
            [LinkName("ImGuiPayload_IsDataType")]
            private static extern bool IsDataTypeImpl(Self* self, char* type);
            public bool IsDataType(char* type) mut=> IsDataTypeImpl(&this, type);
            
            [LinkName("ImGuiPayload_IsDelivery")]
            private static extern bool IsDeliveryImpl(Self* self);
            public bool IsDelivery() mut=> IsDeliveryImpl(&this);
            
            [LinkName("ImGuiPayload_IsPreview")]
            private static extern bool IsPreviewImpl(Self* self);
            public bool IsPreview() mut=> IsPreviewImpl(&this);
            
        }
        
        [CRepr]
        public struct PlatformIO
        {
            public function void(Viewport* vp) Platform_CreateWindow;
            public function void(Viewport* vp) Platform_DestroyWindow;
            public function void(Viewport* vp) Platform_ShowWindow;
            public function void(Viewport* vp, Vec2 pos) Platform_SetWindowPos;
            public function Vec2(Viewport* vp) Platform_GetWindowPos;
            public function void(Viewport* vp, Vec2 size) Platform_SetWindowSize;
            public function Vec2(Viewport* vp) Platform_GetWindowSize;
            public function void(Viewport* vp) Platform_SetWindowFocus;
            public function bool(Viewport* vp) Platform_GetWindowFocus;
            public function bool(Viewport* vp) Platform_GetWindowMinimized;
            public function void(Viewport* vp, char* str) Platform_SetWindowTitle;
            public function void(Viewport* vp, float alpha) Platform_SetWindowAlpha;
            public function void(Viewport* vp) Platform_UpdateWindow;
            public function void(Viewport* vp, void* render_arg) Platform_RenderWindow;
            public function void(Viewport* vp, void* render_arg) Platform_SwapBuffers;
            public function float(Viewport* vp) Platform_GetWindowDpiScale;
            public function void(Viewport* vp) Platform_OnChangedViewport;
            public function int(Viewport* vp, U64 vk_inst, void* vk_allocators, U64* out_vk_surface) Platform_CreateVkSurface;
            public function void(Viewport* vp) Renderer_CreateWindow;
            public function void(Viewport* vp) Renderer_DestroyWindow;
            public function void(Viewport* vp, Vec2 size) Renderer_SetWindowSize;
            public function void(Viewport* vp, void* render_arg) Renderer_RenderWindow;
            public function void(Viewport* vp, void* render_arg) Renderer_SwapBuffers;
            public Vector<PlatformMonitor> Monitors;
            public Vector<Viewport*> Viewports;
        
            [LinkName("ImGuiPlatformIO_ImGuiPlatformIO")]
            private static extern PlatformIO* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct PlatformImeData
        {
            public bool WantVisible;
            public Vec2 InputPos;
            public float InputLineHeight;
        
            [LinkName("ImGuiPlatformImeData_ImGuiPlatformImeData")]
            private static extern PlatformImeData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct PlatformMonitor
        {
            public Vec2 MainPos;
            public Vec2 MainSize;
            public Vec2 WorkPos;
            public Vec2 WorkSize;
            public float DpiScale;
        
            [LinkName("ImGuiPlatformMonitor_ImGuiPlatformMonitor")]
            private static extern PlatformMonitor* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct PopupData
        {
            public ID PopupId;
            public Window* Window;
            public Window* BackupNavWindow;
            public int32 ParentNavLayer;
            public int32 OpenFrameCount;
            public ID OpenParentId;
            public Vec2 OpenPopupPos;
            public Vec2 OpenMousePos;
        
            [LinkName("ImGuiPopupData_ImGuiPopupData")]
            private static extern PopupData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct PtrOrIndex
        {
            public void* Ptr;
            public int32 Index;
        
            [LinkName("ImGuiPtrOrIndex_ImGuiPtrOrIndex_Ptr")]
            private static extern PtrOrIndex* CtorImpl(void* ptr);
            public this(void* ptr)
            {
                this = *CtorImpl(ptr);
            }
            
            [LinkName("ImGuiPtrOrIndex_ImGuiPtrOrIndex_Int")]
            private static extern PtrOrIndex* CtorImpl(int32 index);
            public this(int32 index)
            {
                this = *CtorImpl(index);
            }
            
        }
        
        [CRepr]
        public struct SettingsHandler
        {
            public char* TypeName;
            public ID TypeHash;
            public function void(Context* ctx, SettingsHandler* handler) ClearAllFn;
            public function void(Context* ctx, SettingsHandler* handler) ReadInitFn;
            public function void*(Context* ctx, SettingsHandler* handler, char* name) ReadOpenFn;
            public function void(Context* ctx, SettingsHandler* handler, void* entry, char* line) ReadLineFn;
            public function void(Context* ctx, SettingsHandler* handler) ApplyAllFn;
            public function void(Context* ctx, SettingsHandler* handler, TextBuffer* out_buf) WriteAllFn;
            public void* UserData;
        
            [LinkName("ImGuiSettingsHandler_ImGuiSettingsHandler")]
            private static extern SettingsHandler* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct ShrinkWidthItem
        {
            public int32 Index;
            public float Width;
            public float InitialWidth;
        
        }
        
        [CRepr]
        public struct SizeCallbackData
        {
            public void* UserData;
            public Vec2 Pos;
            public Vec2 CurrentSize;
            public Vec2 DesiredSize;
        
        }
        
        [CRepr]
        public struct StackLevelInfo
        {
            public ID ID;
            public S8 QueryFrameCount;
            public bool QuerySuccess;
            public DataType DataType;
            public char[57] Desc;
        
            [LinkName("ImGuiStackLevelInfo_ImGuiStackLevelInfo")]
            private static extern StackLevelInfo* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct StackSizes
        {
            public short SizeOfIDStack;
            public short SizeOfColorStack;
            public short SizeOfStyleVarStack;
            public short SizeOfFontStack;
            public short SizeOfFocusScopeStack;
            public short SizeOfGroupStack;
            public short SizeOfItemFlagsStack;
            public short SizeOfBeginPopupStack;
            public short SizeOfDisabledStack;
        
            [LinkName("ImGuiStackSizes_ImGuiStackSizes")]
            private static extern StackSizes* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiStackSizes_CompareWithContextState")]
            private static extern void CompareWithContextStateImpl(Self* self, Context* ctx);
            public void CompareWithContextState(Context* ctx) mut=> CompareWithContextStateImpl(&this, ctx);
            
            [LinkName("ImGuiStackSizes_SetToContextState")]
            private static extern void SetToContextStateImpl(Self* self, Context* ctx);
            public void SetToContextState(Context* ctx) mut=> SetToContextStateImpl(&this, ctx);
            
        }
        
        [CRepr]
        public struct StackTool
        {
            public int32 LastActiveFrame;
            public int32 StackLevel;
            public ID QueryId;
            public Vector<StackLevelInfo> Results;
            public bool CopyToClipboardOnCtrlC;
            public float CopyToClipboardLastTime;
        
            [LinkName("ImGuiStackTool_ImGuiStackTool")]
            private static extern StackTool* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct Storage
        {
            public Vector<StoragePair> Data;
        
            [LinkName("ImGuiStorage_BuildSortByKey")]
            private static extern void BuildSortByKeyImpl(Self* self);
            public void BuildSortByKey() mut=> BuildSortByKeyImpl(&this);
            
            [LinkName("ImGuiStorage_Clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
            [LinkName("ImGuiStorage_GetBool")]
            private static extern bool GetBoolImpl(Self* self, ID key, bool default_val);
            public bool GetBool(ID key, bool default_val = false) mut=> GetBoolImpl(&this, key, default_val);
            
            [LinkName("ImGuiStorage_GetBoolRef")]
            private static extern bool* GetBoolRefImpl(Self* self, ID key, bool default_val);
            public bool* GetBoolRef(ID key, bool default_val = false) mut=> GetBoolRefImpl(&this, key, default_val);
            
            [LinkName("ImGuiStorage_GetFloat")]
            private static extern float GetFloatImpl(Self* self, ID key, float default_val);
            public float GetFloat(ID key, float default_val = (float) 0.0f) mut=> GetFloatImpl(&this, key, default_val);
            
            [LinkName("ImGuiStorage_GetFloatRef")]
            private static extern float* GetFloatRefImpl(Self* self, ID key, float default_val);
            public float* GetFloatRef(ID key, float default_val = (float) 0.0f) mut=> GetFloatRefImpl(&this, key, default_val);
            
            [LinkName("ImGuiStorage_GetInt")]
            private static extern int32 GetIntImpl(Self* self, ID key, int32 default_val);
            public int32 GetInt(ID key, int32 default_val = (int32) 0) mut=> GetIntImpl(&this, key, default_val);
            
            [LinkName("ImGuiStorage_GetIntRef")]
            private static extern int32* GetIntRefImpl(Self* self, ID key, int32 default_val);
            public int32* GetIntRef(ID key, int32 default_val = (int32) 0) mut=> GetIntRefImpl(&this, key, default_val);
            
            [LinkName("ImGuiStorage_GetVoidPtr")]
            private static extern void* GetVoidPtrImpl(Self* self, ID key);
            public void* GetVoidPtr(ID key) mut=> GetVoidPtrImpl(&this, key);
            
            [LinkName("ImGuiStorage_GetVoidPtrRef")]
            private static extern void** GetVoidPtrRefImpl(Self* self, ID key, void* default_val);
            public void** GetVoidPtrRef(ID key, void* default_val = null) mut=> GetVoidPtrRefImpl(&this, key, default_val);
            
            [LinkName("ImGuiStorage_SetAllInt")]
            private static extern void SetAllIntImpl(Self* self, int32 val);
            public void SetAllInt(int32 val) mut=> SetAllIntImpl(&this, val);
            
            [LinkName("ImGuiStorage_SetBool")]
            private static extern void SetBoolImpl(Self* self, ID key, bool val);
            public void SetBool(ID key, bool val) mut=> SetBoolImpl(&this, key, val);
            
            [LinkName("ImGuiStorage_SetFloat")]
            private static extern void SetFloatImpl(Self* self, ID key, float val);
            public void SetFloat(ID key, float val) mut=> SetFloatImpl(&this, key, val);
            
            [LinkName("ImGuiStorage_SetInt")]
            private static extern void SetIntImpl(Self* self, ID key, int32 val);
            public void SetInt(ID key, int32 val) mut=> SetIntImpl(&this, key, val);
            
            [LinkName("ImGuiStorage_SetVoidPtr")]
            private static extern void SetVoidPtrImpl(Self* self, ID key, void* val);
            public void SetVoidPtr(ID key, void* val) mut=> SetVoidPtrImpl(&this, key, val);
            
        }
        
        [CRepr]
        public struct StoragePair
        {
            public ID key;
            private StoragePairUnion0 Union0 = .();
            public int32 val_i { get { return Union0.val_i; } set mut { Union0.val_i = value; } };
            public float val_f { get { return Union0.val_f; } set mut { Union0.val_f = value; } };
            public void* val_p { get { return Union0.val_p; } set mut { Union0.val_p = value; } };
        
            [LinkName("ImGuiStoragePair_ImGuiStoragePair_Int")]
            private static extern StoragePair* CtorImpl(ID _key, int32 _val_i);
            public this(ID _key, int32 _val_i)
            {
                this = *CtorImpl(_key, _val_i);
            }
            
            [LinkName("ImGuiStoragePair_ImGuiStoragePair_Float")]
            private static extern StoragePair* CtorImpl(ID _key, float _val_f);
            public this(ID _key, float _val_f)
            {
                this = *CtorImpl(_key, _val_f);
            }
            
            [LinkName("ImGuiStoragePair_ImGuiStoragePair_Ptr")]
            private static extern StoragePair* CtorImpl(ID _key, void* _val_p);
            public this(ID _key, void* _val_p)
            {
                this = *CtorImpl(_key, _val_p);
            }
            [CRepr, Union]
            public struct StoragePairUnion0
            {
                public int32 val_i;
                public float val_f;
                public void* val_p;
            
            }
        }
        
        [CRepr]
        public struct Style
        {
            public float Alpha;
            public float DisabledAlpha;
            public Vec2 WindowPadding;
            public float WindowRounding;
            public float WindowBorderSize;
            public Vec2 WindowMinSize;
            public Vec2 WindowTitleAlign;
            public Dir WindowMenuButtonPosition;
            public float ChildRounding;
            public float ChildBorderSize;
            public float PopupRounding;
            public float PopupBorderSize;
            public Vec2 FramePadding;
            public float FrameRounding;
            public float FrameBorderSize;
            public Vec2 ItemSpacing;
            public Vec2 ItemInnerSpacing;
            public Vec2 CellPadding;
            public Vec2 TouchExtraPadding;
            public float IndentSpacing;
            public float ColumnsMinSpacing;
            public float ScrollbarSize;
            public float ScrollbarRounding;
            public float GrabMinSize;
            public float GrabRounding;
            public float LogSliderDeadzone;
            public float TabRounding;
            public float TabBorderSize;
            public float TabMinWidthForCloseButton;
            public Dir ColorButtonPosition;
            public Vec2 ButtonTextAlign;
            public Vec2 SelectableTextAlign;
            public float SeparatorTextBorderSize;
            public Vec2 SeparatorTextAlign;
            public Vec2 SeparatorTextPadding;
            public Vec2 DisplayWindowPadding;
            public Vec2 DisplaySafeAreaPadding;
            public float MouseCursorScale;
            public bool AntiAliasedLines;
            public bool AntiAliasedLinesUseTex;
            public bool AntiAliasedFill;
            public float CurveTessellationTol;
            public float CircleTessellationMaxError;
            public Vec4[55] Colors;
        
            [LinkName("ImGuiStyle_ImGuiStyle")]
            private static extern Style* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiStyle_ScaleAllSizes")]
            private static extern void ScaleAllSizesImpl(Self* self, float scale_factor);
            public void ScaleAllSizes(float scale_factor) mut=> ScaleAllSizesImpl(&this, scale_factor);
            
        }
        
        [CRepr]
        public struct StyleMod
        {
            public StyleVar VarIdx;
            private StyleModUnion0 Union0 = .();
            public int32[2] BackupInt { get { return Union0.BackupInt; } set mut { Union0.BackupInt = value; } };
            public float[2] BackupFloat { get { return Union0.BackupFloat; } set mut { Union0.BackupFloat = value; } };
        
            [LinkName("ImGuiStyleMod_ImGuiStyleMod_Int")]
            private static extern StyleMod* CtorImpl(StyleVar idx, int32 v);
            public this(StyleVar idx, int32 v)
            {
                this = *CtorImpl(idx, v);
            }
            
            [LinkName("ImGuiStyleMod_ImGuiStyleMod_Float")]
            private static extern StyleMod* CtorImpl(StyleVar idx, float v);
            public this(StyleVar idx, float v)
            {
                this = *CtorImpl(idx, v);
            }
            
            [LinkName("ImGuiStyleMod_ImGuiStyleMod_Vec2")]
            private static extern StyleMod* CtorImpl(StyleVar idx, Vec2 v);
            public this(StyleVar idx, Vec2 v)
            {
                this = *CtorImpl(idx, v);
            }
            [CRepr, Union]
            public struct StyleModUnion0
            {
                public int32[2] BackupInt;
                public float[2] BackupFloat;
            
            }
        }
        
        [CRepr]
        public struct TabBar
        {
            public Vector<TabItem> Tabs;
            public TabBarFlags Flags;
            public ID ID;
            public ID SelectedTabId;
            public ID NextSelectedTabId;
            public ID VisibleTabId;
            public int32 CurrFrameVisible;
            public int32 PrevFrameVisible;
            public Rect BarRect;
            public float CurrTabsContentsHeight;
            public float PrevTabsContentsHeight;
            public float WidthAllTabs;
            public float WidthAllTabsIdeal;
            public float ScrollingAnim;
            public float ScrollingTarget;
            public float ScrollingTargetDistToVisibility;
            public float ScrollingSpeed;
            public float ScrollingRectMinX;
            public float ScrollingRectMaxX;
            public ID ReorderRequestTabId;
            public S16 ReorderRequestOffset;
            public S8 BeginCount;
            public bool WantLayout;
            public bool VisibleTabWasSubmitted;
            public bool TabsAddedNew;
            public S16 TabsActiveCount;
            public S16 LastTabItemIdx;
            public float ItemSpacingY;
            public Vec2 FramePadding;
            public Vec2 BackupCursorPos;
            public TextBuffer TabsNames;
        
            [LinkName("ImGuiTabBar_ImGuiTabBar")]
            private static extern TabBar* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct TabItem
        {
            public ID ID;
            public TabItemFlags Flags;
            public Window* Window;
            public int32 LastFrameVisible;
            public int32 LastFrameSelected;
            public float Offset;
            public float Width;
            public float ContentWidth;
            public float RequestedWidth;
            public S32 NameOffset;
            public S16 BeginOrder;
            public S16 IndexDuringLayout;
            public bool WantClose;
        
            [LinkName("ImGuiTabItem_ImGuiTabItem")]
            private static extern TabItem* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct Table
        {
            public ID ID;
            public TableFlags Flags;
            public void* RawData;
            public TableTempData* TempData;
            public Span<TableColumn> Columns;
            public Span<TableColumnIdx> DisplayOrderToIndex;
            public Span<TableCellData> RowCellData;
            public BitArrayPtr EnabledMaskByDisplayOrder;
            public BitArrayPtr EnabledMaskByIndex;
            public BitArrayPtr VisibleMaskByIndex;
            public TableFlags SettingsLoadedFlags;
            public int32 SettingsOffset;
            public int32 LastFrameActive;
            public int32 ColumnsCount;
            public int32 CurrentRow;
            public int32 CurrentColumn;
            public S16 InstanceCurrent;
            public S16 InstanceInteracted;
            public float RowPosY1;
            public float RowPosY2;
            public float RowMinHeight;
            public float RowTextBaseline;
            public float RowIndentOffsetX;
            public TableRowFlags RowFlags;
            public TableRowFlags LastRowFlags;
            public int32 RowBgColorCounter;
            public U32[2] RowBgColor;
            public U32 BorderColorStrong;
            public U32 BorderColorLight;
            public float BorderX1;
            public float BorderX2;
            public float HostIndentX;
            public float MinColumnWidth;
            public float OuterPaddingX;
            public float CellPaddingX;
            public float CellPaddingY;
            public float CellSpacingX1;
            public float CellSpacingX2;
            public float InnerWidth;
            public float ColumnsGivenWidth;
            public float ColumnsAutoFitWidth;
            public float ColumnsStretchSumWeights;
            public float ResizedColumnNextWidth;
            public float ResizeLockMinContentsX2;
            public float RefScale;
            public Rect OuterRect;
            public Rect InnerRect;
            public Rect WorkRect;
            public Rect InnerClipRect;
            public Rect BgClipRect;
            public Rect Bg0ClipRectForDrawCmd;
            public Rect Bg2ClipRectForDrawCmd;
            public Rect HostClipRect;
            public Rect HostBackupInnerClipRect;
            public Window* OuterWindow;
            public Window* InnerWindow;
            public TextBuffer ColumnsNames;
            public DrawListSplitter* DrawSplitter;
            public TableInstanceData InstanceDataFirst;
            public Vector<TableInstanceData> InstanceDataExtra;
            public TableColumnSortSpecs SortSpecsSingle;
            public Vector<TableColumnSortSpecs> SortSpecsMulti;
            public TableSortSpecs SortSpecs;
            public TableColumnIdx SortSpecsCount;
            public TableColumnIdx ColumnsEnabledCount;
            public TableColumnIdx ColumnsEnabledFixedCount;
            public TableColumnIdx DeclColumnsCount;
            public TableColumnIdx HoveredColumnBody;
            public TableColumnIdx HoveredColumnBorder;
            public TableColumnIdx AutoFitSingleColumn;
            public TableColumnIdx ResizedColumn;
            public TableColumnIdx LastResizedColumn;
            public TableColumnIdx HeldHeaderColumn;
            public TableColumnIdx ReorderColumn;
            public TableColumnIdx ReorderColumnDir;
            public TableColumnIdx LeftMostEnabledColumn;
            public TableColumnIdx RightMostEnabledColumn;
            public TableColumnIdx LeftMostStretchedColumn;
            public TableColumnIdx RightMostStretchedColumn;
            public TableColumnIdx ContextPopupColumn;
            public TableColumnIdx FreezeRowsRequest;
            public TableColumnIdx FreezeRowsCount;
            public TableColumnIdx FreezeColumnsRequest;
            public TableColumnIdx FreezeColumnsCount;
            public TableColumnIdx RowCellDataCurrent;
            public TableDrawChannelIdx DummyDrawChannel;
            public TableDrawChannelIdx Bg2DrawChannelCurrent;
            public TableDrawChannelIdx Bg2DrawChannelUnfrozen;
            public bool IsLayoutLocked;
            public bool IsInsideRow;
            public bool IsInitializing;
            public bool IsSortSpecsDirty;
            public bool IsUsingHeaders;
            public bool IsContextPopupOpen;
            public bool IsSettingsRequestLoad;
            public bool IsSettingsDirty;
            public bool IsDefaultDisplayOrder;
            public bool IsResetAllRequest;
            public bool IsResetDisplayOrderRequest;
            public bool IsUnfrozenRows;
            public bool IsDefaultSizingPolicy;
            public bool HasScrollbarYCurr;
            public bool HasScrollbarYPrev;
            public bool MemoryCompacted;
            public bool HostSkipItems;
        
            [LinkName("ImGuiTable_ImGuiTable")]
            private static extern Table* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct TableCellData
        {
            public U32 BgColor;
            public TableColumnIdx Column;
        
        }
        
        [CRepr]
        public struct TableColumn
        {
            public TableColumnFlags Flags;
            public float WidthGiven;
            public float MinX;
            public float MaxX;
            public float WidthRequest;
            public float WidthAuto;
            public float StretchWeight;
            public float InitStretchWeightOrWidth;
            public Rect ClipRect;
            public ID UserID;
            public float WorkMinX;
            public float WorkMaxX;
            public float ItemWidth;
            public float ContentMaxXFrozen;
            public float ContentMaxXUnfrozen;
            public float ContentMaxXHeadersUsed;
            public float ContentMaxXHeadersIdeal;
            public S16 NameOffset;
            public TableColumnIdx DisplayOrder;
            public TableColumnIdx IndexWithinEnabledSet;
            public TableColumnIdx PrevEnabledColumn;
            public TableColumnIdx NextEnabledColumn;
            public TableColumnIdx SortOrder;
            public TableDrawChannelIdx DrawChannelCurrent;
            public TableDrawChannelIdx DrawChannelFrozen;
            public TableDrawChannelIdx DrawChannelUnfrozen;
            public bool IsEnabled;
            public bool IsUserEnabled;
            public bool IsUserEnabledNextFrame;
            public bool IsVisibleX;
            public bool IsVisibleY;
            public bool IsRequestOutput;
            public bool IsSkipItems;
            public bool IsPreserveWidthAuto;
            public S8 NavLayerCurrent;
            public U8 AutoFitQueue;
            public U8 CannotSkipItemsQueue;
            public U8 SortDirection;
            public U8 SortDirectionsAvailCount;
            public U8 SortDirectionsAvailMask;
            public U8 SortDirectionsAvailList;
        
            [LinkName("ImGuiTableColumn_ImGuiTableColumn")]
            private static extern TableColumn* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct TableColumnSettings
        {
            public float WidthOrWeight;
            public ID UserID;
            public TableColumnIdx Index;
            public TableColumnIdx DisplayOrder;
            public TableColumnIdx SortOrder;
            public U8 SortDirection;
            public U8 IsEnabled;
            public U8 IsStretch;
        
            [LinkName("ImGuiTableColumnSettings_ImGuiTableColumnSettings")]
            private static extern TableColumnSettings* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct TableColumnSortSpecs
        {
            public ID ColumnUserID;
            public S16 ColumnIndex;
            public S16 SortOrder;
            public SortDirection SortDirection;
        
            [LinkName("ImGuiTableColumnSortSpecs_ImGuiTableColumnSortSpecs")]
            private static extern TableColumnSortSpecs* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct TableInstanceData
        {
            public ID TableInstanceID;
            public float LastOuterHeight;
            public float LastFirstRowHeight;
            public float LastFrozenHeight;
        
            [LinkName("ImGuiTableInstanceData_ImGuiTableInstanceData")]
            private static extern TableInstanceData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct TableSettings
        {
            public ID ID;
            public TableFlags SaveFlags;
            public float RefScale;
            public TableColumnIdx ColumnsCount;
            public TableColumnIdx ColumnsCountMax;
            public bool WantApply;
        
            [LinkName("ImGuiTableSettings_ImGuiTableSettings")]
            private static extern TableSettings* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiTableSettings_GetColumnSettings")]
            private static extern TableColumnSettings* GetColumnSettingsImpl(Self* self);
            public TableColumnSettings* GetColumnSettings() mut=> GetColumnSettingsImpl(&this);
            
        }
        
        [CRepr]
        public struct TableSortSpecs
        {
            public TableColumnSortSpecs* Specs;
            public int32 SpecsCount;
            public bool SpecsDirty;
        
            [LinkName("ImGuiTableSortSpecs_ImGuiTableSortSpecs")]
            private static extern TableSortSpecs* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct TableTempData
        {
            public int32 TableIndex;
            public float LastTimeActive;
            public Vec2 UserOuterSize;
            public DrawListSplitter DrawSplitter;
            public Rect HostBackupWorkRect;
            public Rect HostBackupParentWorkRect;
            public Vec2 HostBackupPrevLineSize;
            public Vec2 HostBackupCurrLineSize;
            public Vec2 HostBackupCursorMaxPos;
            public Vec1 HostBackupColumnsOffset;
            public float HostBackupItemWidth;
            public int32 HostBackupItemWidthStackSize;
        
            [LinkName("ImGuiTableTempData_ImGuiTableTempData")]
            private static extern TableTempData* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct TextBuffer
        {
            public Vector<char> Buf;
        
            [LinkName("ImGuiTextBuffer_ImGuiTextBuffer")]
            private static extern TextBuffer* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiTextBuffer_append")]
            private static extern void AppendImpl(Self* self, char* str, char* str_end);
            public void Append(char* str, char* str_end = null) mut=> AppendImpl(&this, str, str_end);
            
            [LinkName("ImGuiTextBuffer_appendf")]
            private static extern void AppendfImpl(Self* self, char* fmt, ...);
            public void Appendf(char* fmt, params Object[] args) mut=> AppendfImpl(&this, scope String()..AppendF(StringView(fmt), params args));
            
            [LinkName("ImGuiTextBuffer_begin")]
            private static extern char* BeginImpl(Self* self);
            public char* Begin() mut=> BeginImpl(&this);
            
            [LinkName("ImGuiTextBuffer_c_str")]
            private static extern char* CStrImpl(Self* self);
            public char* CStr() mut=> CStrImpl(&this);
            
            [LinkName("ImGuiTextBuffer_clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
            [LinkName("ImGuiTextBuffer_empty")]
            private static extern bool EmptyImpl(Self* self);
            public bool Empty() mut=> EmptyImpl(&this);
            
            [LinkName("ImGuiTextBuffer_end")]
            private static extern char* EndImpl(Self* self);
            public char* End() mut=> EndImpl(&this);
            
            [LinkName("ImGuiTextBuffer_reserve")]
            private static extern void ReserveImpl(Self* self, int32 capacity);
            public void Reserve(int32 capacity) mut=> ReserveImpl(&this, capacity);
            
            [LinkName("ImGuiTextBuffer_size")]
            private static extern int32 SizeImpl(Self* self);
            public int32 Size() mut=> SizeImpl(&this);
            
        }
        
        [CRepr]
        public struct TextFilter
        {
            public char[256] InputBuf;
            public Vector<TextRange> Filters;
            public int32 CountGrep;
        
            [LinkName("ImGuiTextFilter_ImGuiTextFilter")]
            private static extern TextFilter* CtorImpl(char* default_filter);
            public this(char* default_filter = "")
            {
                this = *CtorImpl(default_filter);
            }
            
            [LinkName("ImGuiTextFilter_Build")]
            private static extern void BuildImpl(Self* self);
            public void Build() mut=> BuildImpl(&this);
            
            [LinkName("ImGuiTextFilter_Clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
            [LinkName("ImGuiTextFilter_Draw")]
            private static extern bool DrawImpl(Self* self, char* label, float width);
            public bool Draw(char* label = "Filter(inc,-exc)", float width = (float) 0.0f) mut=> DrawImpl(&this, label, width);
            
            [LinkName("ImGuiTextFilter_IsActive")]
            private static extern bool IsActiveImpl(Self* self);
            public bool IsActive() mut=> IsActiveImpl(&this);
            
            [LinkName("ImGuiTextFilter_PassFilter")]
            private static extern bool PassFilterImpl(Self* self, char* text, char* text_end);
            public bool PassFilter(char* text, char* text_end = null) mut=> PassFilterImpl(&this, text, text_end);
            
        }
        
        [CRepr]
        public struct TextIndex
        {
            public Vector<int32> LineOffsets;
            public int32 EndOffset;
        
            [LinkName("ImGuiTextIndex_append")]
            private static extern void AppendImpl(Self* self, char* base_, int32 old_size, int32 new_size);
            public void Append(char* base_, int32 old_size, int32 new_size) mut=> AppendImpl(&this, base_, old_size, new_size);
            
            [LinkName("ImGuiTextIndex_clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
            [LinkName("ImGuiTextIndex_get_line_begin")]
            private static extern char* GetLineBeginImpl(Self* self, char* base_, int32 n);
            public char* GetLineBegin(char* base_, int32 n) mut=> GetLineBeginImpl(&this, base_, n);
            
            [LinkName("ImGuiTextIndex_get_line_end")]
            private static extern char* GetLineEndImpl(Self* self, char* base_, int32 n);
            public char* GetLineEnd(char* base_, int32 n) mut=> GetLineEndImpl(&this, base_, n);
            
            [LinkName("ImGuiTextIndex_size")]
            private static extern int32 SizeImpl(Self* self);
            public int32 Size() mut=> SizeImpl(&this);
            
        }
        
        [CRepr]
        public struct TextRange
        {
            public char* b;
            public char* e;
        
            [LinkName("ImGuiTextRange_ImGuiTextRange_Nil")]
            private static extern TextRange* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiTextRange_ImGuiTextRange_Str")]
            private static extern TextRange* CtorImpl(char* _b, char* _e);
            public this(char* _b, char* _e)
            {
                this = *CtorImpl(_b, _e);
            }
            
            [LinkName("ImGuiTextRange_empty")]
            private static extern bool EmptyImpl(Self* self);
            public bool Empty() mut=> EmptyImpl(&this);
            
            [LinkName("ImGuiTextRange_split")]
            private static extern void SplitImpl(Self* self, char separator, Vector<TextRange*> out_);
            public void Split(char separator, Vector<TextRange*> out_) mut=> SplitImpl(&this, separator, out_);
            
        }
        
        [CRepr]
        public struct Viewport
        {
            public ID ID;
            public ViewportFlags Flags;
            public Vec2 Pos;
            public Vec2 Size;
            public Vec2 WorkPos;
            public Vec2 WorkSize;
            public float DpiScale;
            public ID ParentViewportId;
            public DrawData* DrawData;
            public void* RendererUserData;
            public void* PlatformUserData;
            public void* PlatformHandle;
            public void* PlatformHandleRaw;
            public bool PlatformWindowCreated;
            public bool PlatformRequestMove;
            public bool PlatformRequestResize;
            public bool PlatformRequestClose;
        
            [LinkName("ImGuiViewport_ImGuiViewport")]
            private static extern Viewport* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiViewport_GetCenter")]
            private static extern Vec2 GetCenterImpl(Vec2* pOut, Self* self);
            public Vec2 GetCenter() mut
            {
                Vec2 pOut = default;
                GetCenterImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImGuiViewport_GetWorkCenter")]
            private static extern Vec2 GetWorkCenterImpl(Vec2* pOut, Self* self);
            public Vec2 GetWorkCenter() mut
            {
                Vec2 pOut = default;
                GetWorkCenterImpl(&pOut, &this);
                return pOut;
            }
            
        }
        
        [CRepr]
        public struct ViewportP
        {
            public Viewport _ImGuiViewport;
            public Window* Window;
            public int32 Idx;
            public int32 LastFrameActive;
            public int32 LastFocusedStampCount;
            public ID LastNameHash;
            public Vec2 LastPos;
            public float Alpha;
            public float LastAlpha;
            public bool LastFocusedHadNavWindow;
            public short PlatformMonitor;
            public int32[2] DrawListsLastFrame;
            public DrawList*[2] DrawLists;
            public DrawData DrawDataP;
            public DrawDataBuilder DrawDataBuilder;
            public Vec2 LastPlatformPos;
            public Vec2 LastPlatformSize;
            public Vec2 LastRendererSize;
            public Vec2 WorkOffsetMin;
            public Vec2 WorkOffsetMax;
            public Vec2 BuildWorkOffsetMin;
            public Vec2 BuildWorkOffsetMax;
        
            [LinkName("ImGuiViewportP_ImGuiViewportP")]
            private static extern ViewportP* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiViewportP_CalcWorkRectPos")]
            private static extern Vec2 CalcWorkRectPosImpl(Vec2* pOut, Self* self, Vec2 off_min);
            public Vec2 CalcWorkRectPos(Vec2 off_min) mut
            {
                Vec2 pOut = default;
                CalcWorkRectPosImpl(&pOut, &this, off_min);
                return pOut;
            }
            
            [LinkName("ImGuiViewportP_CalcWorkRectSize")]
            private static extern Vec2 CalcWorkRectSizeImpl(Vec2* pOut, Self* self, Vec2 off_min, Vec2 off_max);
            public Vec2 CalcWorkRectSize(Vec2 off_min, Vec2 off_max) mut
            {
                Vec2 pOut = default;
                CalcWorkRectSizeImpl(&pOut, &this, off_min, off_max);
                return pOut;
            }
            
            [LinkName("ImGuiViewportP_ClearRequestFlags")]
            private static extern void ClearRequestFlagsImpl(Self* self);
            public void ClearRequestFlags() mut=> ClearRequestFlagsImpl(&this);
            
            [LinkName("ImGuiViewportP_GetBuildWorkRect")]
            private static extern Rect GetBuildWorkRectImpl(Rect* pOut, Self* self);
            public Rect GetBuildWorkRect() mut
            {
                Rect pOut = default;
                GetBuildWorkRectImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImGuiViewportP_GetMainRect")]
            private static extern Rect GetMainRectImpl(Rect* pOut, Self* self);
            public Rect GetMainRect() mut
            {
                Rect pOut = default;
                GetMainRectImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImGuiViewportP_GetWorkRect")]
            private static extern Rect GetWorkRectImpl(Rect* pOut, Self* self);
            public Rect GetWorkRect() mut
            {
                Rect pOut = default;
                GetWorkRectImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImGuiViewportP_UpdateWorkRect")]
            private static extern void UpdateWorkRectImpl(Self* self);
            public void UpdateWorkRect() mut=> UpdateWorkRectImpl(&this);
            
        }
        
        [CRepr]
        public struct Window
        {
            public Context* Ctx;
            public char* Name;
            public ID ID;
            public WindowFlags Flags;
            public WindowFlags FlagsPreviousFrame;
            public WindowClass WindowClass;
            public ViewportP* Viewport;
            public ID ViewportId;
            public Vec2 ViewportPos;
            public int32 ViewportAllowPlatformMonitorExtend;
            public Vec2 Pos;
            public Vec2 Size;
            public Vec2 SizeFull;
            public Vec2 ContentSize;
            public Vec2 ContentSizeIdeal;
            public Vec2 ContentSizeExplicit;
            public Vec2 WindowPadding;
            public float WindowRounding;
            public float WindowBorderSize;
            public float DecoOuterSizeX1;
            public float DecoOuterSizeY1;
            public float DecoOuterSizeX2;
            public float DecoOuterSizeY2;
            public float DecoInnerSizeX1;
            public float DecoInnerSizeY1;
            public int32 NameBufLen;
            public ID MoveId;
            public ID TabId;
            public ID ChildId;
            public Vec2 Scroll;
            public Vec2 ScrollMax;
            public Vec2 ScrollTarget;
            public Vec2 ScrollTargetCenterRatio;
            public Vec2 ScrollTargetEdgeSnapDist;
            public Vec2 ScrollbarSizes;
            public bool ScrollbarX;
            public bool ScrollbarY;
            public bool ViewportOwned;
            public bool Active;
            public bool WasActive;
            public bool WriteAccessed;
            public bool Collapsed;
            public bool WantCollapseToggle;
            public bool SkipItems;
            public bool Appearing;
            public bool Hidden;
            public bool IsFallbackWindow;
            public bool IsExplicitChild;
            public bool HasCloseButton;
            public char ResizeBorderHeld;
            public short BeginCount;
            public short BeginCountPreviousFrame;
            public short BeginOrderWithinParent;
            public short BeginOrderWithinContext;
            public short FocusOrder;
            public ID PopupId;
            public S8 AutoFitFramesX;
            public S8 AutoFitFramesY;
            public S8 AutoFitChildAxises;
            public bool AutoFitOnlyGrows;
            public Dir AutoPosLastDirection;
            public S8 HiddenFramesCanSkipItems;
            public S8 HiddenFramesCannotSkipItems;
            public S8 HiddenFramesForRenderOnly;
            public S8 DisableInputsFrames;
            public Cond SetWindowPosAllowFlags;
            public Cond SetWindowSizeAllowFlags;
            public Cond SetWindowCollapsedAllowFlags;
            public Cond SetWindowDockAllowFlags;
            public Vec2 SetWindowPosVal;
            public Vec2 SetWindowPosPivot;
            public Vector<ID> IDStack;
            public WindowTempData DC;
            public Rect OuterRectClipped;
            public Rect InnerRect;
            public Rect InnerClipRect;
            public Rect WorkRect;
            public Rect ParentWorkRect;
            public Rect ClipRect;
            public Rect ContentRegionRect;
            public Vec2ih HitTestHoleSize;
            public Vec2ih HitTestHoleOffset;
            public int32 LastFrameActive;
            public int32 LastFrameJustFocused;
            public float LastTimeActive;
            public float ItemWidthDefault;
            public Storage StateStorage;
            public Vector<OldColumns> ColumnsStorage;
            public float FontWindowScale;
            public float FontDpiScale;
            public int32 SettingsOffset;
            public DrawList* DrawList;
            public DrawList DrawListInst;
            public Window* ParentWindow;
            public Window* ParentWindowInBeginStack;
            public Window* RootWindow;
            public Window* RootWindowPopupTree;
            public Window* RootWindowDockTree;
            public Window* RootWindowForTitleBarHighlight;
            public Window* RootWindowForNav;
            public Window* NavLastChildNavWindow;
            public ID[2] NavLastIds;
            public Rect[2] NavRectRel;
            public ID NavRootFocusScopeId;
            public int32 MemoryDrawListIdxCapacity;
            public int32 MemoryDrawListVtxCapacity;
            public bool MemoryCompacted;
            public bool DockIsActive;
            public bool DockNodeIsVisible;
            public bool DockTabIsVisible;
            public bool DockTabWantClose;
            public short DockOrder;
            public WindowDockStyle DockStyle;
            public DockNode* DockNode;
            public DockNode* DockNodeAsHost;
            public ID DockId;
            public ItemStatusFlags DockTabItemStatusFlags;
            public Rect DockTabItemRect;
        
            [LinkName("ImGuiWindow_ImGuiWindow")]
            private static extern Window* CtorImpl(Context* context, char* name);
            public this(Context* context, char* name)
            {
                this = *CtorImpl(context, name);
            }
            
            [LinkName("ImGuiWindow_CalcFontSize")]
            private static extern float CalcFontSizeImpl(Self* self);
            public float CalcFontSize() mut=> CalcFontSizeImpl(&this);
            
            [LinkName("ImGuiWindow_GetID_Str")]
            private static extern ID GetIDImpl(Self* self, char* str, char* str_end);
            public ID GetID(char* str, char* str_end = null) mut=> GetIDImpl(&this, str, str_end);
            
            [LinkName("ImGuiWindow_GetID_Ptr")]
            private static extern ID GetIDImpl(Self* self, void* ptr);
            public ID GetID(void* ptr) mut=> GetIDImpl(&this, ptr);
            
            [LinkName("ImGuiWindow_GetID_Int")]
            private static extern ID GetIDImpl(Self* self, int32 n);
            public ID GetID(int32 n) mut=> GetIDImpl(&this, n);
            
            [LinkName("ImGuiWindow_GetIDFromRectangle")]
            private static extern ID GetIDFromRectangleImpl(Self* self, Rect r_abs);
            public ID GetIDFromRectangle(Rect r_abs) mut=> GetIDFromRectangleImpl(&this, r_abs);
            
            [LinkName("ImGuiWindow_MenuBarHeight")]
            private static extern float MenuBarHeightImpl(Self* self);
            public float MenuBarHeight() mut=> MenuBarHeightImpl(&this);
            
            [LinkName("ImGuiWindow_MenuBarRect")]
            private static extern Rect MenuBarRectImpl(Rect* pOut, Self* self);
            public Rect MenuBarRect() mut
            {
                Rect pOut = default;
                MenuBarRectImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImGuiWindow_Rect")]
            private static extern Rect RectImpl(Rect* pOut, Self* self);
            public Rect Rect() mut
            {
                Rect pOut = default;
                RectImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImGuiWindow_TitleBarHeight")]
            private static extern float TitleBarHeightImpl(Self* self);
            public float TitleBarHeight() mut=> TitleBarHeightImpl(&this);
            
            [LinkName("ImGuiWindow_TitleBarRect")]
            private static extern Rect TitleBarRectImpl(Rect* pOut, Self* self);
            public Rect TitleBarRect() mut
            {
                Rect pOut = default;
                TitleBarRectImpl(&pOut, &this);
                return pOut;
            }
            
        }
        
        [CRepr]
        public struct WindowClass
        {
            public ID ClassId;
            public ID ParentViewportId;
            public ViewportFlags ViewportFlagsOverrideSet;
            public ViewportFlags ViewportFlagsOverrideClear;
            public TabItemFlags TabItemFlagsOverrideSet;
            public DockNodeFlags DockNodeFlagsOverrideSet;
            public bool DockingAlwaysTabBar;
            public bool DockingAllowUnclassed;
        
            [LinkName("ImGuiWindowClass_ImGuiWindowClass")]
            private static extern WindowClass* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
        }
        
        [CRepr]
        public struct WindowDockStyle
        {
            public U32[6] Colors;
        
        }
        
        [CRepr]
        public struct WindowSettings
        {
            public ID ID;
            public Vec2ih Pos;
            public Vec2ih Size;
            public Vec2ih ViewportPos;
            public ID ViewportId;
            public ID DockId;
            public ID ClassId;
            public short DockOrder;
            public bool Collapsed;
            public bool WantApply;
            public bool WantDelete;
        
            [LinkName("ImGuiWindowSettings_ImGuiWindowSettings")]
            private static extern WindowSettings* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImGuiWindowSettings_GetName")]
            private static extern char* GetNameImpl(Self* self);
            public char* GetName() mut=> GetNameImpl(&this);
            
        }
        
        [CRepr]
        public struct WindowStackData
        {
            public Window* Window;
            public LastItemData ParentLastItemDataBackup;
            public StackSizes StackSizesOnBegin;
        
        }
        
        [CRepr]
        public struct WindowTempData
        {
            public Vec2 CursorPos;
            public Vec2 CursorPosPrevLine;
            public Vec2 CursorStartPos;
            public Vec2 CursorMaxPos;
            public Vec2 IdealMaxPos;
            public Vec2 CurrLineSize;
            public Vec2 PrevLineSize;
            public float CurrLineTextBaseOffset;
            public float PrevLineTextBaseOffset;
            public bool IsSameLine;
            public bool IsSetPos;
            public Vec1 Indent;
            public Vec1 ColumnsOffset;
            public Vec1 GroupOffset;
            public Vec2 CursorStartPosLossyness;
            public NavLayer NavLayerCurrent;
            public short NavLayersActiveMask;
            public short NavLayersActiveMaskNext;
            public bool NavHideHighlightOneFrame;
            public bool NavHasScroll;
            public bool MenuBarAppending;
            public Vec2 MenuBarOffset;
            public MenuColumns MenuColumns;
            public int32 TreeDepth;
            public U32 TreeJumpToParentOnPopMask;
            public Vector<Window*> ChildWindows;
            public Storage* StateStorage;
            public OldColumns* CurrentColumns;
            public int32 CurrentTableIdx;
            public LayoutType LayoutType;
            public LayoutType ParentLayoutType;
            public float ItemWidth;
            public float TextWrapPos;
            public Vector<float> ItemWidthStack;
            public Vector<float> TextWrapPosStack;
        
        }
        
        [CRepr]
        public struct Rect
        {
            public Vec2 Min;
            public Vec2 Max;
        
            [LinkName("ImRect_ImRect_Nil")]
            private static extern Rect* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImRect_ImRect_Vec2")]
            private static extern Rect* CtorImpl(Vec2 min, Vec2 max);
            public this(Vec2 min, Vec2 max)
            {
                this = *CtorImpl(min, max);
            }
            
            [LinkName("ImRect_ImRect_Vec4")]
            private static extern Rect* CtorImpl(Vec4 v);
            public this(Vec4 v)
            {
                this = *CtorImpl(v);
            }
            
            [LinkName("ImRect_ImRect_Float")]
            private static extern Rect* CtorImpl(float x1, float y1, float x2, float y2);
            public this(float x1, float y1, float x2, float y2)
            {
                this = *CtorImpl(x1, y1, x2, y2);
            }
            
            [LinkName("ImRect_Add_Vec2")]
            private static extern void AddImpl(Self* self, Vec2 p);
            public void Add(Vec2 p) mut=> AddImpl(&this, p);
            
            [LinkName("ImRect_Add_Rect")]
            private static extern void AddImpl(Self* self, Rect r);
            public void Add(Rect r) mut=> AddImpl(&this, r);
            
            [LinkName("ImRect_ClipWith")]
            private static extern void ClipWithImpl(Self* self, Rect r);
            public void ClipWith(Rect r) mut=> ClipWithImpl(&this, r);
            
            [LinkName("ImRect_ClipWithFull")]
            private static extern void ClipWithFullImpl(Self* self, Rect r);
            public void ClipWithFull(Rect r) mut=> ClipWithFullImpl(&this, r);
            
            [LinkName("ImRect_Contains_Vec2")]
            private static extern bool ContainsImpl(Self* self, Vec2 p);
            public bool Contains(Vec2 p) mut=> ContainsImpl(&this, p);
            
            [LinkName("ImRect_Contains_Rect")]
            private static extern bool ContainsImpl(Self* self, Rect r);
            public bool Contains(Rect r) mut=> ContainsImpl(&this, r);
            
            [LinkName("ImRect_Expand_Float")]
            private static extern void ExpandImpl(Self* self, float amount);
            public void Expand(float amount) mut=> ExpandImpl(&this, amount);
            
            [LinkName("ImRect_Expand_Vec2")]
            private static extern void ExpandImpl(Self* self, Vec2 amount);
            public void Expand(Vec2 amount) mut=> ExpandImpl(&this, amount);
            
            [LinkName("ImRect_Floor")]
            private static extern void FloorImpl(Self* self);
            public void Floor() mut=> FloorImpl(&this);
            
            [LinkName("ImRect_GetArea")]
            private static extern float GetAreaImpl(Self* self);
            public float GetArea() mut=> GetAreaImpl(&this);
            
            [LinkName("ImRect_GetBL")]
            private static extern Vec2 GetBLImpl(Vec2* pOut, Self* self);
            public Vec2 GetBL() mut
            {
                Vec2 pOut = default;
                GetBLImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImRect_GetBR")]
            private static extern Vec2 GetBRImpl(Vec2* pOut, Self* self);
            public Vec2 GetBR() mut
            {
                Vec2 pOut = default;
                GetBRImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImRect_GetCenter")]
            private static extern Vec2 GetCenterImpl(Vec2* pOut, Self* self);
            public Vec2 GetCenter() mut
            {
                Vec2 pOut = default;
                GetCenterImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImRect_GetHeight")]
            private static extern float GetHeightImpl(Self* self);
            public float GetHeight() mut=> GetHeightImpl(&this);
            
            [LinkName("ImRect_GetSize")]
            private static extern Vec2 GetSizeImpl(Vec2* pOut, Self* self);
            public Vec2 GetSize() mut
            {
                Vec2 pOut = default;
                GetSizeImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImRect_GetTL")]
            private static extern Vec2 GetTLImpl(Vec2* pOut, Self* self);
            public Vec2 GetTL() mut
            {
                Vec2 pOut = default;
                GetTLImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImRect_GetTR")]
            private static extern Vec2 GetTRImpl(Vec2* pOut, Self* self);
            public Vec2 GetTR() mut
            {
                Vec2 pOut = default;
                GetTRImpl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImRect_GetWidth")]
            private static extern float GetWidthImpl(Self* self);
            public float GetWidth() mut=> GetWidthImpl(&this);
            
            [LinkName("ImRect_IsInverted")]
            private static extern bool IsInvertedImpl(Self* self);
            public bool IsInverted() mut=> IsInvertedImpl(&this);
            
            [LinkName("ImRect_Overlaps")]
            private static extern bool OverlapsImpl(Self* self, Rect r);
            public bool Overlaps(Rect r) mut=> OverlapsImpl(&this, r);
            
            [LinkName("ImRect_ToVec4")]
            private static extern Vec4 ToVec4Impl(Vec4* pOut, Self* self);
            public Vec4 ToVec4() mut
            {
                Vec4 pOut = default;
                ToVec4Impl(&pOut, &this);
                return pOut;
            }
            
            [LinkName("ImRect_Translate")]
            private static extern void TranslateImpl(Self* self, Vec2 d);
            public void Translate(Vec2 d) mut=> TranslateImpl(&this, d);
            
            [LinkName("ImRect_TranslateX")]
            private static extern void TranslateXImpl(Self* self, float dx);
            public void TranslateX(float dx) mut=> TranslateXImpl(&this, dx);
            
            [LinkName("ImRect_TranslateY")]
            private static extern void TranslateYImpl(Self* self, float dy);
            public void TranslateY(float dy) mut=> TranslateYImpl(&this, dy);
            
        }
        
        [CRepr]
        public struct Vec1
        {
            public float x;
        
            [LinkName("ImVec1_ImVec1_Nil")]
            private static extern Vec1* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImVec1_ImVec1_Float")]
            private static extern Vec1* CtorImpl(float _x);
            public this(float _x)
            {
                this = *CtorImpl(_x);
            }
            
        }
        
        [CRepr]
        public struct Vec2
        {
            public float x;
            public float y;
        
            public this()
            {
                x = 0;
                y = 0;
            }
            
            public this(float x, float y)
            {
                this.x = x;
                this.y = y;
            }
            
        }
        
        [CRepr]
        public struct Vec2ih
        {
            public short x;
            public short y;
        
            [LinkName("ImVec2ih_ImVec2ih_Nil")]
            private static extern Vec2ih* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImVec2ih_ImVec2ih_short")]
            private static extern Vec2ih* CtorImpl(short _x, short _y);
            public this(short _x, short _y)
            {
                this = *CtorImpl(_x, _y);
            }
            
            [LinkName("ImVec2ih_ImVec2ih_Vec2")]
            private static extern Vec2ih* CtorImpl(Vec2 rhs);
            public this(Vec2 rhs)
            {
                this = *CtorImpl(rhs);
            }
            
        }
        
        [CRepr]
        public struct Vec4
        {
            public float x;
            public float y;
            public float z;
            public float w;
        
            public this()
            {
            	x = 0;
            	y = 0;
            	z = 0;
            	w = 0;
            }
            
            public this(float x, float y, float z, float w)
            {
            	this.x = x;
            	this.y = y;
            	this.z = z;
            	this.w = w;
            }
            
        }
        
        [CRepr]
        public struct STB_TexteditState
        {
            public int32 cursor;
            public int32 select_start;
            public int32 select_end;
            public uchar insert_mode;
            public int32 row_count_per_page;
            public uchar cursor_at_end_of_line;
            public uchar initialized;
            public uchar has_preferred_x;
            public uchar single_line;
            public uchar padding1;
            public uchar padding2;
            public uchar padding3;
            public float preferred_x;
            public StbUndoState undostate;
        
        }
        
        [CRepr]
        public struct StbTexteditRow
        {
            public float x0;
            public float x1;
            public float baseline_y_delta;
            public float ymin;
            public float ymax;
            public int32 num_chars;
        
        }
        
        [CRepr]
        public struct StbUndoRecord
        {
            public int32 where_;
            public int32 insert_length;
            public int32 delete_length;
            public int32 char_storage;
        
        }
        
        [CRepr]
        public struct StbUndoState
        {
            public StbUndoRecord[99] undo_rec;
            public Wchar[999] undo_char;
            public short undo_point;
            public short redo_point;
            public int32 undo_char_point;
            public int32 redo_char_point;
        
        }
        
        [CRepr]
        public struct Vector<T>
        {
            public int32 Size;
            public int32 Capacity;
            public T* Data;
        
            [LinkName("ImVector_ImVector_Nil")]
            private static extern Vector<T>* CtorImpl();
            public this()
            {
                this = *CtorImpl();
            }
            
            [LinkName("ImVector_ImVector_Vector_T_")]
            private static extern Vector<T>* CtorImpl(Vector<T > src);
            public this(Vector<T > src)
            {
                this = *CtorImpl(src);
            }
            
            [LinkName("ImVector__grow_capacity")]
            private static extern int32 GrowCapacityImpl(Self* self, int32 sz);
            public int32 GrowCapacity(int32 sz) mut=> GrowCapacityImpl(&this, sz);
            
            [LinkName("ImVector_back_Nil")]
            private static extern T* BackImpl(Self* self);
            public T* Back() mut=> BackImpl(&this);
            
            [LinkName("ImVector_begin_Nil")]
            private static extern T* BeginImpl(Self* self);
            public T* Begin() mut=> BeginImpl(&this);
            
            [LinkName("ImVector_capacity")]
            private static extern int32 CapacityImpl(Self* self);
            public int32 Capacity() mut=> CapacityImpl(&this);
            
            [LinkName("ImVector_clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
            [LinkName("ImVector_clear_delete")]
            private static extern void ClearDeleteImpl(Self* self);
            public void ClearDelete() mut=> ClearDeleteImpl(&this);
            
            [LinkName("ImVector_clear_destruct")]
            private static extern void ClearDestructImpl(Self* self);
            public void ClearDestruct() mut=> ClearDestructImpl(&this);
            
            [LinkName("ImVector_contains")]
            private static extern bool ContainsImpl(Self* self, T v);
            public bool Contains(T v) mut=> ContainsImpl(&this, v);
            
            [LinkName("ImVector_empty")]
            private static extern bool EmptyImpl(Self* self);
            public bool Empty() mut=> EmptyImpl(&this);
            
            [LinkName("ImVector_end_Nil")]
            private static extern T* EndImpl(Self* self);
            public T* End() mut=> EndImpl(&this);
            
            [LinkName("ImVector_erase_Nil")]
            private static extern T* EraseImpl(Self* self, T* it);
            public T* Erase(T* it) mut=> EraseImpl(&this, it);
            
            [LinkName("ImVector_erase_TPtr")]
            private static extern T* EraseImpl(Self* self, T* it, T* it_last);
            public T* Erase(T* it, T* it_last) mut=> EraseImpl(&this, it, it_last);
            
            [LinkName("ImVector_erase_unsorted")]
            private static extern T* EraseUnsortedImpl(Self* self, T* it);
            public T* EraseUnsorted(T* it) mut=> EraseUnsortedImpl(&this, it);
            
            [LinkName("ImVector_find_Nil")]
            private static extern T* FindImpl(Self* self, T v);
            public T* Find(T v) mut=> FindImpl(&this, v);
            
            [LinkName("ImVector_find_erase")]
            private static extern bool FindEraseImpl(Self* self, T v);
            public bool FindErase(T v) mut=> FindEraseImpl(&this, v);
            
            [LinkName("ImVector_find_erase_unsorted")]
            private static extern bool FindEraseUnsortedImpl(Self* self, T v);
            public bool FindEraseUnsorted(T v) mut=> FindEraseUnsortedImpl(&this, v);
            
            [LinkName("ImVector_front_Nil")]
            private static extern T* FrontImpl(Self* self);
            public T* Front() mut=> FrontImpl(&this);
            
            [LinkName("ImVector_index_from_ptr")]
            private static extern int32 IndexFromPtrImpl(Self* self, T* it);
            public int32 IndexFromPtr(T* it) mut=> IndexFromPtrImpl(&this, it);
            
            [LinkName("ImVector_insert")]
            private static extern T* InsertImpl(Self* self, T* it, T v);
            public T* Insert(T* it, T v) mut=> InsertImpl(&this, it, v);
            
            [LinkName("ImVector_max_size")]
            private static extern int32 MaxSizeImpl(Self* self);
            public int32 MaxSize() mut=> MaxSizeImpl(&this);
            
            [LinkName("ImVector_pop_back")]
            private static extern void PopBackImpl(Self* self);
            public void PopBack() mut=> PopBackImpl(&this);
            
            [LinkName("ImVector_push_back")]
            private static extern void PushBackImpl(Self* self, T v);
            public void PushBack(T v) mut=> PushBackImpl(&this, v);
            
            [LinkName("ImVector_push_front")]
            private static extern void PushFrontImpl(Self* self, T v);
            public void PushFront(T v) mut=> PushFrontImpl(&this, v);
            
            [LinkName("ImVector_reserve")]
            private static extern void ReserveImpl(Self* self, int32 new_capacity);
            public void Reserve(int32 new_capacity) mut=> ReserveImpl(&this, new_capacity);
            
            [LinkName("ImVector_reserve_discard")]
            private static extern void ReserveDiscardImpl(Self* self, int32 new_capacity);
            public void ReserveDiscard(int32 new_capacity) mut=> ReserveDiscardImpl(&this, new_capacity);
            
            [LinkName("ImVector_resize_Nil")]
            private static extern void ResizeImpl(Self* self, int32 new_size);
            public void Resize(int32 new_size) mut=> ResizeImpl(&this, new_size);
            
            [LinkName("ImVector_resize_T")]
            private static extern void ResizeImpl(Self* self, int32 new_size, T v);
            public void Resize(int32 new_size, T v) mut=> ResizeImpl(&this, new_size, v);
            
            [LinkName("ImVector_shrink")]
            private static extern void ShrinkImpl(Self* self, int32 new_size);
            public void Shrink(int32 new_size) mut=> ShrinkImpl(&this, new_size);
            
            [LinkName("ImVector_size")]
            private static extern int32 SizeImpl(Self* self);
            public int32 Size() mut=> SizeImpl(&this);
            
            [LinkName("ImVector_size_in_bytes")]
            private static extern int32 SizeInBytesImpl(Self* self);
            public int32 SizeInBytes() mut=> SizeInBytesImpl(&this);
            
            [LinkName("ImVector_swap")]
            private static extern void SwapImpl(Self* self, Vector<T>* rhs);
            public void Swap(ref Vector<T> rhs) mut=> SwapImpl(&this, &rhs);
            
        }
        
        [CRepr]
        public struct BitArray<BitCount, Offset> where BitCount : const int where Offset : const int
        {
            public U32[(BitCount + 32) >> 5] Storage;
        
            [LinkName("ImBitArray_ClearAllBits")]
            private static extern void ClearAllBitsImpl(Self* self);
            public void ClearAllBits() mut=> ClearAllBitsImpl(&this);
            
            [LinkName("ImBitArray_ClearBit")]
            private static extern void ClearBitImpl(Self* self, int32 n);
            public void ClearBit(int32 n) mut=> ClearBitImpl(&this, n);
            
            [LinkName("ImBitArray_SetAllBits")]
            private static extern void SetAllBitsImpl(Self* self);
            public void SetAllBits() mut=> SetAllBitsImpl(&this);
            
            [LinkName("ImBitArray_SetBit")]
            private static extern void SetBitImpl(Self* self, int32 n);
            public void SetBit(int32 n) mut=> SetBitImpl(&this, n);
            
            [LinkName("ImBitArray_SetBitRange")]
            private static extern void SetBitRangeImpl(Self* self, int32 n, int32 n2);
            public void SetBitRange(int32 n, int32 n2) mut=> SetBitRangeImpl(&this, n, n2);
            
            [LinkName("ImBitArray_TestBit")]
            private static extern bool TestBitImpl(Self* self, int32 n);
            public bool TestBit(int32 n) mut=> TestBitImpl(&this, n);
            
        }
        
        [CRepr]
        public struct ChunkStream<T>
        {
            public Vector<char> Buf;
        
            [LinkName("ImChunkStream_alloc_chunk")]
            private static extern T* AllocChunkImpl(Self* self, size sz);
            public T* AllocChunk(size sz) mut=> AllocChunkImpl(&this, sz);
            
            [LinkName("ImChunkStream_begin")]
            private static extern T* BeginImpl(Self* self);
            public T* Begin() mut=> BeginImpl(&this);
            
            [LinkName("ImChunkStream_chunk_size")]
            private static extern int32 ChunkSizeImpl(Self* self, T* p);
            public int32 ChunkSize(T* p) mut=> ChunkSizeImpl(&this, p);
            
            [LinkName("ImChunkStream_clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
            [LinkName("ImChunkStream_empty")]
            private static extern bool EmptyImpl(Self* self);
            public bool Empty() mut=> EmptyImpl(&this);
            
            [LinkName("ImChunkStream_end")]
            private static extern T* EndImpl(Self* self);
            public T* End() mut=> EndImpl(&this);
            
            [LinkName("ImChunkStream_next_chunk")]
            private static extern T* NextChunkImpl(Self* self, T* p);
            public T* NextChunk(T* p) mut=> NextChunkImpl(&this, p);
            
            [LinkName("ImChunkStream_offset_from_ptr")]
            private static extern int32 OffsetFromPtrImpl(Self* self, T* p);
            public int32 OffsetFromPtr(T* p) mut=> OffsetFromPtrImpl(&this, p);
            
            [LinkName("ImChunkStream_ptr_from_offset")]
            private static extern T* PtrFromOffsetImpl(Self* self, int32 off);
            public T* PtrFromOffset(int32 off) mut=> PtrFromOffsetImpl(&this, off);
            
            [LinkName("ImChunkStream_size")]
            private static extern int32 SizeImpl(Self* self);
            public int32 Size() mut=> SizeImpl(&this);
            
            [LinkName("ImChunkStream_swap")]
            private static extern void SwapImpl(Self* self, ChunkStream<T>* rhs);
            public void Swap(ref ChunkStream<T> rhs) mut=> SwapImpl(&this, &rhs);
            
        }
        
        [CRepr]
        public struct Pool<T>
        {
            public Vector<T> Buf;
            public Storage Map;
            public PoolIdx FreeIdx;
            public PoolIdx AliveCount;
        
            [LinkName("ImPool_Add")]
            private static extern T* AddImpl(Self* self);
            public T* Add() mut=> AddImpl(&this);
            
            [LinkName("ImPool_Clear")]
            private static extern void ClearImpl(Self* self);
            public void Clear() mut=> ClearImpl(&this);
            
            [LinkName("ImPool_Contains")]
            private static extern bool ContainsImpl(Self* self, T* p);
            public bool Contains(T* p) mut=> ContainsImpl(&this, p);
            
            [LinkName("ImPool_GetAliveCount")]
            private static extern int32 GetAliveCountImpl(Self* self);
            public int32 GetAliveCount() mut=> GetAliveCountImpl(&this);
            
            [LinkName("ImPool_GetBufSize")]
            private static extern int32 GetBufSizeImpl(Self* self);
            public int32 GetBufSize() mut=> GetBufSizeImpl(&this);
            
            [LinkName("ImPool_GetByIndex")]
            private static extern T* GetByIndexImpl(Self* self, PoolIdx n);
            public T* GetByIndex(PoolIdx n) mut=> GetByIndexImpl(&this, n);
            
            [LinkName("ImPool_GetByKey")]
            private static extern T* GetByKeyImpl(Self* self, ID key);
            public T* GetByKey(ID key) mut=> GetByKeyImpl(&this, key);
            
            [LinkName("ImPool_GetIndex")]
            private static extern PoolIdx GetIndexImpl(Self* self, T* p);
            public PoolIdx GetIndex(T* p) mut=> GetIndexImpl(&this, p);
            
            [LinkName("ImPool_GetMapSize")]
            private static extern int32 GetMapSizeImpl(Self* self);
            public int32 GetMapSize() mut=> GetMapSizeImpl(&this);
            
            [LinkName("ImPool_GetOrAddByKey")]
            private static extern T* GetOrAddByKeyImpl(Self* self, ID key);
            public T* GetOrAddByKey(ID key) mut=> GetOrAddByKeyImpl(&this, key);
            
            [LinkName("ImPool_Remove_TPtr")]
            private static extern void RemoveImpl(Self* self, ID key, T* p);
            public void Remove(ID key, T* p) mut=> RemoveImpl(&this, key, p);
            
            [LinkName("ImPool_Remove_PoolIdx")]
            private static extern void RemoveImpl(Self* self, ID key, PoolIdx idx);
            public void Remove(ID key, PoolIdx idx) mut=> RemoveImpl(&this, key, idx);
            
            [LinkName("ImPool_Reserve")]
            private static extern void ReserveImpl(Self* self, int32 capacity);
            public void Reserve(int32 capacity) mut=> ReserveImpl(&this, capacity);
            
            [LinkName("ImPool_TryGetMapData")]
            private static extern T* TryGetMapDataImpl(Self* self, PoolIdx n);
            public T* TryGetMapData(PoolIdx n) mut=> TryGetMapDataImpl(&this, n);
            
        }
        
        [CRepr]
        public struct SpanAllocator<T> where T : const int
        {
            public charPtr BasePtr;
            int32 CurrOff;
            int32 CurrIdx;
            int32[T] Offsets;
            int32[T] Sizes;
        
            [LinkName("ImSpanAllocator_GetArenaSizeInBytes")]
            private static extern int32 GetArenaSizeInBytesImpl(Self* self);
            public int32 GetArenaSizeInBytes() mut=> GetArenaSizeInBytesImpl(&this);
            
            [LinkName("ImSpanAllocator_GetSpanPtrBegin")]
            private static extern void* GetSpanPtrBeginImpl(Self* self, int32 n);
            public void* GetSpanPtrBegin(int32 n) mut=> GetSpanPtrBeginImpl(&this, n);
            
            [LinkName("ImSpanAllocator_GetSpanPtrEnd")]
            private static extern void* GetSpanPtrEndImpl(Self* self, int32 n);
            public void* GetSpanPtrEnd(int32 n) mut=> GetSpanPtrEndImpl(&this, n);
            
            [LinkName("ImSpanAllocator_Reserve")]
            private static extern void ReserveImpl(Self* self, int32 n, size sz, int32 a);
            public void Reserve(int32 n, size sz, int32 a = (int32) 4) mut=> ReserveImpl(&this, n, sz, a);
            
            [LinkName("ImSpanAllocator_SetArenaBasePtr")]
            private static extern void SetArenaBasePtrImpl(Self* self, void* base_ptr);
            public void SetArenaBasePtr(void* base_ptr) mut=> SetArenaBasePtrImpl(&this, base_ptr);
            
        }
        
        [CRepr]
        public struct Span<T>
        {
            public T* Data;
            public T* DataEnd;
        
            [LinkName("ImSpan_begin_Nil")]
            private static extern T* BeginImpl(Self* self);
            public T* Begin() mut=> BeginImpl(&this);
            
            [LinkName("ImSpan_end_Nil")]
            private static extern T* EndImpl(Self* self);
            public T* End() mut=> EndImpl(&this);
            
            [LinkName("ImSpan_index_from_ptr")]
            private static extern int32 IndexFromPtrImpl(Self* self, T* it);
            public int32 IndexFromPtr(T* it) mut=> IndexFromPtrImpl(&this, it);
            
            [LinkName("ImSpan_set_Int")]
            private static extern void SetImpl(Self* self, T* data, int32 size);
            public void Set(T* data, int32 size) mut=> SetImpl(&this, data, size);
            
            [LinkName("ImSpan_set_TPtr")]
            private static extern void SetImpl(Self* self, T* data, T* data_end);
            public void Set(T* data, T* data_end) mut=> SetImpl(&this, data, data_end);
            
            [LinkName("ImSpan_size")]
            private static extern int32 SizeImpl(Self* self);
            public int32 Size() mut=> SizeImpl(&this);
            
            [LinkName("ImSpan_size_in_bytes")]
            private static extern int32 SizeInBytesImpl(Self* self);
            public int32 SizeInBytes() mut=> SizeInBytesImpl(&this);
            
        }
        
        [LinkName("igAcceptDragDropPayload")]
        private static extern Payload* AcceptDragDropPayloadImpl(char* type, DragDropFlags flags);
        #if IMGUI_USE_REF
        public static ref Payload AcceptDragDropPayload(char* type, DragDropFlags flags = (DragDropFlags) 0) { return ref *AcceptDragDropPayloadImpl(type, flags); }
        #else
        public static Payload* AcceptDragDropPayload(char* type, DragDropFlags flags = (DragDropFlags) 0) => AcceptDragDropPayloadImpl(type, flags);
        #endif
        
        [LinkName("igActivateItem")]
        private static extern void ActivateItemImpl(ID id);
        public static void ActivateItem(ID id) => ActivateItemImpl(id);
        
        [LinkName("igAddContextHook")]
        private static extern ID AddContextHookImpl(Context* context, ContextHook* hook);
        public static ID AddContextHook(Context* context, ContextHook* hook) => AddContextHookImpl(context, hook);
        
        [LinkName("igAddSettingsHandler")]
        private static extern void AddSettingsHandlerImpl(SettingsHandler* handler);
        public static void AddSettingsHandler(SettingsHandler* handler) => AddSettingsHandlerImpl(handler);
        
        [LinkName("igAlignTextToFramePadding")]
        private static extern void AlignTextToFramePaddingImpl();
        public static void AlignTextToFramePadding() => AlignTextToFramePaddingImpl();
        
        [LinkName("igArrowButton")]
        private static extern bool ArrowButtonImpl(char* str_id, Dir dir);
        public static bool ArrowButton(char* str_id, Dir dir) => ArrowButtonImpl(str_id, dir);
        
        [LinkName("igArrowButtonEx")]
        private static extern bool ArrowButtonExImpl(char* str_id, Dir dir, Vec2 size_arg, ButtonFlags flags);
        public static bool ArrowButtonEx(char* str_id, Dir dir, Vec2 size_arg, ButtonFlags flags = (ButtonFlags) 0) => ArrowButtonExImpl(str_id, dir, size_arg, flags);
        
        [LinkName("igBegin")]
        private static extern bool BeginImpl(char* name, bool* p_open, WindowFlags flags);
        public static bool Begin(char* name, bool* p_open = null, WindowFlags flags = (WindowFlags) 0) => BeginImpl(name, p_open, flags);
        
        [LinkName("igBeginChild_Str")]
        private static extern bool BeginChildImpl(char* str_id, Vec2 size, bool border, WindowFlags flags);
        public static bool BeginChild(char* str_id, Vec2 size = Vec2.Zero, bool border = false, WindowFlags flags = (WindowFlags) 0) => BeginChildImpl(str_id, size, border, flags);
        
        [LinkName("igBeginChild_ID")]
        private static extern bool BeginChildImpl(ID id, Vec2 size, bool border, WindowFlags flags);
        public static bool BeginChild(ID id, Vec2 size = Vec2.Zero, bool border = false, WindowFlags flags = (WindowFlags) 0) => BeginChildImpl(id, size, border, flags);
        
        [LinkName("igBeginChildEx")]
        private static extern bool BeginChildExImpl(char* name, ID id, Vec2 size_arg, bool border, WindowFlags flags);
        public static bool BeginChildEx(char* name, ID id, Vec2 size_arg, bool border, WindowFlags flags) => BeginChildExImpl(name, id, size_arg, border, flags);
        
        [LinkName("igBeginChildFrame")]
        private static extern bool BeginChildFrameImpl(ID id, Vec2 size, WindowFlags flags);
        public static bool BeginChildFrame(ID id, Vec2 size, WindowFlags flags = (WindowFlags) 0) => BeginChildFrameImpl(id, size, flags);
        
        [LinkName("igBeginColumns")]
        private static extern void BeginColumnsImpl(char* str_id, int32 count, OldColumnFlags flags);
        public static void BeginColumns(char* str_id, int32 count, OldColumnFlags flags = (OldColumnFlags) 0) => BeginColumnsImpl(str_id, count, flags);
        
        [LinkName("igBeginCombo")]
        private static extern bool BeginComboImpl(char* label, char* preview_value, ComboFlags flags);
        public static bool BeginCombo(char* label, char* preview_value, ComboFlags flags = (ComboFlags) 0) => BeginComboImpl(label, preview_value, flags);
        
        [LinkName("igBeginComboPopup")]
        private static extern bool BeginComboPopupImpl(ID popup_id, Rect bb, ComboFlags flags);
        public static bool BeginComboPopup(ID popup_id, Rect bb, ComboFlags flags) => BeginComboPopupImpl(popup_id, bb, flags);
        
        [LinkName("igBeginComboPreview")]
        private static extern bool BeginComboPreviewImpl();
        public static bool BeginComboPreview() => BeginComboPreviewImpl();
        
        [LinkName("igBeginDisabled")]
        private static extern void BeginDisabledImpl(bool disabled);
        public static void BeginDisabled(bool disabled = true) => BeginDisabledImpl(disabled);
        
        [LinkName("igBeginDockableDragDropSource")]
        private static extern void BeginDockableDragDropSourceImpl(Window* window);
        public static void BeginDockableDragDropSource(Window* window) => BeginDockableDragDropSourceImpl(window);
        
        [LinkName("igBeginDockableDragDropTarget")]
        private static extern void BeginDockableDragDropTargetImpl(Window* window);
        public static void BeginDockableDragDropTarget(Window* window) => BeginDockableDragDropTargetImpl(window);
        
        [LinkName("igBeginDocked")]
        private static extern void BeginDockedImpl(Window* window, bool* p_open);
        public static void BeginDocked(Window* window, bool* p_open) => BeginDockedImpl(window, p_open);
        
        [LinkName("igBeginDragDropSource")]
        private static extern bool BeginDragDropSourceImpl(DragDropFlags flags);
        public static bool BeginDragDropSource(DragDropFlags flags = (DragDropFlags) 0) => BeginDragDropSourceImpl(flags);
        
        [LinkName("igBeginDragDropTarget")]
        private static extern bool BeginDragDropTargetImpl();
        public static bool BeginDragDropTarget() => BeginDragDropTargetImpl();
        
        [LinkName("igBeginDragDropTargetCustom")]
        private static extern bool BeginDragDropTargetCustomImpl(Rect bb, ID id);
        public static bool BeginDragDropTargetCustom(Rect bb, ID id) => BeginDragDropTargetCustomImpl(bb, id);
        
        [LinkName("igBeginGroup")]
        private static extern void BeginGroupImpl();
        public static void BeginGroup() => BeginGroupImpl();
        
        [LinkName("igBeginListBox")]
        private static extern bool BeginListBoxImpl(char* label, Vec2 size);
        public static bool BeginListBox(char* label, Vec2 size = Vec2.Zero) => BeginListBoxImpl(label, size);
        
        [LinkName("igBeginMainMenuBar")]
        private static extern bool BeginMainMenuBarImpl();
        public static bool BeginMainMenuBar() => BeginMainMenuBarImpl();
        
        [LinkName("igBeginMenu")]
        private static extern bool BeginMenuImpl(char* label, bool enabled);
        public static bool BeginMenu(char* label, bool enabled = true) => BeginMenuImpl(label, enabled);
        
        [LinkName("igBeginMenuBar")]
        private static extern bool BeginMenuBarImpl();
        public static bool BeginMenuBar() => BeginMenuBarImpl();
        
        [LinkName("igBeginMenuEx")]
        private static extern bool BeginMenuExImpl(char* label, char* icon, bool enabled);
        public static bool BeginMenuEx(char* label, char* icon, bool enabled = true) => BeginMenuExImpl(label, icon, enabled);
        
        [LinkName("igBeginPopup")]
        private static extern bool BeginPopupImpl(char* str_id, WindowFlags flags);
        public static bool BeginPopup(char* str_id, WindowFlags flags = (WindowFlags) 0) => BeginPopupImpl(str_id, flags);
        
        [LinkName("igBeginPopupContextItem")]
        private static extern bool BeginPopupContextItemImpl(char* str_id, PopupFlags popup_flags);
        public static bool BeginPopupContextItem(char* str_id = null, PopupFlags popup_flags = (PopupFlags) 1) => BeginPopupContextItemImpl(str_id, popup_flags);
        
        [LinkName("igBeginPopupContextVoid")]
        private static extern bool BeginPopupContextVoidImpl(char* str_id, PopupFlags popup_flags);
        public static bool BeginPopupContextVoid(char* str_id = null, PopupFlags popup_flags = (PopupFlags) 1) => BeginPopupContextVoidImpl(str_id, popup_flags);
        
        [LinkName("igBeginPopupContextWindow")]
        private static extern bool BeginPopupContextWindowImpl(char* str_id, PopupFlags popup_flags);
        public static bool BeginPopupContextWindow(char* str_id = null, PopupFlags popup_flags = (PopupFlags) 1) => BeginPopupContextWindowImpl(str_id, popup_flags);
        
        [LinkName("igBeginPopupEx")]
        private static extern bool BeginPopupExImpl(ID id, WindowFlags extra_flags);
        public static bool BeginPopupEx(ID id, WindowFlags extra_flags) => BeginPopupExImpl(id, extra_flags);
        
        [LinkName("igBeginPopupModal")]
        private static extern bool BeginPopupModalImpl(char* name, bool* p_open, WindowFlags flags);
        public static bool BeginPopupModal(char* name, bool* p_open = null, WindowFlags flags = (WindowFlags) 0) => BeginPopupModalImpl(name, p_open, flags);
        
        [LinkName("igBeginTabBar")]
        private static extern bool BeginTabBarImpl(char* str_id, TabBarFlags flags);
        public static bool BeginTabBar(char* str_id, TabBarFlags flags = (TabBarFlags) 0) => BeginTabBarImpl(str_id, flags);
        
        [LinkName("igBeginTabBarEx")]
        private static extern bool BeginTabBarExImpl(TabBar* tab_bar, Rect bb, TabBarFlags flags, DockNode* dock_node);
        public static bool BeginTabBarEx(TabBar* tab_bar, Rect bb, TabBarFlags flags, DockNode* dock_node) => BeginTabBarExImpl(tab_bar, bb, flags, dock_node);
        
        [LinkName("igBeginTabItem")]
        private static extern bool BeginTabItemImpl(char* label, bool* p_open, TabItemFlags flags);
        public static bool BeginTabItem(char* label, bool* p_open = null, TabItemFlags flags = (TabItemFlags) 0) => BeginTabItemImpl(label, p_open, flags);
        
        [LinkName("igBeginTable")]
        private static extern bool BeginTableImpl(char* str_id, int32 column, TableFlags flags, Vec2 outer_size, float inner_width);
        public static bool BeginTable(char* str_id, int32 column, TableFlags flags = (TableFlags) 0, Vec2 outer_size = .(0.0f,0.0f), float inner_width = (float) 0.0f) => BeginTableImpl(str_id, column, flags, outer_size, inner_width);
        
        [LinkName("igBeginTableEx")]
        private static extern bool BeginTableExImpl(char* name, ID id, int32 columns_count, TableFlags flags, Vec2 outer_size, float inner_width);
        public static bool BeginTableEx(char* name, ID id, int32 columns_count, TableFlags flags = (TableFlags) 0, Vec2 outer_size = Vec2.Zero, float inner_width = (float) 0.0f) => BeginTableExImpl(name, id, columns_count, flags, outer_size, inner_width);
        
        [LinkName("igBeginTooltip")]
        private static extern bool BeginTooltipImpl();
        public static bool BeginTooltip() => BeginTooltipImpl();
        
        [LinkName("igBeginTooltipEx")]
        private static extern bool BeginTooltipExImpl(TooltipFlags tooltip_flags, WindowFlags extra_window_flags);
        public static bool BeginTooltipEx(TooltipFlags tooltip_flags, WindowFlags extra_window_flags) => BeginTooltipExImpl(tooltip_flags, extra_window_flags);
        
        [LinkName("igBeginViewportSideBar")]
        private static extern bool BeginViewportSideBarImpl(char* name, Viewport* viewport, Dir dir, float size, WindowFlags window_flags);
        public static bool BeginViewportSideBar(char* name, Viewport* viewport, Dir dir, float size, WindowFlags window_flags) => BeginViewportSideBarImpl(name, viewport, dir, size, window_flags);
        
        [LinkName("igBringWindowToDisplayBack")]
        private static extern void BringWindowToDisplayBackImpl(Window* window);
        public static void BringWindowToDisplayBack(Window* window) => BringWindowToDisplayBackImpl(window);
        
        [LinkName("igBringWindowToDisplayBehind")]
        private static extern void BringWindowToDisplayBehindImpl(Window* window, Window* above_window);
        public static void BringWindowToDisplayBehind(Window* window, Window* above_window) => BringWindowToDisplayBehindImpl(window, above_window);
        
        [LinkName("igBringWindowToDisplayFront")]
        private static extern void BringWindowToDisplayFrontImpl(Window* window);
        public static void BringWindowToDisplayFront(Window* window) => BringWindowToDisplayFrontImpl(window);
        
        [LinkName("igBringWindowToFocusFront")]
        private static extern void BringWindowToFocusFrontImpl(Window* window);
        public static void BringWindowToFocusFront(Window* window) => BringWindowToFocusFrontImpl(window);
        
        [LinkName("igBullet")]
        private static extern void BulletImpl();
        public static void Bullet() => BulletImpl();
        
        [LinkName("igBulletText")]
        private static extern void BulletTextImpl(char* fmt, ...);
        public static void BulletText(char* fmt, params Object[] args) => BulletTextImpl(scope String()..AppendF(StringView(fmt), params args));
        
        [LinkName("igButton")]
        private static extern bool ButtonImpl(char* label, Vec2 size);
        public static bool Button(char* label, Vec2 size = Vec2.Zero) => ButtonImpl(label, size);
        
        [LinkName("igButtonBehavior")]
        private static extern bool ButtonBehaviorImpl(Rect bb, ID id, bool* out_hovered, bool* out_held, ButtonFlags flags);
        public static bool ButtonBehavior(Rect bb, ID id, out bool out_hovered, out bool out_held, ButtonFlags flags = (ButtonFlags) 0)
        {
            out_hovered = ?;
            out_held = ?;
            return ButtonBehaviorImpl(bb, id, &out_hovered, &out_held, flags);
        }
        
        [LinkName("igButtonEx")]
        private static extern bool ButtonExImpl(char* label, Vec2 size_arg, ButtonFlags flags);
        public static bool ButtonEx(char* label, Vec2 size_arg = Vec2.Zero, ButtonFlags flags = (ButtonFlags) 0) => ButtonExImpl(label, size_arg, flags);
        
        [LinkName("igCalcItemSize")]
        private static extern Vec2 CalcItemSizeImpl(Vec2* pOut, Vec2 size, float default_w, float default_h);
        public static Vec2 CalcItemSize(Vec2 size, float default_w, float default_h)
        {
            Vec2 pOut = default;
            CalcItemSizeImpl(&pOut, size, default_w, default_h);
            return pOut;
        }
        
        [LinkName("igCalcItemWidth")]
        private static extern float CalcItemWidthImpl();
        public static float CalcItemWidth() => CalcItemWidthImpl();
        
        [LinkName("igCalcRoundingFlagsForRectInRect")]
        private static extern DrawFlags CalcRoundingFlagsForRectInRectImpl(Rect r_in, Rect r_outer, float threshold);
        public static DrawFlags CalcRoundingFlagsForRectInRect(Rect r_in, Rect r_outer, float threshold) => CalcRoundingFlagsForRectInRectImpl(r_in, r_outer, threshold);
        
        [LinkName("igCalcTextSize")]
        private static extern Vec2 CalcTextSizeImpl(Vec2* pOut, char* text, char* text_end, bool hide_text_after_double_hash, float wrap_width);
        public static Vec2 CalcTextSize(char* text, char* text_end = null, bool hide_text_after_double_hash = false, float wrap_width = -1.0f)
        {
            Vec2 pOut = default;
            CalcTextSizeImpl(&pOut, text, text_end, hide_text_after_double_hash, wrap_width);
            return pOut;
        }
        
        [LinkName("igCalcTypematicRepeatAmount")]
        private static extern int32 CalcTypematicRepeatAmountImpl(float t0, float t1, float repeat_delay, float repeat_rate);
        public static int32 CalcTypematicRepeatAmount(float t0, float t1, float repeat_delay, float repeat_rate) => CalcTypematicRepeatAmountImpl(t0, t1, repeat_delay, repeat_rate);
        
        [LinkName("igCalcWindowNextAutoFitSize")]
        private static extern Vec2 CalcWindowNextAutoFitSizeImpl(Vec2* pOut, Window* window);
        public static Vec2 CalcWindowNextAutoFitSize(Window* window)
        {
            Vec2 pOut = default;
            CalcWindowNextAutoFitSizeImpl(&pOut, window);
            return pOut;
        }
        
        [LinkName("igCalcWrapWidthForPos")]
        private static extern float CalcWrapWidthForPosImpl(Vec2 pos, float wrap_pos_x);
        public static float CalcWrapWidthForPos(Vec2 pos, float wrap_pos_x) => CalcWrapWidthForPosImpl(pos, wrap_pos_x);
        
        [LinkName("igCallContextHooks")]
        private static extern void CallContextHooksImpl(Context* context, ContextHookType type);
        public static void CallContextHooks(Context* context, ContextHookType type) => CallContextHooksImpl(context, type);
        
        [LinkName("igCheckbox")]
        private static extern bool CheckboxImpl(char* label, bool* v);
        public static bool Checkbox(char* label, bool* v) => CheckboxImpl(label, v);
        
        [LinkName("igCheckboxFlags_IntPtr")]
        private static extern bool CheckboxFlagsImpl(char* label, int32* flags, int32 flags_value);
        public static bool CheckboxFlags(char* label, int32* flags, int32 flags_value) => CheckboxFlagsImpl(label, flags, flags_value);
        
        [LinkName("igCheckboxFlags_UintPtr")]
        private static extern bool CheckboxFlagsImpl(char* label, uint32* flags, uint32 flags_value);
        public static bool CheckboxFlags(char* label, uint32* flags, uint32 flags_value) => CheckboxFlagsImpl(label, flags, flags_value);
        
        [LinkName("igCheckboxFlags_S64Ptr")]
        private static extern bool CheckboxFlagsImpl(char* label, S64* flags, S64 flags_value);
        public static bool CheckboxFlags(char* label, S64* flags, S64 flags_value) => CheckboxFlagsImpl(label, flags, flags_value);
        
        [LinkName("igCheckboxFlags_U64Ptr")]
        private static extern bool CheckboxFlagsImpl(char* label, U64* flags, U64 flags_value);
        public static bool CheckboxFlags(char* label, U64* flags, U64 flags_value) => CheckboxFlagsImpl(label, flags, flags_value);
        
        [LinkName("igClearActiveID")]
        private static extern void ClearActiveIDImpl();
        public static void ClearActiveID() => ClearActiveIDImpl();
        
        [LinkName("igClearDragDrop")]
        private static extern void ClearDragDropImpl();
        public static void ClearDragDrop() => ClearDragDropImpl();
        
        [LinkName("igClearIniSettings")]
        private static extern void ClearIniSettingsImpl();
        public static void ClearIniSettings() => ClearIniSettingsImpl();
        
        [LinkName("igClearWindowSettings")]
        private static extern void ClearWindowSettingsImpl(char* name);
        public static void ClearWindowSettings(char* name) => ClearWindowSettingsImpl(name);
        
        [LinkName("igCloseButton")]
        private static extern bool CloseButtonImpl(ID id, Vec2 pos);
        public static bool CloseButton(ID id, Vec2 pos) => CloseButtonImpl(id, pos);
        
        [LinkName("igCloseCurrentPopup")]
        private static extern void CloseCurrentPopupImpl();
        public static void CloseCurrentPopup() => CloseCurrentPopupImpl();
        
        [LinkName("igClosePopupToLevel")]
        private static extern void ClosePopupToLevelImpl(int32 remaining, bool restore_focus_to_window_under_popup);
        public static void ClosePopupToLevel(int32 remaining, bool restore_focus_to_window_under_popup) => ClosePopupToLevelImpl(remaining, restore_focus_to_window_under_popup);
        
        [LinkName("igClosePopupsExceptModals")]
        private static extern void ClosePopupsExceptModalsImpl();
        public static void ClosePopupsExceptModals() => ClosePopupsExceptModalsImpl();
        
        [LinkName("igClosePopupsOverWindow")]
        private static extern void ClosePopupsOverWindowImpl(Window* ref_window, bool restore_focus_to_window_under_popup);
        public static void ClosePopupsOverWindow(Window* ref_window, bool restore_focus_to_window_under_popup) => ClosePopupsOverWindowImpl(ref_window, restore_focus_to_window_under_popup);
        
        [LinkName("igCollapseButton")]
        private static extern bool CollapseButtonImpl(ID id, Vec2 pos, DockNode* dock_node);
        public static bool CollapseButton(ID id, Vec2 pos, DockNode* dock_node) => CollapseButtonImpl(id, pos, dock_node);
        
        [LinkName("igCollapsingHeader_TreeNodeFlags")]
        private static extern bool CollapsingHeaderImpl(char* label, TreeNodeFlags flags);
        public static bool CollapsingHeader(char* label, TreeNodeFlags flags = (TreeNodeFlags) 0) => CollapsingHeaderImpl(label, flags);
        
        [LinkName("igCollapsingHeader_BoolPtr")]
        private static extern bool CollapsingHeaderImpl(char* label, bool* p_visible, TreeNodeFlags flags);
        public static bool CollapsingHeader(char* label, bool* p_visible, TreeNodeFlags flags = (TreeNodeFlags) 0) => CollapsingHeaderImpl(label, p_visible, flags);
        
        [LinkName("igColorButton")]
        private static extern bool ColorButtonImpl(char* desc_id, Vec4 col, ColorEditFlags flags, Vec2 size);
        public static bool ColorButton(char* desc_id, Vec4 col, ColorEditFlags flags = (ColorEditFlags) 0, Vec2 size = Vec2.Zero) => ColorButtonImpl(desc_id, col, flags, size);
        
        [LinkName("igColorConvertFloat4ToU32")]
        private static extern U32 ColorConvertFloat4ToU32Impl(Vec4 in_);
        public static U32 ColorConvertFloat4ToU32(Vec4 in_) => ColorConvertFloat4ToU32Impl(in_);
        
        [LinkName("igColorConvertHSVtoRGB")]
        private static extern void ColorConvertHSVtoRGBImpl(float h, float s, float v, float* out_r, float* out_g, float* out_b);
        public static void ColorConvertHSVtoRGB(float h, float s, float v, out float out_r, out float out_g, out float out_b)
        {
            out_r = ?;
            out_g = ?;
            out_b = ?;
        }
        
        [LinkName("igColorConvertRGBtoHSV")]
        private static extern void ColorConvertRGBtoHSVImpl(float r, float g, float b, float* out_h, float* out_s, float* out_v);
        public static void ColorConvertRGBtoHSV(float r, float g, float b, out float out_h, out float out_s, out float out_v)
        {
            out_h = ?;
            out_s = ?;
            out_v = ?;
        }
        
        [LinkName("igColorConvertU32ToFloat4")]
        private static extern Vec4 ColorConvertU32ToFloat4Impl(Vec4* pOut, U32 in_);
        public static Vec4 ColorConvertU32ToFloat4(U32 in_)
        {
            Vec4 pOut = default;
            ColorConvertU32ToFloat4Impl(&pOut, in_);
            return pOut;
        }
        
        [LinkName("igColorEdit3")]
        private static extern bool ColorEdit3Impl(char* label, float[3] col, ColorEditFlags flags);
        public static bool ColorEdit3(char* label, ref float[3] col, ColorEditFlags flags = (ColorEditFlags) 0) => ColorEdit3Impl(label, col, flags);
        
        [LinkName("igColorEdit4")]
        private static extern bool ColorEdit4Impl(char* label, float[4] col, ColorEditFlags flags);
        public static bool ColorEdit4(char* label, ref float[4] col, ColorEditFlags flags = (ColorEditFlags) 0) => ColorEdit4Impl(label, col, flags);
        
        [LinkName("igColorEditOptionsPopup")]
        private static extern void ColorEditOptionsPopupImpl(float* col, ColorEditFlags flags);
        public static void ColorEditOptionsPopup(float* col, ColorEditFlags flags) => ColorEditOptionsPopupImpl(col, flags);
        
        [LinkName("igColorPicker3")]
        private static extern bool ColorPicker3Impl(char* label, float[3] col, ColorEditFlags flags);
        public static bool ColorPicker3(char* label, ref float[3] col, ColorEditFlags flags = (ColorEditFlags) 0) => ColorPicker3Impl(label, col, flags);
        
        [LinkName("igColorPicker4")]
        private static extern bool ColorPicker4Impl(char* label, float[4] col, ColorEditFlags flags, float* ref_col);
        public static bool ColorPicker4(char* label, ref float[4] col, ColorEditFlags flags = (ColorEditFlags) 0, float* ref_col = null) => ColorPicker4Impl(label, col, flags, ref_col);
        
        [LinkName("igColorPickerOptionsPopup")]
        private static extern void ColorPickerOptionsPopupImpl(float* ref_col, ColorEditFlags flags);
        public static void ColorPickerOptionsPopup(float* ref_col, ColorEditFlags flags) => ColorPickerOptionsPopupImpl(ref_col, flags);
        
        [LinkName("igColorTooltip")]
        private static extern void ColorTooltipImpl(char* text, float* col, ColorEditFlags flags);
        public static void ColorTooltip(char* text, float* col, ColorEditFlags flags) => ColorTooltipImpl(text, col, flags);
        
        [LinkName("igColumns")]
        private static extern void ColumnsImpl(int32 count, char* id, bool border);
        public static void Columns(int32 count = (int32) 1, char* id = null, bool border = true) => ColumnsImpl(count, id, border);
        
        [LinkName("igCombo_Str_arr")]
        private static extern bool ComboImpl(char* label, int32* current_item, char** items, int32 items_count, int32 popup_max_height_in_items);
        public static bool Combo(char* label, int32* current_item, char** items, int32 items_count, int32 popup_max_height_in_items = -1) => ComboImpl(label, current_item, items, items_count, popup_max_height_in_items);
        
        [LinkName("igCombo_Str")]
        private static extern bool ComboImpl(char* label, int32* current_item, char* items_separated_by_zeros, int32 popup_max_height_in_items);
        public static bool Combo(char* label, int32* current_item, char* items_separated_by_zeros, int32 popup_max_height_in_items = -1) => ComboImpl(label, current_item, items_separated_by_zeros, popup_max_height_in_items);
        
        [LinkName("igCombo_FnBoolPtr")]
        private static extern bool ComboImpl(char* label, int32* current_item, function bool(void* data, int32 idx, char** outext) items_getter, void* data, int32 items_count, int32 popup_max_height_in_items);
        public static bool Combo(char* label, int32* current_item, function bool(void* data, int32 idx, char** outext) items_getter, void* data, int32 items_count, int32 popup_max_height_in_items = -1) => ComboImpl(label, current_item, items_getter, data, items_count, popup_max_height_in_items);
        
        [LinkName("igConvertShortcutMod")]
        private static extern KeyChord ConvertShortcutModImpl(KeyChord key_chord);
        public static KeyChord ConvertShortcutMod(KeyChord key_chord) => ConvertShortcutModImpl(key_chord);
        
        [LinkName("igConvertSingleModFlagToKey")]
        private static extern Key ConvertSingleModFlagToKeyImpl(Context* ctx, Key key);
        public static Key ConvertSingleModFlagToKey(Context* ctx, Key key) => ConvertSingleModFlagToKeyImpl(ctx, key);
        
        [LinkName("igCreateContext")]
        private static extern Context* CreateContextImpl(FontAtlas* shared_font_atlas);
        #if IMGUI_USE_REF
        public static ref Context CreateContext(FontAtlas* shared_font_atlas = null) { return ref *CreateContextImpl(shared_font_atlas); }
        #else
        public static Context* CreateContext(FontAtlas* shared_font_atlas = null) => CreateContextImpl(shared_font_atlas);
        #endif
        
        [LinkName("igCreateNewWindowSettings")]
        private static extern WindowSettings* CreateNewWindowSettingsImpl(char* name);
        #if IMGUI_USE_REF
        public static ref WindowSettings CreateNewWindowSettings(char* name) { return ref *CreateNewWindowSettingsImpl(name); }
        #else
        public static WindowSettings* CreateNewWindowSettings(char* name) => CreateNewWindowSettingsImpl(name);
        #endif
        
        [LinkName("igDataTypeApplyFromText")]
        private static extern bool DataTypeApplyFromTextImpl(char* buf, DataType data_type, void* p_data, char* format);
        public static bool DataTypeApplyFromText(char* buf, DataType data_type, void* p_data, char* format) => DataTypeApplyFromTextImpl(buf, data_type, p_data, format);
        
        [LinkName("igDataTypeApplyOp")]
        private static extern void DataTypeApplyOpImpl(DataType data_type, int32 op, void* output, void* arg_1, void* arg_2);
        public static void DataTypeApplyOp(DataType data_type, int32 op, void* output, void* arg_1, void* arg_2) => DataTypeApplyOpImpl(data_type, op, output, arg_1, arg_2);
        
        [LinkName("igDataTypeClamp")]
        private static extern bool DataTypeClampImpl(DataType data_type, void* p_data, void* p_min, void* p_max);
        public static bool DataTypeClamp(DataType data_type, void* p_data, void* p_min, void* p_max) => DataTypeClampImpl(data_type, p_data, p_min, p_max);
        
        [LinkName("igDataTypeCompare")]
        private static extern int32 DataTypeCompareImpl(DataType data_type, void* arg_1, void* arg_2);
        public static int32 DataTypeCompare(DataType data_type, void* arg_1, void* arg_2) => DataTypeCompareImpl(data_type, arg_1, arg_2);
        
        [LinkName("igDataTypeFormatString")]
        private static extern int32 DataTypeFormatStringImpl(char* buf, int32 buf_size, DataType data_type, void* p_data, char* format);
        public static int32 DataTypeFormatString(char* buf, int32 buf_size, DataType data_type, void* p_data, char* format) => DataTypeFormatStringImpl(buf, buf_size, data_type, p_data, format);
        
        [LinkName("igDataTypeGetInfo")]
        private static extern DataTypeInfo* DataTypeGetInfoImpl(DataType data_type);
        #if IMGUI_USE_REF
        public static ref DataTypeInfo DataTypeGetInfo(DataType data_type) { return ref *DataTypeGetInfoImpl(data_type); }
        #else
        public static DataTypeInfo* DataTypeGetInfo(DataType data_type) => DataTypeGetInfoImpl(data_type);
        #endif
        
        [LinkName("igDebugCheckVersionAndDataLayout")]
        private static extern bool DebugCheckVersionAndDataLayoutImpl(char* version_str, size sz_io, size sz_style, size sz_vec2, size sz_vec4, size sz_drawvert, size sz_drawidx);
        public static bool DebugCheckVersionAndDataLayout(char* version_str, size sz_io, size sz_style, size sz_vec2, size sz_vec4, size sz_drawvert, size sz_drawidx) => DebugCheckVersionAndDataLayoutImpl(version_str, sz_io, sz_style, sz_vec2, sz_vec4, sz_drawvert, sz_drawidx);
        
        [LinkName("igDebugDrawItemRect")]
        private static extern void DebugDrawItemRectImpl(U32 col);
        public static void DebugDrawItemRect(U32 col = (U32) 4278190335) => DebugDrawItemRectImpl(col);
        
        [LinkName("igDebugHookIdInfo")]
        private static extern void DebugHookIdInfoImpl(ID id, DataType data_type, void* data_id, void* data_id_end);
        public static void DebugHookIdInfo(ID id, DataType data_type, void* data_id, void* data_id_end) => DebugHookIdInfoImpl(id, data_type, data_id, data_id_end);
        
        [LinkName("igDebugLocateItem")]
        private static extern void DebugLocateItemImpl(ID target_id);
        public static void DebugLocateItem(ID target_id) => DebugLocateItemImpl(target_id);
        
        [LinkName("igDebugLocateItemOnHover")]
        private static extern void DebugLocateItemOnHoverImpl(ID target_id);
        public static void DebugLocateItemOnHover(ID target_id) => DebugLocateItemOnHoverImpl(target_id);
        
        [LinkName("igDebugLocateItemResolveWithLastItem")]
        private static extern void DebugLocateItemResolveWithLastItemImpl();
        public static void DebugLocateItemResolveWithLastItem() => DebugLocateItemResolveWithLastItemImpl();
        
        [LinkName("igDebugLog")]
        private static extern void DebugLogImpl(char* fmt, ...);
        public static void DebugLog(char* fmt, params Object[] args) => DebugLogImpl(scope String()..AppendF(StringView(fmt), params args));
        
        [LinkName("igDebugNodeColumns")]
        private static extern void DebugNodeColumnsImpl(OldColumns* columns);
        public static void DebugNodeColumns(OldColumns* columns) => DebugNodeColumnsImpl(columns);
        
        [LinkName("igDebugNodeDockNode")]
        private static extern void DebugNodeDockNodeImpl(DockNode* node, char* label);
        public static void DebugNodeDockNode(DockNode* node, char* label) => DebugNodeDockNodeImpl(node, label);
        
        [LinkName("igDebugNodeDrawCmdShowMeshAndBoundingBox")]
        private static extern void DebugNodeDrawCmdShowMeshAndBoundingBoxImpl(DrawList* out_draw_list, DrawList* draw_list, DrawCmd* draw_cmd, bool show_mesh, bool show_aabb);
        public static void DebugNodeDrawCmdShowMeshAndBoundingBox(out DrawList out_draw_list, DrawList* draw_list, DrawCmd* draw_cmd, bool show_mesh, bool show_aabb)
        {
            out_draw_list = ?;
        }
        
        [LinkName("igDebugNodeDrawList")]
        private static extern void DebugNodeDrawListImpl(Window* window, ViewportP* viewport, DrawList* draw_list, char* label);
        public static void DebugNodeDrawList(Window* window, ViewportP* viewport, DrawList* draw_list, char* label) => DebugNodeDrawListImpl(window, viewport, draw_list, label);
        
        [LinkName("igDebugNodeFont")]
        private static extern void DebugNodeFontImpl(Font* font);
        public static void DebugNodeFont(Font* font) => DebugNodeFontImpl(font);
        
        [LinkName("igDebugNodeFontGlyph")]
        private static extern void DebugNodeFontGlyphImpl(Font* font, FontGlyph* glyph);
        public static void DebugNodeFontGlyph(Font* font, FontGlyph* glyph) => DebugNodeFontGlyphImpl(font, glyph);
        
        [LinkName("igDebugNodeInputTextState")]
        private static extern void DebugNodeInputTextStateImpl(InputTextState* state);
        public static void DebugNodeInputTextState(InputTextState* state) => DebugNodeInputTextStateImpl(state);
        
        [LinkName("igDebugNodeStorage")]
        private static extern void DebugNodeStorageImpl(Storage* storage, char* label);
        public static void DebugNodeStorage(Storage* storage, char* label) => DebugNodeStorageImpl(storage, label);
        
        [LinkName("igDebugNodeTabBar")]
        private static extern void DebugNodeTabBarImpl(TabBar* tab_bar, char* label);
        public static void DebugNodeTabBar(TabBar* tab_bar, char* label) => DebugNodeTabBarImpl(tab_bar, label);
        
        [LinkName("igDebugNodeTable")]
        private static extern void DebugNodeTableImpl(Table* table);
        public static void DebugNodeTable(Table* table) => DebugNodeTableImpl(table);
        
        [LinkName("igDebugNodeTableSettings")]
        private static extern void DebugNodeTableSettingsImpl(TableSettings* settings);
        public static void DebugNodeTableSettings(TableSettings* settings) => DebugNodeTableSettingsImpl(settings);
        
        [LinkName("igDebugNodeViewport")]
        private static extern void DebugNodeViewportImpl(ViewportP* viewport);
        public static void DebugNodeViewport(ViewportP* viewport) => DebugNodeViewportImpl(viewport);
        
        [LinkName("igDebugNodeWindow")]
        private static extern void DebugNodeWindowImpl(Window* window, char* label);
        public static void DebugNodeWindow(Window* window, char* label) => DebugNodeWindowImpl(window, label);
        
        [LinkName("igDebugNodeWindowSettings")]
        private static extern void DebugNodeWindowSettingsImpl(WindowSettings* settings);
        public static void DebugNodeWindowSettings(WindowSettings* settings) => DebugNodeWindowSettingsImpl(settings);
        
        [LinkName("igDebugNodeWindowsList")]
        private static extern void DebugNodeWindowsListImpl(Vector<Window**> windows, char* label);
        public static void DebugNodeWindowsList(Vector<Window**> windows, char* label) => DebugNodeWindowsListImpl(windows, label);
        
        [LinkName("igDebugNodeWindowsListByBeginStackParent")]
        private static extern void DebugNodeWindowsListByBeginStackParentImpl(Window** windows, int32 windows_size, Window* parent_in_begin_stack);
        public static void DebugNodeWindowsListByBeginStackParent(Window** windows, int32 windows_size, Window* parent_in_begin_stack) => DebugNodeWindowsListByBeginStackParentImpl(windows, windows_size, parent_in_begin_stack);
        
        [LinkName("igDebugRenderKeyboardPreview")]
        private static extern void DebugRenderKeyboardPreviewImpl(DrawList* draw_list);
        public static void DebugRenderKeyboardPreview(DrawList* draw_list) => DebugRenderKeyboardPreviewImpl(draw_list);
        
        [LinkName("igDebugRenderViewportThumbnail")]
        private static extern void DebugRenderViewportThumbnailImpl(DrawList* draw_list, ViewportP* viewport, Rect bb);
        public static void DebugRenderViewportThumbnail(DrawList* draw_list, ViewportP* viewport, Rect bb) => DebugRenderViewportThumbnailImpl(draw_list, viewport, bb);
        
        [LinkName("igDebugStartItemPicker")]
        private static extern void DebugStartItemPickerImpl();
        public static void DebugStartItemPicker() => DebugStartItemPickerImpl();
        
        [LinkName("igDebugTextEncoding")]
        private static extern void DebugTextEncodingImpl(char* text);
        public static void DebugTextEncoding(char* text) => DebugTextEncodingImpl(text);
        
        [LinkName("igDestroyContext")]
        private static extern void DestroyContextImpl(Context* ctx);
        public static void DestroyContext(Context* ctx = null) => DestroyContextImpl(ctx);
        
        [LinkName("igDestroyPlatformWindow")]
        private static extern void DestroyPlatformWindowImpl(ViewportP* viewport);
        public static void DestroyPlatformWindow(ViewportP* viewport) => DestroyPlatformWindowImpl(viewport);
        
        [LinkName("igDestroyPlatformWindows")]
        private static extern void DestroyPlatformWindowsImpl();
        public static void DestroyPlatformWindows() => DestroyPlatformWindowsImpl();
        
        [LinkName("igDockBuilderAddNode")]
        private static extern ID DockBuilderAddNodeImpl(ID node_id, DockNodeFlags flags);
        public static ID DockBuilderAddNode(ID node_id = (ID) 0, DockNodeFlags flags = (DockNodeFlags) 0) => DockBuilderAddNodeImpl(node_id, flags);
        
        [LinkName("igDockBuilderCopyDockSpace")]
        private static extern void DockBuilderCopyDockSpaceImpl(ID src_dockspace_id, ID dst_dockspace_id, Vector<char**> in_window_remap_pairs);
        public static void DockBuilderCopyDockSpace(ID src_dockspace_id, ID dst_dockspace_id, Vector<char**> in_window_remap_pairs) => DockBuilderCopyDockSpaceImpl(src_dockspace_id, dst_dockspace_id, in_window_remap_pairs);
        
        [LinkName("igDockBuilderCopyNode")]
        private static extern void DockBuilderCopyNodeImpl(ID src_node_id, ID dst_node_id, Vector<ID*> out_node_remap_pairs);
        public static void DockBuilderCopyNode(ID src_node_id, ID dst_node_id, Vector<ID*> out_node_remap_pairs) => DockBuilderCopyNodeImpl(src_node_id, dst_node_id, out_node_remap_pairs);
        
        [LinkName("igDockBuilderCopyWindowSettings")]
        private static extern void DockBuilderCopyWindowSettingsImpl(char* src_name, char* dst_name);
        public static void DockBuilderCopyWindowSettings(char* src_name, char* dst_name) => DockBuilderCopyWindowSettingsImpl(src_name, dst_name);
        
        [LinkName("igDockBuilderDockWindow")]
        private static extern void DockBuilderDockWindowImpl(char* window_name, ID node_id);
        public static void DockBuilderDockWindow(char* window_name, ID node_id) => DockBuilderDockWindowImpl(window_name, node_id);
        
        [LinkName("igDockBuilderFinish")]
        private static extern void DockBuilderFinishImpl(ID node_id);
        public static void DockBuilderFinish(ID node_id) => DockBuilderFinishImpl(node_id);
        
        [LinkName("igDockBuilderGetCentralNode")]
        private static extern DockNode* DockBuilderGetCentralNodeImpl(ID node_id);
        #if IMGUI_USE_REF
        public static ref DockNode DockBuilderGetCentralNode(ID node_id) { return ref *DockBuilderGetCentralNodeImpl(node_id); }
        #else
        public static DockNode* DockBuilderGetCentralNode(ID node_id) => DockBuilderGetCentralNodeImpl(node_id);
        #endif
        
        [LinkName("igDockBuilderGetNode")]
        private static extern DockNode* DockBuilderGetNodeImpl(ID node_id);
        #if IMGUI_USE_REF
        public static ref DockNode DockBuilderGetNode(ID node_id) { return ref *DockBuilderGetNodeImpl(node_id); }
        #else
        public static DockNode* DockBuilderGetNode(ID node_id) => DockBuilderGetNodeImpl(node_id);
        #endif
        
        [LinkName("igDockBuilderRemoveNode")]
        private static extern void DockBuilderRemoveNodeImpl(ID node_id);
        public static void DockBuilderRemoveNode(ID node_id) => DockBuilderRemoveNodeImpl(node_id);
        
        [LinkName("igDockBuilderRemoveNodeChildNodes")]
        private static extern void DockBuilderRemoveNodeChildNodesImpl(ID node_id);
        public static void DockBuilderRemoveNodeChildNodes(ID node_id) => DockBuilderRemoveNodeChildNodesImpl(node_id);
        
        [LinkName("igDockBuilderRemoveNodeDockedWindows")]
        private static extern void DockBuilderRemoveNodeDockedWindowsImpl(ID node_id, bool clear_settings_refs);
        public static void DockBuilderRemoveNodeDockedWindows(ID node_id, bool clear_settings_refs = true) => DockBuilderRemoveNodeDockedWindowsImpl(node_id, clear_settings_refs);
        
        [LinkName("igDockBuilderSetNodePos")]
        private static extern void DockBuilderSetNodePosImpl(ID node_id, Vec2 pos);
        public static void DockBuilderSetNodePos(ID node_id, Vec2 pos) => DockBuilderSetNodePosImpl(node_id, pos);
        
        [LinkName("igDockBuilderSetNodeSize")]
        private static extern void DockBuilderSetNodeSizeImpl(ID node_id, Vec2 size);
        public static void DockBuilderSetNodeSize(ID node_id, Vec2 size) => DockBuilderSetNodeSizeImpl(node_id, size);
        
        [LinkName("igDockBuilderSplitNode")]
        private static extern ID DockBuilderSplitNodeImpl(ID node_id, Dir split_dir, float size_ratio_for_node_at_dir, ID* out_id_at_dir, ID* out_id_at_opposite_dir);
        public static ID DockBuilderSplitNode(ID node_id, Dir split_dir, float size_ratio_for_node_at_dir, out ID out_id_at_dir, out ID out_id_at_opposite_dir)
        {
            out_id_at_dir = ?;
            out_id_at_opposite_dir = ?;
            return DockBuilderSplitNodeImpl(node_id, split_dir, size_ratio_for_node_at_dir, &out_id_at_dir, &out_id_at_opposite_dir);
        }
        
        [LinkName("igDockContextCalcDropPosForDocking")]
        private static extern bool DockContextCalcDropPosForDockingImpl(Window* target, DockNode* target_node, Window* payload_window, DockNode* payload_node, Dir split_dir, bool split_outer, Vec2* out_pos);
        public static bool DockContextCalcDropPosForDocking(Window* target, DockNode* target_node, Window* payload_window, DockNode* payload_node, Dir split_dir, bool split_outer, out Vec2 out_pos)
        {
            out_pos = ?;
            return DockContextCalcDropPosForDockingImpl(target, target_node, payload_window, payload_node, split_dir, split_outer, &out_pos);
        }
        
        [LinkName("igDockContextClearNodes")]
        private static extern void DockContextClearNodesImpl(Context* ctx, ID root_id, bool clear_settings_refs);
        public static void DockContextClearNodes(Context* ctx, ID root_id, bool clear_settings_refs) => DockContextClearNodesImpl(ctx, root_id, clear_settings_refs);
        
        [LinkName("igDockContextEndFrame")]
        private static extern void DockContextEndFrameImpl(Context* ctx);
        public static void DockContextEndFrame(Context* ctx) => DockContextEndFrameImpl(ctx);
        
        [LinkName("igDockContextFindNodeByID")]
        private static extern DockNode* DockContextFindNodeByIDImpl(Context* ctx, ID id);
        #if IMGUI_USE_REF
        public static ref DockNode DockContextFindNodeByID(Context* ctx, ID id) { return ref *DockContextFindNodeByIDImpl(ctx, id); }
        #else
        public static DockNode* DockContextFindNodeByID(Context* ctx, ID id) => DockContextFindNodeByIDImpl(ctx, id);
        #endif
        
        [LinkName("igDockContextGenNodeID")]
        private static extern ID DockContextGenNodeIDImpl(Context* ctx);
        public static ID DockContextGenNodeID(Context* ctx) => DockContextGenNodeIDImpl(ctx);
        
        [LinkName("igDockContextInitialize")]
        private static extern void DockContextInitializeImpl(Context* ctx);
        public static void DockContextInitialize(Context* ctx) => DockContextInitializeImpl(ctx);
        
        [LinkName("igDockContextNewFrameUpdateDocking")]
        private static extern void DockContextNewFrameUpdateDockingImpl(Context* ctx);
        public static void DockContextNewFrameUpdateDocking(Context* ctx) => DockContextNewFrameUpdateDockingImpl(ctx);
        
        [LinkName("igDockContextNewFrameUpdateUndocking")]
        private static extern void DockContextNewFrameUpdateUndockingImpl(Context* ctx);
        public static void DockContextNewFrameUpdateUndocking(Context* ctx) => DockContextNewFrameUpdateUndockingImpl(ctx);
        
        [LinkName("igDockContextProcessUndockNode")]
        private static extern void DockContextProcessUndockNodeImpl(Context* ctx, DockNode* node);
        public static void DockContextProcessUndockNode(Context* ctx, DockNode* node) => DockContextProcessUndockNodeImpl(ctx, node);
        
        [LinkName("igDockContextProcessUndockWindow")]
        private static extern void DockContextProcessUndockWindowImpl(Context* ctx, Window* window, bool clear_persistent_docking_ref);
        public static void DockContextProcessUndockWindow(Context* ctx, Window* window, bool clear_persistent_docking_ref = true) => DockContextProcessUndockWindowImpl(ctx, window, clear_persistent_docking_ref);
        
        [LinkName("igDockContextQueueDock")]
        private static extern void DockContextQueueDockImpl(Context* ctx, Window* target, DockNode* target_node, Window* payload, Dir split_dir, float split_ratio, bool split_outer);
        public static void DockContextQueueDock(Context* ctx, Window* target, DockNode* target_node, Window* payload, Dir split_dir, float split_ratio, bool split_outer) => DockContextQueueDockImpl(ctx, target, target_node, payload, split_dir, split_ratio, split_outer);
        
        [LinkName("igDockContextQueueUndockNode")]
        private static extern void DockContextQueueUndockNodeImpl(Context* ctx, DockNode* node);
        public static void DockContextQueueUndockNode(Context* ctx, DockNode* node) => DockContextQueueUndockNodeImpl(ctx, node);
        
        [LinkName("igDockContextQueueUndockWindow")]
        private static extern void DockContextQueueUndockWindowImpl(Context* ctx, Window* window);
        public static void DockContextQueueUndockWindow(Context* ctx, Window* window) => DockContextQueueUndockWindowImpl(ctx, window);
        
        [LinkName("igDockContextRebuildNodes")]
        private static extern void DockContextRebuildNodesImpl(Context* ctx);
        public static void DockContextRebuildNodes(Context* ctx) => DockContextRebuildNodesImpl(ctx);
        
        [LinkName("igDockContextShutdown")]
        private static extern void DockContextShutdownImpl(Context* ctx);
        public static void DockContextShutdown(Context* ctx) => DockContextShutdownImpl(ctx);
        
        [LinkName("igDockNodeBeginAmendTabBar")]
        private static extern bool DockNodeBeginAmendTabBarImpl(DockNode* node);
        public static bool DockNodeBeginAmendTabBar(DockNode* node) => DockNodeBeginAmendTabBarImpl(node);
        
        [LinkName("igDockNodeEndAmendTabBar")]
        private static extern void DockNodeEndAmendTabBarImpl();
        public static void DockNodeEndAmendTabBar() => DockNodeEndAmendTabBarImpl();
        
        [LinkName("igDockNodeGetDepth")]
        private static extern int32 DockNodeGetDepthImpl(DockNode* node);
        public static int32 DockNodeGetDepth(DockNode* node) => DockNodeGetDepthImpl(node);
        
        [LinkName("igDockNodeGetRootNode")]
        private static extern DockNode* DockNodeGetRootNodeImpl(DockNode* node);
        #if IMGUI_USE_REF
        public static ref DockNode DockNodeGetRootNode(DockNode* node) { return ref *DockNodeGetRootNodeImpl(node); }
        #else
        public static DockNode* DockNodeGetRootNode(DockNode* node) => DockNodeGetRootNodeImpl(node);
        #endif
        
        [LinkName("igDockNodeGetWindowMenuButtonId")]
        private static extern ID DockNodeGetWindowMenuButtonIdImpl(DockNode* node);
        public static ID DockNodeGetWindowMenuButtonId(DockNode* node) => DockNodeGetWindowMenuButtonIdImpl(node);
        
        [LinkName("igDockNodeIsInHierarchyOf")]
        private static extern bool DockNodeIsInHierarchyOfImpl(DockNode* node, DockNode* parent);
        public static bool DockNodeIsInHierarchyOf(DockNode* node, DockNode* parent) => DockNodeIsInHierarchyOfImpl(node, parent);
        
        [LinkName("igDockNodeWindowMenuHandler_Default")]
        private static extern void DockNodeWindowMenuHandlerDefaultImpl(Context* ctx, DockNode* node, TabBar* tab_bar);
        public static void DockNodeWindowMenuHandlerDefault(Context* ctx, DockNode* node, TabBar* tab_bar) => DockNodeWindowMenuHandlerDefaultImpl(ctx, node, tab_bar);
        
        [LinkName("igDockSpace")]
        private static extern ID DockSpaceImpl(ID id, Vec2 size, DockNodeFlags flags, WindowClass* window_class);
        public static ID DockSpace(ID id, Vec2 size = Vec2.Zero, DockNodeFlags flags = (DockNodeFlags) 0, WindowClass* window_class = null) => DockSpaceImpl(id, size, flags, window_class);
        
        [LinkName("igDockSpaceOverViewport")]
        private static extern ID DockSpaceOverViewportImpl(Viewport* viewport, DockNodeFlags flags, WindowClass* window_class);
        public static ID DockSpaceOverViewport(Viewport* viewport = null, DockNodeFlags flags = (DockNodeFlags) 0, WindowClass* window_class = null) => DockSpaceOverViewportImpl(viewport, flags, window_class);
        
        [LinkName("igDragBehavior")]
        private static extern bool DragBehaviorImpl(ID id, DataType data_type, void* p_v, float v_speed, void* p_min, void* p_max, char* format, SliderFlags flags);
        public static bool DragBehavior(ID id, DataType data_type, void* p_v, float v_speed, void* p_min, void* p_max, char* format, SliderFlags flags) => DragBehaviorImpl(id, data_type, p_v, v_speed, p_min, p_max, format, flags);
        
        [LinkName("igDragFloat")]
        private static extern bool DragFloatImpl(char* label, float* v, float v_speed, float v_min, float v_max, char* format, SliderFlags flags);
        public static bool DragFloat(char* label, float* v, float v_speed = (float) 1.0f, float v_min = (float) 0.0f, float v_max = (float) 0.0f, char* format = "%.3f", SliderFlags flags = (SliderFlags) 0) => DragFloatImpl(label, v, v_speed, v_min, v_max, format, flags);
        
        [LinkName("igDragFloat2")]
        private static extern bool DragFloat2Impl(char* label, float[2] v, float v_speed, float v_min, float v_max, char* format, SliderFlags flags);
        public static bool DragFloat2(char* label, ref float[2] v, float v_speed = (float) 1.0f, float v_min = (float) 0.0f, float v_max = (float) 0.0f, char* format = "%.3f", SliderFlags flags = (SliderFlags) 0) => DragFloat2Impl(label, v, v_speed, v_min, v_max, format, flags);
        
        [LinkName("igDragFloat3")]
        private static extern bool DragFloat3Impl(char* label, float[3] v, float v_speed, float v_min, float v_max, char* format, SliderFlags flags);
        public static bool DragFloat3(char* label, ref float[3] v, float v_speed = (float) 1.0f, float v_min = (float) 0.0f, float v_max = (float) 0.0f, char* format = "%.3f", SliderFlags flags = (SliderFlags) 0) => DragFloat3Impl(label, v, v_speed, v_min, v_max, format, flags);
        
        [LinkName("igDragFloat4")]
        private static extern bool DragFloat4Impl(char* label, float[4] v, float v_speed, float v_min, float v_max, char* format, SliderFlags flags);
        public static bool DragFloat4(char* label, ref float[4] v, float v_speed = (float) 1.0f, float v_min = (float) 0.0f, float v_max = (float) 0.0f, char* format = "%.3f", SliderFlags flags = (SliderFlags) 0) => DragFloat4Impl(label, v, v_speed, v_min, v_max, format, flags);
        
        [LinkName("igDragFloatRange2")]
        private static extern bool DragFloatRange2Impl(char* label, float* v_current_min, float* v_current_max, float v_speed, float v_min, float v_max, char* format, char* format_max, SliderFlags flags);
        public static bool DragFloatRange2(char* label, float* v_current_min, float* v_current_max, float v_speed = (float) 1.0f, float v_min = (float) 0.0f, float v_max = (float) 0.0f, char* format = "%.3f", char* format_max = null, SliderFlags flags = (SliderFlags) 0) => DragFloatRange2Impl(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, flags);
        
        [LinkName("igDragInt")]
        private static extern bool DragIntImpl(char* label, int32* v, float v_speed, int32 v_min, int32 v_max, char* format, SliderFlags flags);
        public static bool DragInt(char* label, int32* v, float v_speed = (float) 1.0f, int32 v_min = (int32) 0, int32 v_max = (int32) 0, char* format = "%d", SliderFlags flags = (SliderFlags) 0) => DragIntImpl(label, v, v_speed, v_min, v_max, format, flags);
        
        [LinkName("igDragInt2")]
        private static extern bool DragInt2Impl(char* label, int32[2] v, float v_speed, int32 v_min, int32 v_max, char* format, SliderFlags flags);
        public static bool DragInt2(char* label, ref int32[2] v, float v_speed = (float) 1.0f, int32 v_min = (int32) 0, int32 v_max = (int32) 0, char* format = "%d", SliderFlags flags = (SliderFlags) 0) => DragInt2Impl(label, v, v_speed, v_min, v_max, format, flags);
        
        [LinkName("igDragInt3")]
        private static extern bool DragInt3Impl(char* label, int32[3] v, float v_speed, int32 v_min, int32 v_max, char* format, SliderFlags flags);
        public static bool DragInt3(char* label, ref int32[3] v, float v_speed = (float) 1.0f, int32 v_min = (int32) 0, int32 v_max = (int32) 0, char* format = "%d", SliderFlags flags = (SliderFlags) 0) => DragInt3Impl(label, v, v_speed, v_min, v_max, format, flags);
        
        [LinkName("igDragInt4")]
        private static extern bool DragInt4Impl(char* label, int32[4] v, float v_speed, int32 v_min, int32 v_max, char* format, SliderFlags flags);
        public static bool DragInt4(char* label, ref int32[4] v, float v_speed = (float) 1.0f, int32 v_min = (int32) 0, int32 v_max = (int32) 0, char* format = "%d", SliderFlags flags = (SliderFlags) 0) => DragInt4Impl(label, v, v_speed, v_min, v_max, format, flags);
        
        [LinkName("igDragIntRange2")]
        private static extern bool DragIntRange2Impl(char* label, int32* v_current_min, int32* v_current_max, float v_speed, int32 v_min, int32 v_max, char* format, char* format_max, SliderFlags flags);
        public static bool DragIntRange2(char* label, int32* v_current_min, int32* v_current_max, float v_speed = (float) 1.0f, int32 v_min = (int32) 0, int32 v_max = (int32) 0, char* format = "%d", char* format_max = null, SliderFlags flags = (SliderFlags) 0) => DragIntRange2Impl(label, v_current_min, v_current_max, v_speed, v_min, v_max, format, format_max, flags);
        
        [LinkName("igDragScalar")]
        private static extern bool DragScalarImpl(char* label, DataType data_type, void* p_data, float v_speed, void* p_min, void* p_max, char* format, SliderFlags flags);
        public static bool DragScalar(char* label, DataType data_type, void* p_data, float v_speed = (float) 1.0f, void* p_min = null, void* p_max = null, char* format = null, SliderFlags flags = (SliderFlags) 0) => DragScalarImpl(label, data_type, p_data, v_speed, p_min, p_max, format, flags);
        
        [LinkName("igDragScalarN")]
        private static extern bool DragScalarNImpl(char* label, DataType data_type, void* p_data, int32 components, float v_speed, void* p_min, void* p_max, char* format, SliderFlags flags);
        public static bool DragScalarN(char* label, DataType data_type, void* p_data, int32 components, float v_speed = (float) 1.0f, void* p_min = null, void* p_max = null, char* format = null, SliderFlags flags = (SliderFlags) 0) => DragScalarNImpl(label, data_type, p_data, components, v_speed, p_min, p_max, format, flags);
        
        [LinkName("igDummy")]
        private static extern void DummyImpl(Vec2 size);
        public static void Dummy(Vec2 size) => DummyImpl(size);
        
        [LinkName("igEnd")]
        private static extern void EndImpl();
        public static void End() => EndImpl();
        
        [LinkName("igEndChild")]
        private static extern void EndChildImpl();
        public static void EndChild() => EndChildImpl();
        
        [LinkName("igEndChildFrame")]
        private static extern void EndChildFrameImpl();
        public static void EndChildFrame() => EndChildFrameImpl();
        
        [LinkName("igEndColumns")]
        private static extern void EndColumnsImpl();
        public static void EndColumns() => EndColumnsImpl();
        
        [LinkName("igEndCombo")]
        private static extern void EndComboImpl();
        public static void EndCombo() => EndComboImpl();
        
        [LinkName("igEndComboPreview")]
        private static extern void EndComboPreviewImpl();
        public static void EndComboPreview() => EndComboPreviewImpl();
        
        [LinkName("igEndDisabled")]
        private static extern void EndDisabledImpl();
        public static void EndDisabled() => EndDisabledImpl();
        
        [LinkName("igEndDragDropSource")]
        private static extern void EndDragDropSourceImpl();
        public static void EndDragDropSource() => EndDragDropSourceImpl();
        
        [LinkName("igEndDragDropTarget")]
        private static extern void EndDragDropTargetImpl();
        public static void EndDragDropTarget() => EndDragDropTargetImpl();
        
        [LinkName("igEndFrame")]
        private static extern void EndFrameImpl();
        public static void EndFrame() => EndFrameImpl();
        
        [LinkName("igEndGroup")]
        private static extern void EndGroupImpl();
        public static void EndGroup() => EndGroupImpl();
        
        [LinkName("igEndListBox")]
        private static extern void EndListBoxImpl();
        public static void EndListBox() => EndListBoxImpl();
        
        [LinkName("igEndMainMenuBar")]
        private static extern void EndMainMenuBarImpl();
        public static void EndMainMenuBar() => EndMainMenuBarImpl();
        
        [LinkName("igEndMenu")]
        private static extern void EndMenuImpl();
        public static void EndMenu() => EndMenuImpl();
        
        [LinkName("igEndMenuBar")]
        private static extern void EndMenuBarImpl();
        public static void EndMenuBar() => EndMenuBarImpl();
        
        [LinkName("igEndPopup")]
        private static extern void EndPopupImpl();
        public static void EndPopup() => EndPopupImpl();
        
        [LinkName("igEndTabBar")]
        private static extern void EndTabBarImpl();
        public static void EndTabBar() => EndTabBarImpl();
        
        [LinkName("igEndTabItem")]
        private static extern void EndTabItemImpl();
        public static void EndTabItem() => EndTabItemImpl();
        
        [LinkName("igEndTable")]
        private static extern void EndTableImpl();
        public static void EndTable() => EndTableImpl();
        
        [LinkName("igEndTooltip")]
        private static extern void EndTooltipImpl();
        public static void EndTooltip() => EndTooltipImpl();
        
        [LinkName("igErrorCheckEndFrameRecover")]
        private static extern void ErrorCheckEndFrameRecoverImpl(ErrorLogCallback log_callback, void* user_data);
        public static void ErrorCheckEndFrameRecover(ErrorLogCallback log_callback, void* user_data = null) => ErrorCheckEndFrameRecoverImpl(log_callback, user_data);
        
        [LinkName("igErrorCheckEndWindowRecover")]
        private static extern void ErrorCheckEndWindowRecoverImpl(ErrorLogCallback log_callback, void* user_data);
        public static void ErrorCheckEndWindowRecover(ErrorLogCallback log_callback, void* user_data = null) => ErrorCheckEndWindowRecoverImpl(log_callback, user_data);
        
        [LinkName("igErrorCheckUsingSetCursorPosToExtendParentBoundaries")]
        private static extern void ErrorCheckUsingSetCursorPosToExtendParentBoundariesImpl();
        public static void ErrorCheckUsingSetCursorPosToExtendParentBoundaries() => ErrorCheckUsingSetCursorPosToExtendParentBoundariesImpl();
        
        [LinkName("igFindBestWindowPosForPopup")]
        private static extern Vec2 FindBestWindowPosForPopupImpl(Vec2* pOut, Window* window);
        public static Vec2 FindBestWindowPosForPopup(Window* window)
        {
            Vec2 pOut = default;
            FindBestWindowPosForPopupImpl(&pOut, window);
            return pOut;
        }
        
        [LinkName("igFindBestWindowPosForPopupEx")]
        private static extern Vec2 FindBestWindowPosForPopupExImpl(Vec2* pOut, Vec2 ref_pos, Vec2 size, Dir* last_dir, Rect r_outer, Rect r_avoid, PopupPositionPolicy policy);
        public static Vec2 FindBestWindowPosForPopupEx(Vec2 ref_pos, Vec2 size, Dir* last_dir, Rect r_outer, Rect r_avoid, PopupPositionPolicy policy)
        {
            Vec2 pOut = default;
            FindBestWindowPosForPopupExImpl(&pOut, ref_pos, size, last_dir, r_outer, r_avoid, policy);
            return pOut;
        }
        
        [LinkName("igFindBottomMostVisibleWindowWithinBeginStack")]
        private static extern Window* FindBottomMostVisibleWindowWithinBeginStackImpl(Window* window);
        #if IMGUI_USE_REF
        public static ref Window FindBottomMostVisibleWindowWithinBeginStack(Window* window) { return ref *FindBottomMostVisibleWindowWithinBeginStackImpl(window); }
        #else
        public static Window* FindBottomMostVisibleWindowWithinBeginStack(Window* window) => FindBottomMostVisibleWindowWithinBeginStackImpl(window);
        #endif
        
        [LinkName("igFindHoveredViewportFromPlatformWindowStack")]
        private static extern ViewportP* FindHoveredViewportFromPlatformWindowStackImpl(Vec2 mouse_platform_pos);
        #if IMGUI_USE_REF
        public static ref ViewportP FindHoveredViewportFromPlatformWindowStack(Vec2 mouse_platform_pos) { return ref *FindHoveredViewportFromPlatformWindowStackImpl(mouse_platform_pos); }
        #else
        public static ViewportP* FindHoveredViewportFromPlatformWindowStack(Vec2 mouse_platform_pos) => FindHoveredViewportFromPlatformWindowStackImpl(mouse_platform_pos);
        #endif
        
        [LinkName("igFindOrCreateColumns")]
        private static extern OldColumns* FindOrCreateColumnsImpl(Window* window, ID id);
        #if IMGUI_USE_REF
        public static ref OldColumns FindOrCreateColumns(Window* window, ID id) { return ref *FindOrCreateColumnsImpl(window, id); }
        #else
        public static OldColumns* FindOrCreateColumns(Window* window, ID id) => FindOrCreateColumnsImpl(window, id);
        #endif
        
        [LinkName("igFindRenderedTextEnd")]
        private static extern char* FindRenderedTextEndImpl(char* text, char* text_end);
        #if IMGUI_USE_REF
        public static ref char FindRenderedTextEnd(char* text, char* text_end = null) { return ref *FindRenderedTextEndImpl(text, text_end); }
        #else
        public static char* FindRenderedTextEnd(char* text, char* text_end = null) => FindRenderedTextEndImpl(text, text_end);
        #endif
        
        [LinkName("igFindSettingsHandler")]
        private static extern SettingsHandler* FindSettingsHandlerImpl(char* type_name);
        #if IMGUI_USE_REF
        public static ref SettingsHandler FindSettingsHandler(char* type_name) { return ref *FindSettingsHandlerImpl(type_name); }
        #else
        public static SettingsHandler* FindSettingsHandler(char* type_name) => FindSettingsHandlerImpl(type_name);
        #endif
        
        [LinkName("igFindViewportByID")]
        private static extern Viewport* FindViewportByIDImpl(ID id);
        #if IMGUI_USE_REF
        public static ref Viewport FindViewportByID(ID id) { return ref *FindViewportByIDImpl(id); }
        #else
        public static Viewport* FindViewportByID(ID id) => FindViewportByIDImpl(id);
        #endif
        
        [LinkName("igFindViewportByPlatformHandle")]
        private static extern Viewport* FindViewportByPlatformHandleImpl(void* platform_handle);
        #if IMGUI_USE_REF
        public static ref Viewport FindViewportByPlatformHandle(void* platform_handle) { return ref *FindViewportByPlatformHandleImpl(platform_handle); }
        #else
        public static Viewport* FindViewportByPlatformHandle(void* platform_handle) => FindViewportByPlatformHandleImpl(platform_handle);
        #endif
        
        [LinkName("igFindWindowByID")]
        private static extern Window* FindWindowByIDImpl(ID id);
        #if IMGUI_USE_REF
        public static ref Window FindWindowByID(ID id) { return ref *FindWindowByIDImpl(id); }
        #else
        public static Window* FindWindowByID(ID id) => FindWindowByIDImpl(id);
        #endif
        
        [LinkName("igFindWindowByName")]
        private static extern Window* FindWindowByNameImpl(char* name);
        #if IMGUI_USE_REF
        public static ref Window FindWindowByName(char* name) { return ref *FindWindowByNameImpl(name); }
        #else
        public static Window* FindWindowByName(char* name) => FindWindowByNameImpl(name);
        #endif
        
        [LinkName("igFindWindowDisplayIndex")]
        private static extern int32 FindWindowDisplayIndexImpl(Window* window);
        public static int32 FindWindowDisplayIndex(Window* window) => FindWindowDisplayIndexImpl(window);
        
        [LinkName("igFindWindowSettingsByID")]
        private static extern WindowSettings* FindWindowSettingsByIDImpl(ID id);
        #if IMGUI_USE_REF
        public static ref WindowSettings FindWindowSettingsByID(ID id) { return ref *FindWindowSettingsByIDImpl(id); }
        #else
        public static WindowSettings* FindWindowSettingsByID(ID id) => FindWindowSettingsByIDImpl(id);
        #endif
        
        [LinkName("igFindWindowSettingsByWindow")]
        private static extern WindowSettings* FindWindowSettingsByWindowImpl(Window* window);
        #if IMGUI_USE_REF
        public static ref WindowSettings FindWindowSettingsByWindow(Window* window) { return ref *FindWindowSettingsByWindowImpl(window); }
        #else
        public static WindowSettings* FindWindowSettingsByWindow(Window* window) => FindWindowSettingsByWindowImpl(window);
        #endif
        
        [LinkName("igFocusTopMostWindowUnderOne")]
        private static extern void FocusTopMostWindowUnderOneImpl(Window* under_this_window, Window* ignore_window, Viewport* filter_viewport);
        public static void FocusTopMostWindowUnderOne(Window* under_this_window, Window* ignore_window, Viewport* filter_viewport) => FocusTopMostWindowUnderOneImpl(under_this_window, ignore_window, filter_viewport);
        
        [LinkName("igFocusWindow")]
        private static extern void FocusWindowImpl(Window* window);
        public static void FocusWindow(Window* window) => FocusWindowImpl(window);
        
        [LinkName("igGcAwakeTransientWindowBuffers")]
        private static extern void GcAwakeTransientWindowBuffersImpl(Window* window);
        public static void GcAwakeTransientWindowBuffers(Window* window) => GcAwakeTransientWindowBuffersImpl(window);
        
        [LinkName("igGcCompactTransientMiscBuffers")]
        private static extern void GcCompactTransientMiscBuffersImpl();
        public static void GcCompactTransientMiscBuffers() => GcCompactTransientMiscBuffersImpl();
        
        [LinkName("igGcCompactTransientWindowBuffers")]
        private static extern void GcCompactTransientWindowBuffersImpl(Window* window);
        public static void GcCompactTransientWindowBuffers(Window* window) => GcCompactTransientWindowBuffersImpl(window);
        
        [LinkName("igGetActiveID")]
        private static extern ID GetActiveIDImpl();
        public static ID GetActiveID() => GetActiveIDImpl();
        
        [LinkName("igGetAllocatorFunctions")]
        private static extern void GetAllocatorFunctionsImpl(MemAllocFunc* p_alloc_func, MemFreeFunc* p_free_func, void** p_user_data);
        public static void GetAllocatorFunctions(MemAllocFunc* p_alloc_func, MemFreeFunc* p_free_func, void** p_user_data) => GetAllocatorFunctionsImpl(p_alloc_func, p_free_func, p_user_data);
        
        [LinkName("igGetBackgroundDrawList_Nil")]
        private static extern DrawList* GetBackgroundDrawListImpl();
        #if IMGUI_USE_REF
        public static ref DrawList GetBackgroundDrawList() { return ref *GetBackgroundDrawListImpl(); }
        #else
        public static DrawList* GetBackgroundDrawList() => GetBackgroundDrawListImpl();
        #endif
        
        [LinkName("igGetBackgroundDrawList_ViewportPtr")]
        private static extern DrawList* GetBackgroundDrawListImpl(Viewport* viewport);
        #if IMGUI_USE_REF
        public static ref DrawList GetBackgroundDrawList(Viewport* viewport) { return ref *GetBackgroundDrawListImpl(viewport); }
        #else
        public static DrawList* GetBackgroundDrawList(Viewport* viewport) => GetBackgroundDrawListImpl(viewport);
        #endif
        
        [LinkName("igGetClipboardText")]
        private static extern char* GetClipboardTextImpl();
        #if IMGUI_USE_REF
        public static ref char GetClipboardText() { return ref *GetClipboardTextImpl(); }
        #else
        public static char* GetClipboardText() => GetClipboardTextImpl();
        #endif
        
        [LinkName("igGetColorU32_Col")]
        private static extern U32 GetColorU32Impl(Col idx, float alpha_mul);
        public static U32 GetColorU32(Col idx, float alpha_mul = (float) 1.0f) => GetColorU32Impl(idx, alpha_mul);
        
        [LinkName("igGetColorU32_Vec4")]
        private static extern U32 GetColorU32Impl(Vec4 col);
        public static U32 GetColorU32(Vec4 col) => GetColorU32Impl(col);
        
        [LinkName("igGetColorU32_U32")]
        private static extern U32 GetColorU32Impl(U32 col);
        public static U32 GetColorU32(U32 col) => GetColorU32Impl(col);
        
        [LinkName("igGetColumnIndex")]
        private static extern int32 GetColumnIndexImpl();
        public static int32 GetColumnIndex() => GetColumnIndexImpl();
        
        [LinkName("igGetColumnNormFromOffset")]
        private static extern float GetColumnNormFromOffsetImpl(OldColumns* columns, float offset);
        public static float GetColumnNormFromOffset(OldColumns* columns, float offset) => GetColumnNormFromOffsetImpl(columns, offset);
        
        [LinkName("igGetColumnOffset")]
        private static extern float GetColumnOffsetImpl(int32 column_index);
        public static float GetColumnOffset(int32 column_index = -1) => GetColumnOffsetImpl(column_index);
        
        [LinkName("igGetColumnOffsetFromNorm")]
        private static extern float GetColumnOffsetFromNormImpl(OldColumns* columns, float offset_norm);
        public static float GetColumnOffsetFromNorm(OldColumns* columns, float offset_norm) => GetColumnOffsetFromNormImpl(columns, offset_norm);
        
        [LinkName("igGetColumnWidth")]
        private static extern float GetColumnWidthImpl(int32 column_index);
        public static float GetColumnWidth(int32 column_index = -1) => GetColumnWidthImpl(column_index);
        
        [LinkName("igGetColumnsCount")]
        private static extern int32 GetColumnsCountImpl();
        public static int32 GetColumnsCount() => GetColumnsCountImpl();
        
        [LinkName("igGetColumnsID")]
        private static extern ID GetColumnsIDImpl(char* str_id, int32 count);
        public static ID GetColumnsID(char* str_id, int32 count) => GetColumnsIDImpl(str_id, count);
        
        [LinkName("igGetContentRegionAvail")]
        private static extern Vec2 GetContentRegionAvailImpl(Vec2* pOut);
        public static Vec2 GetContentRegionAvail()
        {
            Vec2 pOut = default;
            GetContentRegionAvailImpl(&pOut);
            return pOut;
        }
        
        [LinkName("igGetContentRegionMax")]
        private static extern Vec2 GetContentRegionMaxImpl(Vec2* pOut);
        public static Vec2 GetContentRegionMax()
        {
            Vec2 pOut = default;
            GetContentRegionMaxImpl(&pOut);
            return pOut;
        }
        
        [LinkName("igGetContentRegionMaxAbs")]
        private static extern Vec2 GetContentRegionMaxAbsImpl(Vec2* pOut);
        public static Vec2 GetContentRegionMaxAbs()
        {
            Vec2 pOut = default;
            GetContentRegionMaxAbsImpl(&pOut);
            return pOut;
        }
        
        [LinkName("igGetCurrentContext")]
        private static extern Context* GetCurrentContextImpl();
        #if IMGUI_USE_REF
        public static ref Context GetCurrentContext() { return ref *GetCurrentContextImpl(); }
        #else
        public static Context* GetCurrentContext() => GetCurrentContextImpl();
        #endif
        
        [LinkName("igGetCurrentFocusScope")]
        private static extern ID GetCurrentFocusScopeImpl();
        public static ID GetCurrentFocusScope() => GetCurrentFocusScopeImpl();
        
        [LinkName("igGetCurrentTabBar")]
        private static extern TabBar* GetCurrentTabBarImpl();
        #if IMGUI_USE_REF
        public static ref TabBar GetCurrentTabBar() { return ref *GetCurrentTabBarImpl(); }
        #else
        public static TabBar* GetCurrentTabBar() => GetCurrentTabBarImpl();
        #endif
        
        [LinkName("igGetCurrentTable")]
        private static extern Table* GetCurrentTableImpl();
        #if IMGUI_USE_REF
        public static ref Table GetCurrentTable() { return ref *GetCurrentTableImpl(); }
        #else
        public static Table* GetCurrentTable() => GetCurrentTableImpl();
        #endif
        
        [LinkName("igGetCurrentWindow")]
        private static extern Window* GetCurrentWindowImpl();
        #if IMGUI_USE_REF
        public static ref Window GetCurrentWindow() { return ref *GetCurrentWindowImpl(); }
        #else
        public static Window* GetCurrentWindow() => GetCurrentWindowImpl();
        #endif
        
        [LinkName("igGetCurrentWindowRead")]
        private static extern Window* GetCurrentWindowReadImpl();
        #if IMGUI_USE_REF
        public static ref Window GetCurrentWindowRead() { return ref *GetCurrentWindowReadImpl(); }
        #else
        public static Window* GetCurrentWindowRead() => GetCurrentWindowReadImpl();
        #endif
        
        [LinkName("igGetCursorPos")]
        private static extern Vec2 GetCursorPosImpl(Vec2* pOut);
        public static Vec2 GetCursorPos()
        {
            Vec2 pOut = default;
            GetCursorPosImpl(&pOut);
            return pOut;
        }
        
        [LinkName("igGetCursorPosX")]
        private static extern float GetCursorPosXImpl();
        public static float GetCursorPosX() => GetCursorPosXImpl();
        
        [LinkName("igGetCursorPosY")]
        private static extern float GetCursorPosYImpl();
        public static float GetCursorPosY() => GetCursorPosYImpl();
        
        [LinkName("igGetCursorScreenPos")]
        private static extern Vec2 GetCursorScreenPosImpl(Vec2* pOut);
        public static Vec2 GetCursorScreenPos()
        {
            Vec2 pOut = default;
            GetCursorScreenPosImpl(&pOut);
            return pOut;
        }
        
        [LinkName("igGetCursorStartPos")]
        private static extern Vec2 GetCursorStartPosImpl(Vec2* pOut);
        public static Vec2 GetCursorStartPos()
        {
            Vec2 pOut = default;
            GetCursorStartPosImpl(&pOut);
            return pOut;
        }
        
        [LinkName("igGetDefaultFont")]
        private static extern Font* GetDefaultFontImpl();
        #if IMGUI_USE_REF
        public static ref Font GetDefaultFont() { return ref *GetDefaultFontImpl(); }
        #else
        public static Font* GetDefaultFont() => GetDefaultFontImpl();
        #endif
        
        [LinkName("igGetDragDropPayload")]
        private static extern Payload* GetDragDropPayloadImpl();
        #if IMGUI_USE_REF
        public static ref Payload GetDragDropPayload() { return ref *GetDragDropPayloadImpl(); }
        #else
        public static Payload* GetDragDropPayload() => GetDragDropPayloadImpl();
        #endif
        
        [LinkName("igGetDrawData")]
        private static extern DrawData* GetDrawDataImpl();
        #if IMGUI_USE_REF
        public static ref DrawData GetDrawData() { return ref *GetDrawDataImpl(); }
        #else
        public static DrawData* GetDrawData() => GetDrawDataImpl();
        #endif
        
        [LinkName("igGetDrawListSharedData")]
        private static extern DrawListSharedData* GetDrawListSharedDataImpl();
        #if IMGUI_USE_REF
        public static ref DrawListSharedData GetDrawListSharedData() { return ref *GetDrawListSharedDataImpl(); }
        #else
        public static DrawListSharedData* GetDrawListSharedData() => GetDrawListSharedDataImpl();
        #endif
        
        [LinkName("igGetFocusID")]
        private static extern ID GetFocusIDImpl();
        public static ID GetFocusID() => GetFocusIDImpl();
        
        [LinkName("igGetFont")]
        private static extern Font* GetFontImpl();
        #if IMGUI_USE_REF
        public static ref Font GetFont() { return ref *GetFontImpl(); }
        #else
        public static Font* GetFont() => GetFontImpl();
        #endif
        
        [LinkName("igGetFontSize")]
        private static extern float GetFontSizeImpl();
        public static float GetFontSize() => GetFontSizeImpl();
        
        [LinkName("igGetFontTexUvWhitePixel")]
        private static extern Vec2 GetFontTexUvWhitePixelImpl(Vec2* pOut);
        public static Vec2 GetFontTexUvWhitePixel()
        {
            Vec2 pOut = default;
            GetFontTexUvWhitePixelImpl(&pOut);
            return pOut;
        }
        
        [LinkName("igGetForegroundDrawList_Nil")]
        private static extern DrawList* GetForegroundDrawListImpl();
        #if IMGUI_USE_REF
        public static ref DrawList GetForegroundDrawList() { return ref *GetForegroundDrawListImpl(); }
        #else
        public static DrawList* GetForegroundDrawList() => GetForegroundDrawListImpl();
        #endif
        
        [LinkName("igGetForegroundDrawList_ViewportPtr")]
        private static extern DrawList* GetForegroundDrawListImpl(Viewport* viewport);
        #if IMGUI_USE_REF
        public static ref DrawList GetForegroundDrawList(Viewport* viewport) { return ref *GetForegroundDrawListImpl(viewport); }
        #else
        public static DrawList* GetForegroundDrawList(Viewport* viewport) => GetForegroundDrawListImpl(viewport);
        #endif
        
        [LinkName("igGetForegroundDrawList_WindowPtr")]
        private static extern DrawList* GetForegroundDrawListImpl(Window* window);
        #if IMGUI_USE_REF
        public static ref DrawList GetForegroundDrawList(Window* window) { return ref *GetForegroundDrawListImpl(window); }
        #else
        public static DrawList* GetForegroundDrawList(Window* window) => GetForegroundDrawListImpl(window);
        #endif
        
        [LinkName("igGetFrameCount")]
        private static extern int32 GetFrameCountImpl();
        public static int32 GetFrameCount() => GetFrameCountImpl();
        
        [LinkName("igGetFrameHeight")]
        private static extern float GetFrameHeightImpl();
        public static float GetFrameHeight() => GetFrameHeightImpl();
        
        [LinkName("igGetFrameHeightWithSpacing")]
        private static extern float GetFrameHeightWithSpacingImpl();
        public static float GetFrameHeightWithSpacing() => GetFrameHeightWithSpacingImpl();
        
        [LinkName("igGetHoveredID")]
        private static extern ID GetHoveredIDImpl();
        public static ID GetHoveredID() => GetHoveredIDImpl();
        
        [LinkName("igGetID_Str")]
        private static extern ID GetIDImpl(char* str_id);
        public static ID GetID(char* str_id) => GetIDImpl(str_id);
        
        [LinkName("igGetID_StrStr")]
        private static extern ID GetIDImpl(char* str_id_begin, char* str_id_end);
        public static ID GetID(char* str_id_begin, char* str_id_end) => GetIDImpl(str_id_begin, str_id_end);
        
        [LinkName("igGetID_Ptr")]
        private static extern ID GetIDImpl(void* ptr_id);
        public static ID GetID(void* ptr_id) => GetIDImpl(ptr_id);
        
        [LinkName("igGetIDWithSeed_Str")]
        private static extern ID GetIDWithSeedImpl(char* str_id_begin, char* str_id_end, ID seed);
        public static ID GetIDWithSeed(char* str_id_begin, char* str_id_end, ID seed) => GetIDWithSeedImpl(str_id_begin, str_id_end, seed);
        
        [LinkName("igGetIDWithSeed_Int")]
        private static extern ID GetIDWithSeedImpl(int32 n, ID seed);
        public static ID GetIDWithSeed(int32 n, ID seed) => GetIDWithSeedImpl(n, seed);
        
        [LinkName("igGetIO")]
        private static extern IO* GetIOImpl();
        #if IMGUI_USE_REF
        public static ref IO GetIO() { return ref *GetIOImpl(); }
        #else
        public static IO* GetIO() => GetIOImpl();
        #endif
        
        [LinkName("igGetInputTextState")]
        private static extern InputTextState* GetInputTextStateImpl(ID id);
        #if IMGUI_USE_REF
        public static ref InputTextState GetInputTextState(ID id) { return ref *GetInputTextStateImpl(id); }
        #else
        public static InputTextState* GetInputTextState(ID id) => GetInputTextStateImpl(id);
        #endif
        
        [LinkName("igGetItemFlags")]
        private static extern ItemFlags GetItemFlagsImpl();
        public static ItemFlags GetItemFlags() => GetItemFlagsImpl();
        
        [LinkName("igGetItemID")]
        private static extern ID GetItemIDImpl();
        public static ID GetItemID() => GetItemIDImpl();
        
        [LinkName("igGetItemRectMax")]
        private static extern Vec2 GetItemRectMaxImpl(Vec2* pOut);
        public static Vec2 GetItemRectMax()
        {
            Vec2 pOut = default;
            GetItemRectMaxImpl(&pOut);
            return pOut;
        }
        
        [LinkName("igGetItemRectMin")]
        private static extern Vec2 GetItemRectMinImpl(Vec2* pOut);
        public static Vec2 GetItemRectMin()
        {
            Vec2 pOut = default;
            GetItemRectMinImpl(&pOut);
            return pOut;
        }
        
        [LinkName("igGetItemRectSize")]
        private static extern Vec2 GetItemRectSizeImpl(Vec2* pOut);
        public static Vec2 GetItemRectSize()
        {
            Vec2 pOut = default;
            GetItemRectSizeImpl(&pOut);
            return pOut;
        }
        
        [LinkName("igGetItemStatusFlags")]
        private static extern ItemStatusFlags GetItemStatusFlagsImpl();
        public static ItemStatusFlags GetItemStatusFlags() => GetItemStatusFlagsImpl();
        
        [LinkName("igGetKeyChordName")]
        private static extern void GetKeyChordNameImpl(KeyChord key_chord, char* out_buf, int32 out_buf_size);
        public static void GetKeyChordName(KeyChord key_chord, out char out_buf, int32 out_buf_size)
        {
            out_buf = ?;
        }
        
        [LinkName("igGetKeyData_ContextPtr")]
        private static extern KeyData* GetKeyDataImpl(Context* ctx, Key key);
        #if IMGUI_USE_REF
        public static ref KeyData GetKeyData(Context* ctx, Key key) { return ref *GetKeyDataImpl(ctx, key); }
        #else
        public static KeyData* GetKeyData(Context* ctx, Key key) => GetKeyDataImpl(ctx, key);
        #endif
        
        [LinkName("igGetKeyData_Key")]
        private static extern KeyData* GetKeyDataImpl(Key key);
        #if IMGUI_USE_REF
        public static ref KeyData GetKeyData(Key key) { return ref *GetKeyDataImpl(key); }
        #else
        public static KeyData* GetKeyData(Key key) => GetKeyDataImpl(key);
        #endif
        
        [LinkName("igGetKeyIndex")]
        private static extern Key GetKeyIndexImpl(Key key);
        public static Key GetKeyIndex(Key key) => GetKeyIndexImpl(key);
        
        [LinkName("igGetKeyMagnitude2d")]
        private static extern Vec2 GetKeyMagnitude2dImpl(Vec2* pOut, Key key_left, Key key_right, Key key_up, Key key_down);
        public static Vec2 GetKeyMagnitude2d(Key key_left, Key key_right, Key key_up, Key key_down)
        {
            Vec2 pOut = default;
            GetKeyMagnitude2dImpl(&pOut, key_left, key_right, key_up, key_down);
            return pOut;
        }
        
        [LinkName("igGetKeyName")]
        private static extern char* GetKeyNameImpl(Key key);
        #if IMGUI_USE_REF
        public static ref char GetKeyName(Key key) { return ref *GetKeyNameImpl(key); }
        #else
        public static char* GetKeyName(Key key) => GetKeyNameImpl(key);
        #endif
        
        [LinkName("igGetKeyOwner")]
        private static extern ID GetKeyOwnerImpl(Key key);
        public static ID GetKeyOwner(Key key) => GetKeyOwnerImpl(key);
        
        [LinkName("igGetKeyOwnerData")]
        private static extern KeyOwnerData* GetKeyOwnerDataImpl(Context* ctx, Key key);
        #if IMGUI_USE_REF
        public static ref KeyOwnerData GetKeyOwnerData(Context* ctx, Key key) { return ref *GetKeyOwnerDataImpl(ctx, key); }
        #else
        public static KeyOwnerData* GetKeyOwnerData(Context* ctx, Key key) => GetKeyOwnerDataImpl(ctx, key);
        #endif
        
        [LinkName("igGetKeyPressedAmount")]
        private static extern int32 GetKeyPressedAmountImpl(Key key, float repeat_delay, float rate);
        public static int32 GetKeyPressedAmount(Key key, float repeat_delay, float rate) => GetKeyPressedAmountImpl(key, repeat_delay, rate);
        
        [LinkName("igGetMainViewport")]
        private static extern Viewport* GetMainViewportImpl();
        #if IMGUI_USE_REF
        public static ref Viewport GetMainViewport() { return ref *GetMainViewportImpl(); }
        #else
        public static Viewport* GetMainViewport() => GetMainViewportImpl();
        #endif
        
        [LinkName("igGetMouseClickedCount")]
        private static extern int32 GetMouseClickedCountImpl(MouseButton button);
        public static int32 GetMouseClickedCount(MouseButton button) => GetMouseClickedCountImpl(button);
        
        [LinkName("igGetMouseCursor")]
        private static extern MouseCursor GetMouseCursorImpl();
        public static MouseCursor GetMouseCursor() => GetMouseCursorImpl();
        
        [LinkName("igGetMouseDragDelta")]
        private static extern Vec2 GetMouseDragDeltaImpl(Vec2* pOut, MouseButton button, float lock_threshold);
        public static Vec2 GetMouseDragDelta(MouseButton button = (MouseButton) 0, float lock_threshold = -1.0f)
        {
            Vec2 pOut = default;
            GetMouseDragDeltaImpl(&pOut, button, lock_threshold);
            return pOut;
        }
        
        [LinkName("igGetMousePos")]
        private static extern Vec2 GetMousePosImpl(Vec2* pOut);
        public static Vec2 GetMousePos()
        {
            Vec2 pOut = default;
            GetMousePosImpl(&pOut);
            return pOut;
        }
        
        [LinkName("igGetMousePosOnOpeningCurrentPopup")]
        private static extern Vec2 GetMousePosOnOpeningCurrentPopupImpl(Vec2* pOut);
        public static Vec2 GetMousePosOnOpeningCurrentPopup()
        {
            Vec2 pOut = default;
            GetMousePosOnOpeningCurrentPopupImpl(&pOut);
            return pOut;
        }
        
        [LinkName("igGetNavTweakPressedAmount")]
        private static extern float GetNavTweakPressedAmountImpl(Axis axis);
        public static float GetNavTweakPressedAmount(Axis axis) => GetNavTweakPressedAmountImpl(axis);
        
        [LinkName("igGetPlatformIO")]
        private static extern PlatformIO* GetPlatformIOImpl();
        #if IMGUI_USE_REF
        public static ref PlatformIO GetPlatformIO() { return ref *GetPlatformIOImpl(); }
        #else
        public static PlatformIO* GetPlatformIO() => GetPlatformIOImpl();
        #endif
        
        [LinkName("igGetPopupAllowedExtentRect")]
        private static extern Rect GetPopupAllowedExtentRectImpl(Rect* pOut, Window* window);
        public static Rect GetPopupAllowedExtentRect(Window* window)
        {
            Rect pOut = default;
            GetPopupAllowedExtentRectImpl(&pOut, window);
            return pOut;
        }
        
        [LinkName("igGetScrollMaxX")]
        private static extern float GetScrollMaxXImpl();
        public static float GetScrollMaxX() => GetScrollMaxXImpl();
        
        [LinkName("igGetScrollMaxY")]
        private static extern float GetScrollMaxYImpl();
        public static float GetScrollMaxY() => GetScrollMaxYImpl();
        
        [LinkName("igGetScrollX")]
        private static extern float GetScrollXImpl();
        public static float GetScrollX() => GetScrollXImpl();
        
        [LinkName("igGetScrollY")]
        private static extern float GetScrollYImpl();
        public static float GetScrollY() => GetScrollYImpl();
        
        [LinkName("igGetShortcutRoutingData")]
        private static extern KeyRoutingData* GetShortcutRoutingDataImpl(KeyChord key_chord);
        #if IMGUI_USE_REF
        public static ref KeyRoutingData GetShortcutRoutingData(KeyChord key_chord) { return ref *GetShortcutRoutingDataImpl(key_chord); }
        #else
        public static KeyRoutingData* GetShortcutRoutingData(KeyChord key_chord) => GetShortcutRoutingDataImpl(key_chord);
        #endif
        
        [LinkName("igGetStateStorage")]
        private static extern Storage* GetStateStorageImpl();
        #if IMGUI_USE_REF
        public static ref Storage GetStateStorage() { return ref *GetStateStorageImpl(); }
        #else
        public static Storage* GetStateStorage() => GetStateStorageImpl();
        #endif
        
        [LinkName("igGetStyle")]
        private static extern Style* GetStyleImpl();
        #if IMGUI_USE_REF
        public static ref Style GetStyle() { return ref *GetStyleImpl(); }
        #else
        public static Style* GetStyle() => GetStyleImpl();
        #endif
        
        [LinkName("igGetStyleColorName")]
        private static extern char* GetStyleColorNameImpl(Col idx);
        #if IMGUI_USE_REF
        public static ref char GetStyleColorName(Col idx) { return ref *GetStyleColorNameImpl(idx); }
        #else
        public static char* GetStyleColorName(Col idx) => GetStyleColorNameImpl(idx);
        #endif
        
        [LinkName("igGetStyleColorVec4")]
        private static extern Vec4* GetStyleColorVec4Impl(Col idx);
        #if IMGUI_USE_REF
        public static ref Vec4 GetStyleColorVec4(Col idx) { return ref *GetStyleColorVec4Impl(idx); }
        #else
        public static Vec4* GetStyleColorVec4(Col idx) => GetStyleColorVec4Impl(idx);
        #endif
        
        [LinkName("igGetStyleVarInfo")]
        private static extern DataVarInfo* GetStyleVarInfoImpl(StyleVar idx);
        #if IMGUI_USE_REF
        public static ref DataVarInfo GetStyleVarInfo(StyleVar idx) { return ref *GetStyleVarInfoImpl(idx); }
        #else
        public static DataVarInfo* GetStyleVarInfo(StyleVar idx) => GetStyleVarInfoImpl(idx);
        #endif
        
        [LinkName("igGetTextLineHeight")]
        private static extern float GetTextLineHeightImpl();
        public static float GetTextLineHeight() => GetTextLineHeightImpl();
        
        [LinkName("igGetTextLineHeightWithSpacing")]
        private static extern float GetTextLineHeightWithSpacingImpl();
        public static float GetTextLineHeightWithSpacing() => GetTextLineHeightWithSpacingImpl();
        
        [LinkName("igGetTime")]
        private static extern double GetTimeImpl();
        public static double GetTime() => GetTimeImpl();
        
        [LinkName("igGetTopMostAndVisiblePopupModal")]
        private static extern Window* GetTopMostAndVisiblePopupModalImpl();
        #if IMGUI_USE_REF
        public static ref Window GetTopMostAndVisiblePopupModal() { return ref *GetTopMostAndVisiblePopupModalImpl(); }
        #else
        public static Window* GetTopMostAndVisiblePopupModal() => GetTopMostAndVisiblePopupModalImpl();
        #endif
        
        [LinkName("igGetTopMostPopupModal")]
        private static extern Window* GetTopMostPopupModalImpl();
        #if IMGUI_USE_REF
        public static ref Window GetTopMostPopupModal() { return ref *GetTopMostPopupModalImpl(); }
        #else
        public static Window* GetTopMostPopupModal() => GetTopMostPopupModalImpl();
        #endif
        
        [LinkName("igGetTreeNodeToLabelSpacing")]
        private static extern float GetTreeNodeToLabelSpacingImpl();
        public static float GetTreeNodeToLabelSpacing() => GetTreeNodeToLabelSpacingImpl();
        
        [LinkName("igGetTypematicRepeatRate")]
        private static extern void GetTypematicRepeatRateImpl(InputFlags flags, float* repeat_delay, float* repeat_rate);
        public static void GetTypematicRepeatRate(InputFlags flags, float* repeat_delay, float* repeat_rate) => GetTypematicRepeatRateImpl(flags, repeat_delay, repeat_rate);
        
        [LinkName("igGetVersion")]
        private static extern char* GetVersionImpl();
        #if IMGUI_USE_REF
        public static ref char GetVersion() { return ref *GetVersionImpl(); }
        #else
        public static char* GetVersion() => GetVersionImpl();
        #endif
        
        [LinkName("igGetViewportPlatformMonitor")]
        private static extern PlatformMonitor* GetViewportPlatformMonitorImpl(Viewport* viewport);
        #if IMGUI_USE_REF
        public static ref PlatformMonitor GetViewportPlatformMonitor(Viewport* viewport) { return ref *GetViewportPlatformMonitorImpl(viewport); }
        #else
        public static PlatformMonitor* GetViewportPlatformMonitor(Viewport* viewport) => GetViewportPlatformMonitorImpl(viewport);
        #endif
        
        [LinkName("igGetWindowAlwaysWantOwnTabBar")]
        private static extern bool GetWindowAlwaysWantOwnTabBarImpl(Window* window);
        public static bool GetWindowAlwaysWantOwnTabBar(Window* window) => GetWindowAlwaysWantOwnTabBarImpl(window);
        
        [LinkName("igGetWindowContentRegionMax")]
        private static extern Vec2 GetWindowContentRegionMaxImpl(Vec2* pOut);
        public static Vec2 GetWindowContentRegionMax()
        {
            Vec2 pOut = default;
            GetWindowContentRegionMaxImpl(&pOut);
            return pOut;
        }
        
        [LinkName("igGetWindowContentRegionMin")]
        private static extern Vec2 GetWindowContentRegionMinImpl(Vec2* pOut);
        public static Vec2 GetWindowContentRegionMin()
        {
            Vec2 pOut = default;
            GetWindowContentRegionMinImpl(&pOut);
            return pOut;
        }
        
        [LinkName("igGetWindowDockID")]
        private static extern ID GetWindowDockIDImpl();
        public static ID GetWindowDockID() => GetWindowDockIDImpl();
        
        [LinkName("igGetWindowDockNode")]
        private static extern DockNode* GetWindowDockNodeImpl();
        #if IMGUI_USE_REF
        public static ref DockNode GetWindowDockNode() { return ref *GetWindowDockNodeImpl(); }
        #else
        public static DockNode* GetWindowDockNode() => GetWindowDockNodeImpl();
        #endif
        
        [LinkName("igGetWindowDpiScale")]
        private static extern float GetWindowDpiScaleImpl();
        public static float GetWindowDpiScale() => GetWindowDpiScaleImpl();
        
        [LinkName("igGetWindowDrawList")]
        private static extern DrawList* GetWindowDrawListImpl();
        #if IMGUI_USE_REF
        public static ref DrawList GetWindowDrawList() { return ref *GetWindowDrawListImpl(); }
        #else
        public static DrawList* GetWindowDrawList() => GetWindowDrawListImpl();
        #endif
        
        [LinkName("igGetWindowHeight")]
        private static extern float GetWindowHeightImpl();
        public static float GetWindowHeight() => GetWindowHeightImpl();
        
        [LinkName("igGetWindowPos")]
        private static extern Vec2 GetWindowPosImpl(Vec2* pOut);
        public static Vec2 GetWindowPos()
        {
            Vec2 pOut = default;
            GetWindowPosImpl(&pOut);
            return pOut;
        }
        
        [LinkName("igGetWindowResizeBorderID")]
        private static extern ID GetWindowResizeBorderIDImpl(Window* window, Dir dir);
        public static ID GetWindowResizeBorderID(Window* window, Dir dir) => GetWindowResizeBorderIDImpl(window, dir);
        
        [LinkName("igGetWindowResizeCornerID")]
        private static extern ID GetWindowResizeCornerIDImpl(Window* window, int32 n);
        public static ID GetWindowResizeCornerID(Window* window, int32 n) => GetWindowResizeCornerIDImpl(window, n);
        
        [LinkName("igGetWindowScrollbarID")]
        private static extern ID GetWindowScrollbarIDImpl(Window* window, Axis axis);
        public static ID GetWindowScrollbarID(Window* window, Axis axis) => GetWindowScrollbarIDImpl(window, axis);
        
        [LinkName("igGetWindowScrollbarRect")]
        private static extern Rect GetWindowScrollbarRectImpl(Rect* pOut, Window* window, Axis axis);
        public static Rect GetWindowScrollbarRect(Window* window, Axis axis)
        {
            Rect pOut = default;
            GetWindowScrollbarRectImpl(&pOut, window, axis);
            return pOut;
        }
        
        [LinkName("igGetWindowSize")]
        private static extern Vec2 GetWindowSizeImpl(Vec2* pOut);
        public static Vec2 GetWindowSize()
        {
            Vec2 pOut = default;
            GetWindowSizeImpl(&pOut);
            return pOut;
        }
        
        [LinkName("igGetWindowViewport")]
        private static extern Viewport* GetWindowViewportImpl();
        #if IMGUI_USE_REF
        public static ref Viewport GetWindowViewport() { return ref *GetWindowViewportImpl(); }
        #else
        public static Viewport* GetWindowViewport() => GetWindowViewportImpl();
        #endif
        
        [LinkName("igGetWindowWidth")]
        private static extern float GetWindowWidthImpl();
        public static float GetWindowWidth() => GetWindowWidthImpl();
        
        [LinkName("igImAbs_Int")]
        private static extern int32 ImAbsImpl(int32 x);
        public static int32 ImAbs(int32 x) => ImAbsImpl(x);
        
        [LinkName("igImAbs_Float")]
        private static extern float ImAbsImpl(float x);
        public static float ImAbs(float x) => ImAbsImpl(x);
        
        [LinkName("igImAbs_double")]
        private static extern double ImAbsImpl(double x);
        public static double ImAbs(double x) => ImAbsImpl(x);
        
        [LinkName("igImAlphaBlendColors")]
        private static extern U32 ImAlphaBlendColorsImpl(U32 col_a, U32 col_b);
        public static U32 ImAlphaBlendColors(U32 col_a, U32 col_b) => ImAlphaBlendColorsImpl(col_a, col_b);
        
        [LinkName("igImBezierCubicCalc")]
        private static extern Vec2 ImBezierCubicCalcImpl(Vec2* pOut, Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, float t);
        public static Vec2 ImBezierCubicCalc(Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, float t)
        {
            Vec2 pOut = default;
            ImBezierCubicCalcImpl(&pOut, p1, p2, p3, p4, t);
            return pOut;
        }
        
        [LinkName("igImBezierCubicClosestPoint")]
        private static extern Vec2 ImBezierCubicClosestPointImpl(Vec2* pOut, Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, Vec2 p, int32 num_segments);
        public static Vec2 ImBezierCubicClosestPoint(Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, Vec2 p, int32 num_segments)
        {
            Vec2 pOut = default;
            ImBezierCubicClosestPointImpl(&pOut, p1, p2, p3, p4, p, num_segments);
            return pOut;
        }
        
        [LinkName("igImBezierCubicClosestPointCasteljau")]
        private static extern Vec2 ImBezierCubicClosestPointCasteljauImpl(Vec2* pOut, Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, Vec2 p, float tess_tol);
        public static Vec2 ImBezierCubicClosestPointCasteljau(Vec2 p1, Vec2 p2, Vec2 p3, Vec2 p4, Vec2 p, float tess_tol)
        {
            Vec2 pOut = default;
            ImBezierCubicClosestPointCasteljauImpl(&pOut, p1, p2, p3, p4, p, tess_tol);
            return pOut;
        }
        
        [LinkName("igImBezierQuadraticCalc")]
        private static extern Vec2 ImBezierQuadraticCalcImpl(Vec2* pOut, Vec2 p1, Vec2 p2, Vec2 p3, float t);
        public static Vec2 ImBezierQuadraticCalc(Vec2 p1, Vec2 p2, Vec2 p3, float t)
        {
            Vec2 pOut = default;
            ImBezierQuadraticCalcImpl(&pOut, p1, p2, p3, t);
            return pOut;
        }
        
        [LinkName("igImBitArrayClearAllBits")]
        private static extern void ImBitArrayClearAllBitsImpl(U32* arr, int32 bitcount);
        public static void ImBitArrayClearAllBits(U32* arr, int32 bitcount) => ImBitArrayClearAllBitsImpl(arr, bitcount);
        
        [LinkName("igImBitArrayClearBit")]
        private static extern void ImBitArrayClearBitImpl(U32* arr, int32 n);
        public static void ImBitArrayClearBit(U32* arr, int32 n) => ImBitArrayClearBitImpl(arr, n);
        
        [LinkName("igImBitArrayGetStorageSizeInBytes")]
        private static extern size ImBitArrayGetStorageSizeInBytesImpl(int32 bitcount);
        public static size ImBitArrayGetStorageSizeInBytes(int32 bitcount) => ImBitArrayGetStorageSizeInBytesImpl(bitcount);
        
        [LinkName("igImBitArraySetBit")]
        private static extern void ImBitArraySetBitImpl(U32* arr, int32 n);
        public static void ImBitArraySetBit(U32* arr, int32 n) => ImBitArraySetBitImpl(arr, n);
        
        [LinkName("igImBitArraySetBitRange")]
        private static extern void ImBitArraySetBitRangeImpl(U32* arr, int32 n, int32 n2);
        public static void ImBitArraySetBitRange(U32* arr, int32 n, int32 n2) => ImBitArraySetBitRangeImpl(arr, n, n2);
        
        [LinkName("igImBitArrayTestBit")]
        private static extern bool ImBitArrayTestBitImpl(U32* arr, int32 n);
        public static bool ImBitArrayTestBit(U32* arr, int32 n) => ImBitArrayTestBitImpl(arr, n);
        
        [LinkName("igImCharIsBlankA")]
        private static extern bool ImCharIsBlankAImpl(char c);
        public static bool ImCharIsBlankA(char c) => ImCharIsBlankAImpl(c);
        
        [LinkName("igImCharIsBlankW")]
        private static extern bool ImCharIsBlankWImpl(uint32 c);
        public static bool ImCharIsBlankW(uint32 c) => ImCharIsBlankWImpl(c);
        
        [LinkName("igImClamp")]
        private static extern Vec2 ImClampImpl(Vec2* pOut, Vec2 v, Vec2 mn, Vec2 mx);
        public static Vec2 ImClamp(Vec2 v, Vec2 mn, Vec2 mx)
        {
            Vec2 pOut = default;
            ImClampImpl(&pOut, v, mn, mx);
            return pOut;
        }
        
        [LinkName("igImDot")]
        private static extern float ImDotImpl(Vec2 a, Vec2 b);
        public static float ImDot(Vec2 a, Vec2 b) => ImDotImpl(a, b);
        
        [LinkName("igImExponentialMovingAverage")]
        private static extern float ImExponentialMovingAverageImpl(float avg, float sample, int32 n);
        public static float ImExponentialMovingAverage(float avg, float sample, int32 n) => ImExponentialMovingAverageImpl(avg, sample, n);
        
        [LinkName("igImFileClose")]
        private static extern bool ImFileCloseImpl(FileHandle file);
        public static bool ImFileClose(FileHandle file) => ImFileCloseImpl(file);
        
        [LinkName("igImFileGetSize")]
        private static extern U64 ImFileGetSizeImpl(FileHandle file);
        public static U64 ImFileGetSize(FileHandle file) => ImFileGetSizeImpl(file);
        
        [LinkName("igImFileLoadToMemory")]
        private static extern void* ImFileLoadToMemoryImpl(char* filename, char* mode, size* out_file_size, int32 padding_bytes);
        #if IMGUI_USE_REF
        public static ref void ImFileLoadToMemory(char* filename, char* mode, size* out_file_size = null, int32 padding_bytes = (int32) 0) { return ref *ImFileLoadToMemoryImpl(filename, mode, out_file_size, padding_bytes); }
        #else
        public static void* ImFileLoadToMemory(char* filename, char* mode, size* out_file_size = null, int32 padding_bytes = (int32) 0) => ImFileLoadToMemoryImpl(filename, mode, out_file_size, padding_bytes);
        #endif
        
        [LinkName("igImFileOpen")]
        private static extern FileHandle ImFileOpenImpl(char* filename, char* mode);
        public static FileHandle ImFileOpen(char* filename, char* mode) => ImFileOpenImpl(filename, mode);
        
        [LinkName("igImFileRead")]
        private static extern U64 ImFileReadImpl(void* data, U64 size, U64 count, FileHandle file);
        public static U64 ImFileRead(void* data, U64 size, U64 count, FileHandle file) => ImFileReadImpl(data, size, count, file);
        
        [LinkName("igImFileWrite")]
        private static extern U64 ImFileWriteImpl(void* data, U64 size, U64 count, FileHandle file);
        public static U64 ImFileWrite(void* data, U64 size, U64 count, FileHandle file) => ImFileWriteImpl(data, size, count, file);
        
        [LinkName("igImFloor_Float")]
        private static extern float ImFloorImpl(float f);
        public static float ImFloor(float f) => ImFloorImpl(f);
        
        [LinkName("igImFloor_Vec2")]
        private static extern Vec2 ImFloorImpl(Vec2* pOut, Vec2 v);
        public static Vec2 ImFloor(Vec2 v)
        {
            Vec2 pOut = default;
            ImFloorImpl(&pOut, v);
            return pOut;
        }
        
        [LinkName("igImFloorSigned_Float")]
        private static extern float ImFloorSignedImpl(float f);
        public static float ImFloorSigned(float f) => ImFloorSignedImpl(f);
        
        [LinkName("igImFloorSigned_Vec2")]
        private static extern Vec2 ImFloorSignedImpl(Vec2* pOut, Vec2 v);
        public static Vec2 ImFloorSigned(Vec2 v)
        {
            Vec2 pOut = default;
            ImFloorSignedImpl(&pOut, v);
            return pOut;
        }
        
        [LinkName("igImFontAtlasBuildFinish")]
        private static extern void ImFontAtlasBuildFinishImpl(FontAtlas* atlas);
        public static void ImFontAtlasBuildFinish(FontAtlas* atlas) => ImFontAtlasBuildFinishImpl(atlas);
        
        [LinkName("igImFontAtlasBuildInit")]
        private static extern void ImFontAtlasBuildInitImpl(FontAtlas* atlas);
        public static void ImFontAtlasBuildInit(FontAtlas* atlas) => ImFontAtlasBuildInitImpl(atlas);
        
        [LinkName("igImFontAtlasBuildMultiplyCalcLookupTable")]
        private static extern void ImFontAtlasBuildMultiplyCalcLookupTableImpl(uchar[256] out_table, float in_multiply_factor);
        public static void ImFontAtlasBuildMultiplyCalcLookupTable(ref uchar[256] out_table, float in_multiply_factor) => ImFontAtlasBuildMultiplyCalcLookupTableImpl(out_table, in_multiply_factor);
        
        [LinkName("igImFontAtlasBuildMultiplyRectAlpha8")]
        private static extern void ImFontAtlasBuildMultiplyRectAlpha8Impl(uchar[256] table, uchar* pixels, int32 x, int32 y, int32 w, int32 h, int32 stride);
        public static void ImFontAtlasBuildMultiplyRectAlpha8(ref uchar[256] table, uchar* pixels, int32 x, int32 y, int32 w, int32 h, int32 stride) => ImFontAtlasBuildMultiplyRectAlpha8Impl(table, pixels, x, y, w, h, stride);
        
        [LinkName("igImFontAtlasBuildPackCustomRects")]
        private static extern void ImFontAtlasBuildPackCustomRectsImpl(FontAtlas* atlas, void* stbrp_context_opaque);
        public static void ImFontAtlasBuildPackCustomRects(FontAtlas* atlas, void* stbrp_context_opaque) => ImFontAtlasBuildPackCustomRectsImpl(atlas, stbrp_context_opaque);
        
        [LinkName("igImFontAtlasBuildRender32bppRectFromString")]
        private static extern void ImFontAtlasBuildRender32bppRectFromStringImpl(FontAtlas* atlas, int32 x, int32 y, int32 w, int32 h, char* in_str, char in_marker_char, uint32 in_marker_pixel_value);
        public static void ImFontAtlasBuildRender32bppRectFromString(FontAtlas* atlas, int32 x, int32 y, int32 w, int32 h, char* in_str, char in_marker_char, uint32 in_marker_pixel_value) => ImFontAtlasBuildRender32bppRectFromStringImpl(atlas, x, y, w, h, in_str, in_marker_char, in_marker_pixel_value);
        
        [LinkName("igImFontAtlasBuildRender8bppRectFromString")]
        private static extern void ImFontAtlasBuildRender8bppRectFromStringImpl(FontAtlas* atlas, int32 x, int32 y, int32 w, int32 h, char* in_str, char in_marker_char, uchar in_marker_pixel_value);
        public static void ImFontAtlasBuildRender8bppRectFromString(FontAtlas* atlas, int32 x, int32 y, int32 w, int32 h, char* in_str, char in_marker_char, uchar in_marker_pixel_value) => ImFontAtlasBuildRender8bppRectFromStringImpl(atlas, x, y, w, h, in_str, in_marker_char, in_marker_pixel_value);
        
        [LinkName("igImFontAtlasBuildSetupFont")]
        private static extern void ImFontAtlasBuildSetupFontImpl(FontAtlas* atlas, Font* font, FontConfig* font_config, float ascent, float descent);
        public static void ImFontAtlasBuildSetupFont(FontAtlas* atlas, Font* font, FontConfig* font_config, float ascent, float descent) => ImFontAtlasBuildSetupFontImpl(atlas, font, font_config, ascent, descent);
        
        [LinkName("igImFontAtlasGetBuilderForStbTruetype")]
        private static extern FontBuilderIO* ImFontAtlasGetBuilderForStbTruetypeImpl();
        #if IMGUI_USE_REF
        public static ref FontBuilderIO ImFontAtlasGetBuilderForStbTruetype() { return ref *ImFontAtlasGetBuilderForStbTruetypeImpl(); }
        #else
        public static FontBuilderIO* ImFontAtlasGetBuilderForStbTruetype() => ImFontAtlasGetBuilderForStbTruetypeImpl();
        #endif
        
        [LinkName("igImFormatString")]
        private static extern int32 ImFormatStringImpl(char* buf, size buf_size, char* fmt, ...);
        public static int32 ImFormatString(char* buf, size buf_size, char* fmt, params Object[] args) => ImFormatStringImpl(buf, buf_size, scope String()..AppendF(StringView(fmt), params args));
        
        [LinkName("igImFormatStringToTempBuffer")]
        private static extern void ImFormatStringToTempBufferImpl(char** out_buf, char** out_buf_end, char* fmt, ...);
        public static void ImFormatStringToTempBuffer(out char* out_buf, out char* out_buf_end, char* fmt, params Object[] args)
        {
            out_buf = ?;
            out_buf_end = ?;
        }
        
        [LinkName("igImGetDirQuadrantFromDelta")]
        private static extern Dir ImGetDirQuadrantFromDeltaImpl(float dx, float dy);
        public static Dir ImGetDirQuadrantFromDelta(float dx, float dy) => ImGetDirQuadrantFromDeltaImpl(dx, dy);
        
        [LinkName("igImHashData")]
        private static extern ID ImHashDataImpl(void* data, size data_size, ID seed);
        public static ID ImHashData(void* data, size data_size, ID seed = (ID) 0) => ImHashDataImpl(data, data_size, seed);
        
        [LinkName("igImHashStr")]
        private static extern ID ImHashStrImpl(char* data, size data_size, ID seed);
        public static ID ImHashStr(char* data, size data_size = (size) 0, ID seed = (ID) 0) => ImHashStrImpl(data, data_size, seed);
        
        [LinkName("igImInvLength")]
        private static extern float ImInvLengthImpl(Vec2 lhs, float fail_value);
        public static float ImInvLength(Vec2 lhs, float fail_value) => ImInvLengthImpl(lhs, fail_value);
        
        [LinkName("igImIsFloatAboveGuaranteedIntegerPrecision")]
        private static extern bool ImIsFloatAboveGuaranteedIntegerPrecisionImpl(float f);
        public static bool ImIsFloatAboveGuaranteedIntegerPrecision(float f) => ImIsFloatAboveGuaranteedIntegerPrecisionImpl(f);
        
        [LinkName("igImIsPowerOfTwo_Int")]
        private static extern bool ImIsPowerOfTwoImpl(int32 v);
        public static bool ImIsPowerOfTwo(int32 v) => ImIsPowerOfTwoImpl(v);
        
        [LinkName("igImIsPowerOfTwo_U64")]
        private static extern bool ImIsPowerOfTwoImpl(U64 v);
        public static bool ImIsPowerOfTwo(U64 v) => ImIsPowerOfTwoImpl(v);
        
        [LinkName("igImLengthSqr_Vec2")]
        private static extern float ImLengthSqrImpl(Vec2 lhs);
        public static float ImLengthSqr(Vec2 lhs) => ImLengthSqrImpl(lhs);
        
        [LinkName("igImLengthSqr_Vec4")]
        private static extern float ImLengthSqrImpl(Vec4 lhs);
        public static float ImLengthSqr(Vec4 lhs) => ImLengthSqrImpl(lhs);
        
        [LinkName("igImLerp_Vec2Float")]
        private static extern Vec2 ImLerpImpl(Vec2* pOut, Vec2 a, Vec2 b, float t);
        public static Vec2 ImLerp(Vec2 a, Vec2 b, float t)
        {
            Vec2 pOut = default;
            ImLerpImpl(&pOut, a, b, t);
            return pOut;
        }
        
        [LinkName("igImLerp_Vec2Vec2")]
        private static extern Vec2 ImLerpImpl(Vec2* pOut, Vec2 a, Vec2 b, Vec2 t);
        public static Vec2 ImLerp(Vec2 a, Vec2 b, Vec2 t)
        {
            Vec2 pOut = default;
            ImLerpImpl(&pOut, a, b, t);
            return pOut;
        }
        
        [LinkName("igImLerp_Vec4")]
        private static extern Vec4 ImLerpImpl(Vec4* pOut, Vec4 a, Vec4 b, float t);
        public static Vec4 ImLerp(Vec4 a, Vec4 b, float t)
        {
            Vec4 pOut = default;
            ImLerpImpl(&pOut, a, b, t);
            return pOut;
        }
        
        [LinkName("igImLineClosestPoint")]
        private static extern Vec2 ImLineClosestPointImpl(Vec2* pOut, Vec2 a, Vec2 b, Vec2 p);
        public static Vec2 ImLineClosestPoint(Vec2 a, Vec2 b, Vec2 p)
        {
            Vec2 pOut = default;
            ImLineClosestPointImpl(&pOut, a, b, p);
            return pOut;
        }
        
        [LinkName("igImLinearSweep")]
        private static extern float ImLinearSweepImpl(float current, float target, float speed);
        public static float ImLinearSweep(float current, float target, float speed) => ImLinearSweepImpl(current, target, speed);
        
        [LinkName("igImLog_Float")]
        private static extern float ImLogImpl(float x);
        public static float ImLog(float x) => ImLogImpl(x);
        
        [LinkName("igImLog_double")]
        private static extern double ImLogImpl(double x);
        public static double ImLog(double x) => ImLogImpl(x);
        
        [LinkName("igImMax")]
        private static extern Vec2 ImMaxImpl(Vec2* pOut, Vec2 lhs, Vec2 rhs);
        public static Vec2 ImMax(Vec2 lhs, Vec2 rhs)
        {
            Vec2 pOut = default;
            ImMaxImpl(&pOut, lhs, rhs);
            return pOut;
        }
        
        [LinkName("igImMin")]
        private static extern Vec2 ImMinImpl(Vec2* pOut, Vec2 lhs, Vec2 rhs);
        public static Vec2 ImMin(Vec2 lhs, Vec2 rhs)
        {
            Vec2 pOut = default;
            ImMinImpl(&pOut, lhs, rhs);
            return pOut;
        }
        
        [LinkName("igImModPositive")]
        private static extern int32 ImModPositiveImpl(int32 a, int32 b);
        public static int32 ImModPositive(int32 a, int32 b) => ImModPositiveImpl(a, b);
        
        [LinkName("igImMul")]
        private static extern Vec2 ImMulImpl(Vec2* pOut, Vec2 lhs, Vec2 rhs);
        public static Vec2 ImMul(Vec2 lhs, Vec2 rhs)
        {
            Vec2 pOut = default;
            ImMulImpl(&pOut, lhs, rhs);
            return pOut;
        }
        
        [LinkName("igImParseFormatFindEnd")]
        private static extern char* ImParseFormatFindEndImpl(char* format);
        #if IMGUI_USE_REF
        public static ref char ImParseFormatFindEnd(char* format) { return ref *ImParseFormatFindEndImpl(format); }
        #else
        public static char* ImParseFormatFindEnd(char* format) => ImParseFormatFindEndImpl(format);
        #endif
        
        [LinkName("igImParseFormatFindStart")]
        private static extern char* ImParseFormatFindStartImpl(char* format);
        #if IMGUI_USE_REF
        public static ref char ImParseFormatFindStart(char* format) { return ref *ImParseFormatFindStartImpl(format); }
        #else
        public static char* ImParseFormatFindStart(char* format) => ImParseFormatFindStartImpl(format);
        #endif
        
        [LinkName("igImParseFormatPrecision")]
        private static extern int32 ImParseFormatPrecisionImpl(char* format, int32 default_value);
        public static int32 ImParseFormatPrecision(char* format, int32 default_value) => ImParseFormatPrecisionImpl(format, default_value);
        
        [LinkName("igImParseFormatSanitizeForPrinting")]
        private static extern void ImParseFormatSanitizeForPrintingImpl(char* fmt_in, char* fmt_out, size fmt_out_size);
        public static void ImParseFormatSanitizeForPrinting(char* fmt_in, char* fmt_out, size fmt_out_size) => ImParseFormatSanitizeForPrintingImpl(fmt_in, fmt_out, fmt_out_size);
        
        [LinkName("igImParseFormatSanitizeForScanning")]
        private static extern char* ImParseFormatSanitizeForScanningImpl(char* fmt_in, char* fmt_out, size fmt_out_size);
        #if IMGUI_USE_REF
        public static ref char ImParseFormatSanitizeForScanning(char* fmt_in, char* fmt_out, size fmt_out_size) { return ref *ImParseFormatSanitizeForScanningImpl(fmt_in, fmt_out, fmt_out_size); }
        #else
        public static char* ImParseFormatSanitizeForScanning(char* fmt_in, char* fmt_out, size fmt_out_size) => ImParseFormatSanitizeForScanningImpl(fmt_in, fmt_out, fmt_out_size);
        #endif
        
        [LinkName("igImParseFormatTrimDecorations")]
        private static extern char* ImParseFormatTrimDecorationsImpl(char* format, char* buf, size buf_size);
        #if IMGUI_USE_REF
        public static ref char ImParseFormatTrimDecorations(char* format, char* buf, size buf_size) { return ref *ImParseFormatTrimDecorationsImpl(format, buf, buf_size); }
        #else
        public static char* ImParseFormatTrimDecorations(char* format, char* buf, size buf_size) => ImParseFormatTrimDecorationsImpl(format, buf, buf_size);
        #endif
        
        [LinkName("igImPow_Float")]
        private static extern float ImPowImpl(float x, float y);
        public static float ImPow(float x, float y) => ImPowImpl(x, y);
        
        [LinkName("igImPow_double")]
        private static extern double ImPowImpl(double x, double y);
        public static double ImPow(double x, double y) => ImPowImpl(x, y);
        
        [LinkName("igImQsort")]
        private static extern void ImQsortImpl(void* base_, size count, size size_of_element, function int(void* , void* ) compare_func);
        public static void ImQsort(void* base_, size count, size size_of_element, function int(void* , void* ) compare_func) => ImQsortImpl(base_, count, size_of_element, compare_func);
        
        [LinkName("igImRotate")]
        private static extern Vec2 ImRotateImpl(Vec2* pOut, Vec2 v, float cos_a, float sin_a);
        public static Vec2 ImRotate(Vec2 v, float cos_a, float sin_a)
        {
            Vec2 pOut = default;
            ImRotateImpl(&pOut, v, cos_a, sin_a);
            return pOut;
        }
        
        [LinkName("igImRsqrt_Float")]
        private static extern float ImRsqrtImpl(float x);
        public static float ImRsqrt(float x) => ImRsqrtImpl(x);
        
        [LinkName("igImRsqrt_double")]
        private static extern double ImRsqrtImpl(double x);
        public static double ImRsqrt(double x) => ImRsqrtImpl(x);
        
        [LinkName("igImSaturate")]
        private static extern float ImSaturateImpl(float f);
        public static float ImSaturate(float f) => ImSaturateImpl(f);
        
        [LinkName("igImSign_Float")]
        private static extern float ImSignImpl(float x);
        public static float ImSign(float x) => ImSignImpl(x);
        
        [LinkName("igImSign_double")]
        private static extern double ImSignImpl(double x);
        public static double ImSign(double x) => ImSignImpl(x);
        
        [LinkName("igImStrSkipBlank")]
        private static extern char* ImStrSkipBlankImpl(char* str);
        #if IMGUI_USE_REF
        public static ref char ImStrSkipBlank(char* str) { return ref *ImStrSkipBlankImpl(str); }
        #else
        public static char* ImStrSkipBlank(char* str) => ImStrSkipBlankImpl(str);
        #endif
        
        [LinkName("igImStrTrimBlanks")]
        private static extern void ImStrTrimBlanksImpl(char* str);
        public static void ImStrTrimBlanks(char* str) => ImStrTrimBlanksImpl(str);
        
        [LinkName("igImStrbolW")]
        private static extern Wchar* ImStrbolWImpl(Wchar* buf_mid_line, Wchar* buf_begin);
        #if IMGUI_USE_REF
        public static ref Wchar ImStrbolW(Wchar* buf_mid_line, Wchar* buf_begin) { return ref *ImStrbolWImpl(buf_mid_line, buf_begin); }
        #else
        public static Wchar* ImStrbolW(Wchar* buf_mid_line, Wchar* buf_begin) => ImStrbolWImpl(buf_mid_line, buf_begin);
        #endif
        
        [LinkName("igImStrchrRange")]
        private static extern char* ImStrchrRangeImpl(char* str_begin, char* str_end, char c);
        #if IMGUI_USE_REF
        public static ref char ImStrchrRange(char* str_begin, char* str_end, char c) { return ref *ImStrchrRangeImpl(str_begin, str_end, c); }
        #else
        public static char* ImStrchrRange(char* str_begin, char* str_end, char c) => ImStrchrRangeImpl(str_begin, str_end, c);
        #endif
        
        [LinkName("igImStrdup")]
        private static extern char* ImStrdupImpl(char* str);
        #if IMGUI_USE_REF
        public static ref char ImStrdup(char* str) { return ref *ImStrdupImpl(str); }
        #else
        public static char* ImStrdup(char* str) => ImStrdupImpl(str);
        #endif
        
        [LinkName("igImStrdupcpy")]
        private static extern char* ImStrdupcpyImpl(char* dst, size* p_dst_size, char* str);
        #if IMGUI_USE_REF
        public static ref char ImStrdupcpy(char* dst, size* p_dst_size, char* str) { return ref *ImStrdupcpyImpl(dst, p_dst_size, str); }
        #else
        public static char* ImStrdupcpy(char* dst, size* p_dst_size, char* str) => ImStrdupcpyImpl(dst, p_dst_size, str);
        #endif
        
        [LinkName("igImStreolRange")]
        private static extern char* ImStreolRangeImpl(char* str, char* str_end);
        #if IMGUI_USE_REF
        public static ref char ImStreolRange(char* str, char* str_end) { return ref *ImStreolRangeImpl(str, str_end); }
        #else
        public static char* ImStreolRange(char* str, char* str_end) => ImStreolRangeImpl(str, str_end);
        #endif
        
        [LinkName("igImStricmp")]
        private static extern int32 ImStricmpImpl(char* str1, char* str2);
        public static int32 ImStricmp(char* str1, char* str2) => ImStricmpImpl(str1, str2);
        
        [LinkName("igImStristr")]
        private static extern char* ImStristrImpl(char* haystack, char* haystack_end, char* needle, char* needle_end);
        #if IMGUI_USE_REF
        public static ref char ImStristr(char* haystack, char* haystack_end, char* needle, char* needle_end) { return ref *ImStristrImpl(haystack, haystack_end, needle, needle_end); }
        #else
        public static char* ImStristr(char* haystack, char* haystack_end, char* needle, char* needle_end) => ImStristrImpl(haystack, haystack_end, needle, needle_end);
        #endif
        
        [LinkName("igImStrlenW")]
        private static extern int32 ImStrlenWImpl(Wchar* str);
        public static int32 ImStrlenW(Wchar* str) => ImStrlenWImpl(str);
        
        [LinkName("igImStrncpy")]
        private static extern void ImStrncpyImpl(char* dst, char* src, size count);
        public static void ImStrncpy(char* dst, char* src, size count) => ImStrncpyImpl(dst, src, count);
        
        [LinkName("igImStrnicmp")]
        private static extern int32 ImStrnicmpImpl(char* str1, char* str2, size count);
        public static int32 ImStrnicmp(char* str1, char* str2, size count) => ImStrnicmpImpl(str1, str2, count);
        
        [LinkName("igImTextCharFromUtf8")]
        private static extern int32 ImTextCharFromUtf8Impl(uint32* out_char, char* in_text, char* in_text_end);
        public static int32 ImTextCharFromUtf8(out uint32 out_char, char* in_text, char* in_text_end)
        {
            out_char = ?;
            return ImTextCharFromUtf8Impl(&out_char, in_text, in_text_end);
        }
        
        [LinkName("igImTextCharToUtf8")]
        private static extern char* ImTextCharToUtf8Impl(char[5] out_buf, uint32 c);
        #if IMGUI_USE_REF
        public static ref char ImTextCharToUtf8(ref char[5] out_buf, uint32 c) { return ref *ImTextCharToUtf8Impl(out_buf, c); }
        #else
        public static char* ImTextCharToUtf8(ref char[5] out_buf, uint32 c) => ImTextCharToUtf8Impl(out_buf, c);
        #endif
        
        [LinkName("igImTextCountCharsFromUtf8")]
        private static extern int32 ImTextCountCharsFromUtf8Impl(char* in_text, char* in_text_end);
        public static int32 ImTextCountCharsFromUtf8(char* in_text, char* in_text_end) => ImTextCountCharsFromUtf8Impl(in_text, in_text_end);
        
        [LinkName("igImTextCountUtf8BytesFromChar")]
        private static extern int32 ImTextCountUtf8BytesFromCharImpl(char* in_text, char* in_text_end);
        public static int32 ImTextCountUtf8BytesFromChar(char* in_text, char* in_text_end) => ImTextCountUtf8BytesFromCharImpl(in_text, in_text_end);
        
        [LinkName("igImTextCountUtf8BytesFromStr")]
        private static extern int32 ImTextCountUtf8BytesFromStrImpl(Wchar* in_text, Wchar* in_text_end);
        public static int32 ImTextCountUtf8BytesFromStr(Wchar* in_text, Wchar* in_text_end) => ImTextCountUtf8BytesFromStrImpl(in_text, in_text_end);
        
        [LinkName("igImTextStrFromUtf8")]
        private static extern int32 ImTextStrFromUtf8Impl(Wchar* out_buf, int32 out_buf_size, char* in_text, char* in_text_end, char** in_remaining);
        public static int32 ImTextStrFromUtf8(out Wchar out_buf, int32 out_buf_size, char* in_text, char* in_text_end, char** in_remaining = null)
        {
            out_buf = ?;
            return ImTextStrFromUtf8Impl(&out_buf, out_buf_size, in_text, in_text_end, in_remaining);
        }
        
        [LinkName("igImTextStrToUtf8")]
        private static extern int32 ImTextStrToUtf8Impl(char* out_buf, int32 out_buf_size, Wchar* in_text, Wchar* in_text_end);
        public static int32 ImTextStrToUtf8(out char out_buf, int32 out_buf_size, Wchar* in_text, Wchar* in_text_end)
        {
            out_buf = ?;
            return ImTextStrToUtf8Impl(&out_buf, out_buf_size, in_text, in_text_end);
        }
        
        [LinkName("igImToUpper")]
        private static extern char ImToUpperImpl(char c);
        public static char ImToUpper(char c) => ImToUpperImpl(c);
        
        [LinkName("igImTriangleArea")]
        private static extern float ImTriangleAreaImpl(Vec2 a, Vec2 b, Vec2 c);
        public static float ImTriangleArea(Vec2 a, Vec2 b, Vec2 c) => ImTriangleAreaImpl(a, b, c);
        
        [LinkName("igImTriangleBarycentricCoords")]
        private static extern void ImTriangleBarycentricCoordsImpl(Vec2 a, Vec2 b, Vec2 c, Vec2 p, float* out_u, float* out_v, float* out_w);
        public static void ImTriangleBarycentricCoords(Vec2 a, Vec2 b, Vec2 c, Vec2 p, out float out_u, out float out_v, out float out_w)
        {
            out_u = ?;
            out_v = ?;
            out_w = ?;
        }
        
        [LinkName("igImTriangleClosestPoint")]
        private static extern Vec2 ImTriangleClosestPointImpl(Vec2* pOut, Vec2 a, Vec2 b, Vec2 c, Vec2 p);
        public static Vec2 ImTriangleClosestPoint(Vec2 a, Vec2 b, Vec2 c, Vec2 p)
        {
            Vec2 pOut = default;
            ImTriangleClosestPointImpl(&pOut, a, b, c, p);
            return pOut;
        }
        
        [LinkName("igImTriangleContainsPoint")]
        private static extern bool ImTriangleContainsPointImpl(Vec2 a, Vec2 b, Vec2 c, Vec2 p);
        public static bool ImTriangleContainsPoint(Vec2 a, Vec2 b, Vec2 c, Vec2 p) => ImTriangleContainsPointImpl(a, b, c, p);
        
        [LinkName("igImUpperPowerOfTwo")]
        private static extern int32 ImUpperPowerOfTwoImpl(int32 v);
        public static int32 ImUpperPowerOfTwo(int32 v) => ImUpperPowerOfTwoImpl(v);
        
        [LinkName("igImage")]
        private static extern void ImageImpl(TextureID user_texture_id, Vec2 size, Vec2 uv0, Vec2 uv1, Vec4 tint_col, Vec4 border_col);
        public static void Image(TextureID user_texture_id, Vec2 size, Vec2 uv0 = Vec2.Zero, Vec2 uv1 = Vec2.Ones, Vec4 tint_col = Vec4.Ones, Vec4 border_col = Vec4.Zero) => ImageImpl(user_texture_id, size, uv0, uv1, tint_col, border_col);
        
        [LinkName("igImageButton")]
        private static extern bool ImageButtonImpl(char* str_id, TextureID user_texture_id, Vec2 size, Vec2 uv0, Vec2 uv1, Vec4 bg_col, Vec4 tint_col);
        public static bool ImageButton(char* str_id, TextureID user_texture_id, Vec2 size, Vec2 uv0 = Vec2.Zero, Vec2 uv1 = Vec2.Ones, Vec4 bg_col = Vec4.Zero, Vec4 tint_col = Vec4.Ones) => ImageButtonImpl(str_id, user_texture_id, size, uv0, uv1, bg_col, tint_col);
        
        [LinkName("igImageButtonEx")]
        private static extern bool ImageButtonExImpl(ID id, TextureID texture_id, Vec2 size, Vec2 uv0, Vec2 uv1, Vec4 bg_col, Vec4 tint_col, ButtonFlags flags);
        public static bool ImageButtonEx(ID id, TextureID texture_id, Vec2 size, Vec2 uv0, Vec2 uv1, Vec4 bg_col, Vec4 tint_col, ButtonFlags flags = (ButtonFlags) 0) => ImageButtonExImpl(id, texture_id, size, uv0, uv1, bg_col, tint_col, flags);
        
        [LinkName("igIndent")]
        private static extern void IndentImpl(float indent_w);
        public static void Indent(float indent_w = (float) 0.0f) => IndentImpl(indent_w);
        
        [LinkName("igInitialize")]
        private static extern void InitializeImpl();
        public static void Initialize() => InitializeImpl();
        
        [LinkName("igInputDouble")]
        private static extern bool InputDoubleImpl(char* label, double* v, double step, double step_fast, char* format, InputTextFlags flags);
        public static bool InputDouble(char* label, double* v, double step = (double) 0.0, double step_fast = (double) 0.0, char* format = "%.6f", InputTextFlags flags = (InputTextFlags) 0) => InputDoubleImpl(label, v, step, step_fast, format, flags);
        
        [LinkName("igInputFloat")]
        private static extern bool InputFloatImpl(char* label, float* v, float step, float step_fast, char* format, InputTextFlags flags);
        public static bool InputFloat(char* label, float* v, float step = (float) 0.0f, float step_fast = (float) 0.0f, char* format = "%.3f", InputTextFlags flags = (InputTextFlags) 0) => InputFloatImpl(label, v, step, step_fast, format, flags);
        
        [LinkName("igInputFloat2")]
        private static extern bool InputFloat2Impl(char* label, float[2] v, char* format, InputTextFlags flags);
        public static bool InputFloat2(char* label, ref float[2] v, char* format = "%.3f", InputTextFlags flags = (InputTextFlags) 0) => InputFloat2Impl(label, v, format, flags);
        
        [LinkName("igInputFloat3")]
        private static extern bool InputFloat3Impl(char* label, float[3] v, char* format, InputTextFlags flags);
        public static bool InputFloat3(char* label, ref float[3] v, char* format = "%.3f", InputTextFlags flags = (InputTextFlags) 0) => InputFloat3Impl(label, v, format, flags);
        
        [LinkName("igInputFloat4")]
        private static extern bool InputFloat4Impl(char* label, float[4] v, char* format, InputTextFlags flags);
        public static bool InputFloat4(char* label, ref float[4] v, char* format = "%.3f", InputTextFlags flags = (InputTextFlags) 0) => InputFloat4Impl(label, v, format, flags);
        
        [LinkName("igInputInt")]
        private static extern bool InputIntImpl(char* label, int32* v, int32 step, int32 step_fast, InputTextFlags flags);
        public static bool InputInt(char* label, int32* v, int32 step = (int32) 1, int32 step_fast = (int32) 100, InputTextFlags flags = (InputTextFlags) 0) => InputIntImpl(label, v, step, step_fast, flags);
        
        [LinkName("igInputInt2")]
        private static extern bool InputInt2Impl(char* label, int32[2] v, InputTextFlags flags);
        public static bool InputInt2(char* label, ref int32[2] v, InputTextFlags flags = (InputTextFlags) 0) => InputInt2Impl(label, v, flags);
        
        [LinkName("igInputInt3")]
        private static extern bool InputInt3Impl(char* label, int32[3] v, InputTextFlags flags);
        public static bool InputInt3(char* label, ref int32[3] v, InputTextFlags flags = (InputTextFlags) 0) => InputInt3Impl(label, v, flags);
        
        [LinkName("igInputInt4")]
        private static extern bool InputInt4Impl(char* label, int32[4] v, InputTextFlags flags);
        public static bool InputInt4(char* label, ref int32[4] v, InputTextFlags flags = (InputTextFlags) 0) => InputInt4Impl(label, v, flags);
        
        [LinkName("igInputScalar")]
        private static extern bool InputScalarImpl(char* label, DataType data_type, void* p_data, void* p_step, void* p_step_fast, char* format, InputTextFlags flags);
        public static bool InputScalar(char* label, DataType data_type, void* p_data, void* p_step = null, void* p_step_fast = null, char* format = null, InputTextFlags flags = (InputTextFlags) 0) => InputScalarImpl(label, data_type, p_data, p_step, p_step_fast, format, flags);
        
        [LinkName("igInputScalarN")]
        private static extern bool InputScalarNImpl(char* label, DataType data_type, void* p_data, int32 components, void* p_step, void* p_step_fast, char* format, InputTextFlags flags);
        public static bool InputScalarN(char* label, DataType data_type, void* p_data, int32 components, void* p_step = null, void* p_step_fast = null, char* format = null, InputTextFlags flags = (InputTextFlags) 0) => InputScalarNImpl(label, data_type, p_data, components, p_step, p_step_fast, format, flags);
        
        [LinkName("igInputText")]
        private static extern bool InputTextImpl(char* label, char* buf, size buf_size, InputTextFlags flags, InputTextCallback callback, void* user_data);
        public static bool InputText(char* label, char* buf, size buf_size, InputTextFlags flags = (InputTextFlags) 0, InputTextCallback callback = null, void* user_data = null) => InputTextImpl(label, buf, buf_size, flags, callback, user_data);
        
        [LinkName("igInputTextDeactivateHook")]
        private static extern void InputTextDeactivateHookImpl(ID id);
        public static void InputTextDeactivateHook(ID id) => InputTextDeactivateHookImpl(id);
        
        [LinkName("igInputTextEx")]
        private static extern bool InputTextExImpl(char* label, char* hint, char* buf, int32 buf_size, Vec2 size_arg, InputTextFlags flags, InputTextCallback callback, void* user_data);
        public static bool InputTextEx(char* label, char* hint, char* buf, int32 buf_size, Vec2 size_arg, InputTextFlags flags, InputTextCallback callback = null, void* user_data = null) => InputTextExImpl(label, hint, buf, buf_size, size_arg, flags, callback, user_data);
        
        [LinkName("igInputTextMultiline")]
        private static extern bool InputTextMultilineImpl(char* label, char* buf, size buf_size, Vec2 size, InputTextFlags flags, InputTextCallback callback, void* user_data);
        public static bool InputTextMultiline(char* label, char* buf, size buf_size, Vec2 size = Vec2.Zero, InputTextFlags flags = (InputTextFlags) 0, InputTextCallback callback = null, void* user_data = null) => InputTextMultilineImpl(label, buf, buf_size, size, flags, callback, user_data);
        
        [LinkName("igInputTextWithHint")]
        private static extern bool InputTextWithHintImpl(char* label, char* hint, char* buf, size buf_size, InputTextFlags flags, InputTextCallback callback, void* user_data);
        public static bool InputTextWithHint(char* label, char* hint, char* buf, size buf_size, InputTextFlags flags = (InputTextFlags) 0, InputTextCallback callback = null, void* user_data = null) => InputTextWithHintImpl(label, hint, buf, buf_size, flags, callback, user_data);
        
        [LinkName("igInvisibleButton")]
        private static extern bool InvisibleButtonImpl(char* str_id, Vec2 size, ButtonFlags flags);
        public static bool InvisibleButton(char* str_id, Vec2 size, ButtonFlags flags = (ButtonFlags) 0) => InvisibleButtonImpl(str_id, size, flags);
        
        [LinkName("igIsActiveIdUsingNavDir")]
        private static extern bool IsActiveIdUsingNavDirImpl(Dir dir);
        public static bool IsActiveIdUsingNavDir(Dir dir) => IsActiveIdUsingNavDirImpl(dir);
        
        [LinkName("igIsAliasKey")]
        private static extern bool IsAliasKeyImpl(Key key);
        public static bool IsAliasKey(Key key) => IsAliasKeyImpl(key);
        
        [LinkName("igIsAnyItemActive")]
        private static extern bool IsAnyItemActiveImpl();
        public static bool IsAnyItemActive() => IsAnyItemActiveImpl();
        
        [LinkName("igIsAnyItemFocused")]
        private static extern bool IsAnyItemFocusedImpl();
        public static bool IsAnyItemFocused() => IsAnyItemFocusedImpl();
        
        [LinkName("igIsAnyItemHovered")]
        private static extern bool IsAnyItemHoveredImpl();
        public static bool IsAnyItemHovered() => IsAnyItemHoveredImpl();
        
        [LinkName("igIsAnyMouseDown")]
        private static extern bool IsAnyMouseDownImpl();
        public static bool IsAnyMouseDown() => IsAnyMouseDownImpl();
        
        [LinkName("igIsClippedEx")]
        private static extern bool IsClippedExImpl(Rect bb, ID id);
        public static bool IsClippedEx(Rect bb, ID id) => IsClippedExImpl(bb, id);
        
        [LinkName("igIsDragDropActive")]
        private static extern bool IsDragDropActiveImpl();
        public static bool IsDragDropActive() => IsDragDropActiveImpl();
        
        [LinkName("igIsDragDropPayloadBeingAccepted")]
        private static extern bool IsDragDropPayloadBeingAcceptedImpl();
        public static bool IsDragDropPayloadBeingAccepted() => IsDragDropPayloadBeingAcceptedImpl();
        
        [LinkName("igIsGamepadKey")]
        private static extern bool IsGamepadKeyImpl(Key key);
        public static bool IsGamepadKey(Key key) => IsGamepadKeyImpl(key);
        
        [LinkName("igIsItemActivated")]
        private static extern bool IsItemActivatedImpl();
        public static bool IsItemActivated() => IsItemActivatedImpl();
        
        [LinkName("igIsItemActive")]
        private static extern bool IsItemActiveImpl();
        public static bool IsItemActive() => IsItemActiveImpl();
        
        [LinkName("igIsItemClicked")]
        private static extern bool IsItemClickedImpl(MouseButton mouse_button);
        public static bool IsItemClicked(MouseButton mouse_button = (MouseButton) 0) => IsItemClickedImpl(mouse_button);
        
        [LinkName("igIsItemDeactivated")]
        private static extern bool IsItemDeactivatedImpl();
        public static bool IsItemDeactivated() => IsItemDeactivatedImpl();
        
        [LinkName("igIsItemDeactivatedAfterEdit")]
        private static extern bool IsItemDeactivatedAfterEditImpl();
        public static bool IsItemDeactivatedAfterEdit() => IsItemDeactivatedAfterEditImpl();
        
        [LinkName("igIsItemEdited")]
        private static extern bool IsItemEditedImpl();
        public static bool IsItemEdited() => IsItemEditedImpl();
        
        [LinkName("igIsItemFocused")]
        private static extern bool IsItemFocusedImpl();
        public static bool IsItemFocused() => IsItemFocusedImpl();
        
        [LinkName("igIsItemHovered")]
        private static extern bool IsItemHoveredImpl(HoveredFlags flags);
        public static bool IsItemHovered(HoveredFlags flags = (HoveredFlags) 0) => IsItemHoveredImpl(flags);
        
        [LinkName("igIsItemToggledOpen")]
        private static extern bool IsItemToggledOpenImpl();
        public static bool IsItemToggledOpen() => IsItemToggledOpenImpl();
        
        [LinkName("igIsItemToggledSelection")]
        private static extern bool IsItemToggledSelectionImpl();
        public static bool IsItemToggledSelection() => IsItemToggledSelectionImpl();
        
        [LinkName("igIsItemVisible")]
        private static extern bool IsItemVisibleImpl();
        public static bool IsItemVisible() => IsItemVisibleImpl();
        
        [LinkName("igIsKeyDown_Nil")]
        private static extern bool IsKeyDownImpl(Key key);
        public static bool IsKeyDown(Key key) => IsKeyDownImpl(key);
        
        [LinkName("igIsKeyDown_ID")]
        private static extern bool IsKeyDownImpl(Key key, ID owner_id);
        public static bool IsKeyDown(Key key, ID owner_id) => IsKeyDownImpl(key, owner_id);
        
        [LinkName("igIsKeyPressed_Bool")]
        private static extern bool IsKeyPressedImpl(Key key, bool repeat_);
        public static bool IsKeyPressed(Key key, bool repeat_ = true) => IsKeyPressedImpl(key, repeat_);
        
        [LinkName("igIsKeyPressed_ID")]
        private static extern bool IsKeyPressedImpl(Key key, ID owner_id, InputFlags flags);
        public static bool IsKeyPressed(Key key, ID owner_id, InputFlags flags = (InputFlags) 0) => IsKeyPressedImpl(key, owner_id, flags);
        
        [LinkName("igIsKeyPressedMap")]
        private static extern bool IsKeyPressedMapImpl(Key key, bool repeat_);
        public static bool IsKeyPressedMap(Key key, bool repeat_ = true) => IsKeyPressedMapImpl(key, repeat_);
        
        [LinkName("igIsKeyReleased_Nil")]
        private static extern bool IsKeyReleasedImpl(Key key);
        public static bool IsKeyReleased(Key key) => IsKeyReleasedImpl(key);
        
        [LinkName("igIsKeyReleased_ID")]
        private static extern bool IsKeyReleasedImpl(Key key, ID owner_id);
        public static bool IsKeyReleased(Key key, ID owner_id) => IsKeyReleasedImpl(key, owner_id);
        
        [LinkName("igIsKeyboardKey")]
        private static extern bool IsKeyboardKeyImpl(Key key);
        public static bool IsKeyboardKey(Key key) => IsKeyboardKeyImpl(key);
        
        [LinkName("igIsLegacyKey")]
        private static extern bool IsLegacyKeyImpl(Key key);
        public static bool IsLegacyKey(Key key) => IsLegacyKeyImpl(key);
        
        [LinkName("igIsMouseClicked_Bool")]
        private static extern bool IsMouseClickedImpl(MouseButton button, bool repeat_);
        public static bool IsMouseClicked(MouseButton button, bool repeat_ = false) => IsMouseClickedImpl(button, repeat_);
        
        [LinkName("igIsMouseClicked_ID")]
        private static extern bool IsMouseClickedImpl(MouseButton button, ID owner_id, InputFlags flags);
        public static bool IsMouseClicked(MouseButton button, ID owner_id, InputFlags flags = (InputFlags) 0) => IsMouseClickedImpl(button, owner_id, flags);
        
        [LinkName("igIsMouseDoubleClicked")]
        private static extern bool IsMouseDoubleClickedImpl(MouseButton button);
        public static bool IsMouseDoubleClicked(MouseButton button) => IsMouseDoubleClickedImpl(button);
        
        [LinkName("igIsMouseDown_Nil")]
        private static extern bool IsMouseDownImpl(MouseButton button);
        public static bool IsMouseDown(MouseButton button) => IsMouseDownImpl(button);
        
        [LinkName("igIsMouseDown_ID")]
        private static extern bool IsMouseDownImpl(MouseButton button, ID owner_id);
        public static bool IsMouseDown(MouseButton button, ID owner_id) => IsMouseDownImpl(button, owner_id);
        
        [LinkName("igIsMouseDragPastThreshold")]
        private static extern bool IsMouseDragPastThresholdImpl(MouseButton button, float lock_threshold);
        public static bool IsMouseDragPastThreshold(MouseButton button, float lock_threshold = -1.0f) => IsMouseDragPastThresholdImpl(button, lock_threshold);
        
        [LinkName("igIsMouseDragging")]
        private static extern bool IsMouseDraggingImpl(MouseButton button, float lock_threshold);
        public static bool IsMouseDragging(MouseButton button, float lock_threshold = -1.0f) => IsMouseDraggingImpl(button, lock_threshold);
        
        [LinkName("igIsMouseHoveringRect")]
        private static extern bool IsMouseHoveringRectImpl(Vec2 r_min, Vec2 r_max, bool clip);
        public static bool IsMouseHoveringRect(Vec2 r_min, Vec2 r_max, bool clip = true) => IsMouseHoveringRectImpl(r_min, r_max, clip);
        
        [LinkName("igIsMouseKey")]
        private static extern bool IsMouseKeyImpl(Key key);
        public static bool IsMouseKey(Key key) => IsMouseKeyImpl(key);
        
        [LinkName("igIsMousePosValid")]
        private static extern bool IsMousePosValidImpl(Vec2* mouse_pos);
        public static bool IsMousePosValid(Vec2* mouse_pos = null) => IsMousePosValidImpl(mouse_pos);
        
        [LinkName("igIsMouseReleased_Nil")]
        private static extern bool IsMouseReleasedImpl(MouseButton button);
        public static bool IsMouseReleased(MouseButton button) => IsMouseReleasedImpl(button);
        
        [LinkName("igIsMouseReleased_ID")]
        private static extern bool IsMouseReleasedImpl(MouseButton button, ID owner_id);
        public static bool IsMouseReleased(MouseButton button, ID owner_id) => IsMouseReleasedImpl(button, owner_id);
        
        [LinkName("igIsNamedKey")]
        private static extern bool IsNamedKeyImpl(Key key);
        public static bool IsNamedKey(Key key) => IsNamedKeyImpl(key);
        
        [LinkName("igIsNamedKeyOrModKey")]
        private static extern bool IsNamedKeyOrModKeyImpl(Key key);
        public static bool IsNamedKeyOrModKey(Key key) => IsNamedKeyOrModKeyImpl(key);
        
        [LinkName("igIsPopupOpen_Str")]
        private static extern bool IsPopupOpenImpl(char* str_id, PopupFlags flags);
        public static bool IsPopupOpen(char* str_id, PopupFlags flags = (PopupFlags) 0) => IsPopupOpenImpl(str_id, flags);
        
        [LinkName("igIsPopupOpen_ID")]
        private static extern bool IsPopupOpenImpl(ID id, PopupFlags popup_flags);
        public static bool IsPopupOpen(ID id, PopupFlags popup_flags) => IsPopupOpenImpl(id, popup_flags);
        
        [LinkName("igIsRectVisible_Nil")]
        private static extern bool IsRectVisibleImpl(Vec2 size);
        public static bool IsRectVisible(Vec2 size) => IsRectVisibleImpl(size);
        
        [LinkName("igIsRectVisible_Vec2")]
        private static extern bool IsRectVisibleImpl(Vec2 rect_min, Vec2 rect_max);
        public static bool IsRectVisible(Vec2 rect_min, Vec2 rect_max) => IsRectVisibleImpl(rect_min, rect_max);
        
        [LinkName("igIsWindowAbove")]
        private static extern bool IsWindowAboveImpl(Window* potential_above, Window* potential_below);
        public static bool IsWindowAbove(Window* potential_above, Window* potential_below) => IsWindowAboveImpl(potential_above, potential_below);
        
        [LinkName("igIsWindowAppearing")]
        private static extern bool IsWindowAppearingImpl();
        public static bool IsWindowAppearing() => IsWindowAppearingImpl();
        
        [LinkName("igIsWindowChildOf")]
        private static extern bool IsWindowChildOfImpl(Window* window, Window* potential_parent, bool popup_hierarchy, bool dock_hierarchy);
        public static bool IsWindowChildOf(Window* window, Window* potential_parent, bool popup_hierarchy, bool dock_hierarchy) => IsWindowChildOfImpl(window, potential_parent, popup_hierarchy, dock_hierarchy);
        
        [LinkName("igIsWindowCollapsed")]
        private static extern bool IsWindowCollapsedImpl();
        public static bool IsWindowCollapsed() => IsWindowCollapsedImpl();
        
        [LinkName("igIsWindowContentHoverable")]
        private static extern bool IsWindowContentHoverableImpl(Window* window, HoveredFlags flags);
        public static bool IsWindowContentHoverable(Window* window, HoveredFlags flags = (HoveredFlags) 0) => IsWindowContentHoverableImpl(window, flags);
        
        [LinkName("igIsWindowDocked")]
        private static extern bool IsWindowDockedImpl();
        public static bool IsWindowDocked() => IsWindowDockedImpl();
        
        [LinkName("igIsWindowFocused")]
        private static extern bool IsWindowFocusedImpl(FocusedFlags flags);
        public static bool IsWindowFocused(FocusedFlags flags = (FocusedFlags) 0) => IsWindowFocusedImpl(flags);
        
        [LinkName("igIsWindowHovered")]
        private static extern bool IsWindowHoveredImpl(HoveredFlags flags);
        public static bool IsWindowHovered(HoveredFlags flags = (HoveredFlags) 0) => IsWindowHoveredImpl(flags);
        
        [LinkName("igIsWindowNavFocusable")]
        private static extern bool IsWindowNavFocusableImpl(Window* window);
        public static bool IsWindowNavFocusable(Window* window) => IsWindowNavFocusableImpl(window);
        
        [LinkName("igIsWindowWithinBeginStackOf")]
        private static extern bool IsWindowWithinBeginStackOfImpl(Window* window, Window* potential_parent);
        public static bool IsWindowWithinBeginStackOf(Window* window, Window* potential_parent) => IsWindowWithinBeginStackOfImpl(window, potential_parent);
        
        [LinkName("igItemAdd")]
        private static extern bool ItemAddImpl(Rect bb, ID id, Rect* nav_bb, ItemFlags extra_flags);
        public static bool ItemAdd(Rect bb, ID id, Rect* nav_bb = null, ItemFlags extra_flags = (ItemFlags) 0) => ItemAddImpl(bb, id, nav_bb, extra_flags);
        
        [LinkName("igItemHoverable")]
        private static extern bool ItemHoverableImpl(Rect bb, ID id);
        public static bool ItemHoverable(Rect bb, ID id) => ItemHoverableImpl(bb, id);
        
        [LinkName("igItemSize_Vec2")]
        private static extern void ItemSizeImpl(Vec2 size, float text_baseline_y);
        public static void ItemSize(Vec2 size, float text_baseline_y = -1.0f) => ItemSizeImpl(size, text_baseline_y);
        
        [LinkName("igItemSize_Rect")]
        private static extern void ItemSizeImpl(Rect bb, float text_baseline_y);
        public static void ItemSize(Rect bb, float text_baseline_y = -1.0f) => ItemSizeImpl(bb, text_baseline_y);
        
        [LinkName("igKeepAliveID")]
        private static extern void KeepAliveIDImpl(ID id);
        public static void KeepAliveID(ID id) => KeepAliveIDImpl(id);
        
        [LinkName("igLabelText")]
        private static extern void LabelTextImpl(char* label, char* fmt, ...);
        public static void LabelText(char* label, char* fmt, params Object[] args) => LabelTextImpl(label, scope String()..AppendF(StringView(fmt), params args));
        
        [LinkName("igListBox_Str_arr")]
        private static extern bool ListBoxImpl(char* label, int32* current_item, char** items, int32 items_count, int32 height_in_items);
        public static bool ListBox(char* label, int32* current_item, char** items, int32 items_count, int32 height_in_items = -1) => ListBoxImpl(label, current_item, items, items_count, height_in_items);
        
        [LinkName("igListBox_FnBoolPtr")]
        private static extern bool ListBoxImpl(char* label, int32* current_item, function bool(void* data, int32 idx, char** outext) items_getter, void* data, int32 items_count, int32 height_in_items);
        public static bool ListBox(char* label, int32* current_item, function bool(void* data, int32 idx, char** outext) items_getter, void* data, int32 items_count, int32 height_in_items = -1) => ListBoxImpl(label, current_item, items_getter, data, items_count, height_in_items);
        
        [LinkName("igLoadIniSettingsFromDisk")]
        private static extern void LoadIniSettingsFromDiskImpl(char* ini_filename);
        public static void LoadIniSettingsFromDisk(char* ini_filename) => LoadIniSettingsFromDiskImpl(ini_filename);
        
        [LinkName("igLoadIniSettingsFromMemory")]
        private static extern void LoadIniSettingsFromMemoryImpl(char* ini_data, size ini_size);
        public static void LoadIniSettingsFromMemory(char* ini_data, size ini_size = (size) 0) => LoadIniSettingsFromMemoryImpl(ini_data, ini_size);
        
        [LinkName("igLocalizeGetMsg")]
        private static extern char* LocalizeGetMsgImpl(LocKey key);
        #if IMGUI_USE_REF
        public static ref char LocalizeGetMsg(LocKey key) { return ref *LocalizeGetMsgImpl(key); }
        #else
        public static char* LocalizeGetMsg(LocKey key) => LocalizeGetMsgImpl(key);
        #endif
        
        [LinkName("igLocalizeRegisterEntries")]
        private static extern void LocalizeRegisterEntriesImpl(LocEntry* entries, int32 count);
        public static void LocalizeRegisterEntries(LocEntry* entries, int32 count) => LocalizeRegisterEntriesImpl(entries, count);
        
        [LinkName("igLogBegin")]
        private static extern void LogBeginImpl(LogType type, int32 auto_open_depth);
        public static void LogBegin(LogType type, int32 auto_open_depth) => LogBeginImpl(type, auto_open_depth);
        
        [LinkName("igLogButtons")]
        private static extern void LogButtonsImpl();
        public static void LogButtons() => LogButtonsImpl();
        
        [LinkName("igLogFinish")]
        private static extern void LogFinishImpl();
        public static void LogFinish() => LogFinishImpl();
        
        [LinkName("igLogRenderedText")]
        private static extern void LogRenderedTextImpl(Vec2* ref_pos, char* text, char* text_end);
        public static void LogRenderedText(Vec2* ref_pos, char* text, char* text_end = null) => LogRenderedTextImpl(ref_pos, text, text_end);
        
        [LinkName("igLogSetNextTextDecoration")]
        private static extern void LogSetNextTextDecorationImpl(char* prefix, char* suffix);
        public static void LogSetNextTextDecoration(char* prefix, char* suffix) => LogSetNextTextDecorationImpl(prefix, suffix);
        
        [LinkName("igLogText")]
        private static extern void LogTextImpl(char* fmt, ...);
        public static void LogText(char* fmt, params Object[] args) => LogTextImpl(scope String()..AppendF(StringView(fmt), params args));
        
        [LinkName("igLogToBuffer")]
        private static extern void LogToBufferImpl(int32 auto_open_depth);
        public static void LogToBuffer(int32 auto_open_depth = -1) => LogToBufferImpl(auto_open_depth);
        
        [LinkName("igLogToClipboard")]
        private static extern void LogToClipboardImpl(int32 auto_open_depth);
        public static void LogToClipboard(int32 auto_open_depth = -1) => LogToClipboardImpl(auto_open_depth);
        
        [LinkName("igLogToFile")]
        private static extern void LogToFileImpl(int32 auto_open_depth, char* filename);
        public static void LogToFile(int32 auto_open_depth = -1, char* filename = null) => LogToFileImpl(auto_open_depth, filename);
        
        [LinkName("igLogToTTY")]
        private static extern void LogToTTYImpl(int32 auto_open_depth);
        public static void LogToTTY(int32 auto_open_depth = -1) => LogToTTYImpl(auto_open_depth);
        
        [LinkName("igMarkIniSettingsDirty_Nil")]
        private static extern void MarkIniSettingsDirtyImpl();
        public static void MarkIniSettingsDirty() => MarkIniSettingsDirtyImpl();
        
        [LinkName("igMarkIniSettingsDirty_WindowPtr")]
        private static extern void MarkIniSettingsDirtyImpl(Window* window);
        public static void MarkIniSettingsDirty(Window* window) => MarkIniSettingsDirtyImpl(window);
        
        [LinkName("igMarkItemEdited")]
        private static extern void MarkItemEditedImpl(ID id);
        public static void MarkItemEdited(ID id) => MarkItemEditedImpl(id);
        
        [LinkName("igMemAlloc")]
        private static extern void* MemAllocImpl(size size);
        #if IMGUI_USE_REF
        public static ref void MemAlloc(size size) { return ref *MemAllocImpl(size); }
        #else
        public static void* MemAlloc(size size) => MemAllocImpl(size);
        #endif
        
        [LinkName("igMemFree")]
        private static extern void MemFreeImpl(void* ptr);
        public static void MemFree(void* ptr) => MemFreeImpl(ptr);
        
        [LinkName("igMenuItem_Bool")]
        private static extern bool MenuItemImpl(char* label, char* shortcut, bool selected, bool enabled);
        public static bool MenuItem(char* label, char* shortcut = null, bool selected = false, bool enabled = true) => MenuItemImpl(label, shortcut, selected, enabled);
        
        [LinkName("igMenuItem_BoolPtr")]
        private static extern bool MenuItemImpl(char* label, char* shortcut, bool* p_selected, bool enabled);
        public static bool MenuItem(char* label, char* shortcut, bool* p_selected, bool enabled = true) => MenuItemImpl(label, shortcut, p_selected, enabled);
        
        [LinkName("igMenuItemEx")]
        private static extern bool MenuItemExImpl(char* label, char* icon, char* shortcut, bool selected, bool enabled);
        public static bool MenuItemEx(char* label, char* icon, char* shortcut = null, bool selected = false, bool enabled = true) => MenuItemExImpl(label, icon, shortcut, selected, enabled);
        
        [LinkName("igMouseButtonToKey")]
        private static extern Key MouseButtonToKeyImpl(MouseButton button);
        public static Key MouseButtonToKey(MouseButton button) => MouseButtonToKeyImpl(button);
        
        [LinkName("igNavInitRequestApplyResult")]
        private static extern void NavInitRequestApplyResultImpl();
        public static void NavInitRequestApplyResult() => NavInitRequestApplyResultImpl();
        
        [LinkName("igNavInitWindow")]
        private static extern void NavInitWindowImpl(Window* window, bool force_reinit);
        public static void NavInitWindow(Window* window, bool force_reinit) => NavInitWindowImpl(window, force_reinit);
        
        [LinkName("igNavMoveRequestApplyResult")]
        private static extern void NavMoveRequestApplyResultImpl();
        public static void NavMoveRequestApplyResult() => NavMoveRequestApplyResultImpl();
        
        [LinkName("igNavMoveRequestButNoResultYet")]
        private static extern bool NavMoveRequestButNoResultYetImpl();
        public static bool NavMoveRequestButNoResultYet() => NavMoveRequestButNoResultYetImpl();
        
        [LinkName("igNavMoveRequestCancel")]
        private static extern void NavMoveRequestCancelImpl();
        public static void NavMoveRequestCancel() => NavMoveRequestCancelImpl();
        
        [LinkName("igNavMoveRequestForward")]
        private static extern void NavMoveRequestForwardImpl(Dir move_dir, Dir clip_dir, NavMoveFlags move_flags, ScrollFlags scroll_flags);
        public static void NavMoveRequestForward(Dir move_dir, Dir clip_dir, NavMoveFlags move_flags, ScrollFlags scroll_flags) => NavMoveRequestForwardImpl(move_dir, clip_dir, move_flags, scroll_flags);
        
        [LinkName("igNavMoveRequestResolveWithLastItem")]
        private static extern void NavMoveRequestResolveWithLastItemImpl(NavItemData* result);
        public static void NavMoveRequestResolveWithLastItem(NavItemData* result) => NavMoveRequestResolveWithLastItemImpl(result);
        
        [LinkName("igNavMoveRequestSubmit")]
        private static extern void NavMoveRequestSubmitImpl(Dir move_dir, Dir clip_dir, NavMoveFlags move_flags, ScrollFlags scroll_flags);
        public static void NavMoveRequestSubmit(Dir move_dir, Dir clip_dir, NavMoveFlags move_flags, ScrollFlags scroll_flags) => NavMoveRequestSubmitImpl(move_dir, clip_dir, move_flags, scroll_flags);
        
        [LinkName("igNavMoveRequestTryWrapping")]
        private static extern void NavMoveRequestTryWrappingImpl(Window* window, NavMoveFlags move_flags);
        public static void NavMoveRequestTryWrapping(Window* window, NavMoveFlags move_flags) => NavMoveRequestTryWrappingImpl(window, move_flags);
        
        [LinkName("igNewFrame")]
        private static extern void NewFrameImpl();
        public static void NewFrame() => NewFrameImpl();
        
        [LinkName("igNewLine")]
        private static extern void NewLineImpl();
        public static void NewLine() => NewLineImpl();
        
        [LinkName("igNextColumn")]
        private static extern void NextColumnImpl();
        public static void NextColumn() => NextColumnImpl();
        
        [LinkName("igOpenPopup_Str")]
        private static extern void OpenPopupImpl(char* str_id, PopupFlags popup_flags);
        public static void OpenPopup(char* str_id, PopupFlags popup_flags = (PopupFlags) 0) => OpenPopupImpl(str_id, popup_flags);
        
        [LinkName("igOpenPopup_ID")]
        private static extern void OpenPopupImpl(ID id, PopupFlags popup_flags);
        public static void OpenPopup(ID id, PopupFlags popup_flags = (PopupFlags) 0) => OpenPopupImpl(id, popup_flags);
        
        [LinkName("igOpenPopupEx")]
        private static extern void OpenPopupExImpl(ID id, PopupFlags popup_flags);
        public static void OpenPopupEx(ID id, PopupFlags popup_flags = .None) => OpenPopupExImpl(id, popup_flags);
        
        [LinkName("igOpenPopupOnItemClick")]
        private static extern void OpenPopupOnItemClickImpl(char* str_id, PopupFlags popup_flags);
        public static void OpenPopupOnItemClick(char* str_id = null, PopupFlags popup_flags = (PopupFlags) 1) => OpenPopupOnItemClickImpl(str_id, popup_flags);
        
        [LinkName("igPlotEx")]
        private static extern int32 PlotExImpl(PlotType plot_type, char* label, function float(void* data, int32 idx) values_getter, void* data, int32 values_count, int32 values_offset, char* overlay_text, float scale_min, float scale_max, Vec2 size_arg);
        public static int32 PlotEx(PlotType plot_type, char* label, function float(void* data, int32 idx) values_getter, void* data, int32 values_count, int32 values_offset, char* overlay_text, float scale_min, float scale_max, Vec2 size_arg) => PlotExImpl(plot_type, label, values_getter, data, values_count, values_offset, overlay_text, scale_min, scale_max, size_arg);
        
        [LinkName("igPlotHistogram_FloatPtr")]
        private static extern void PlotHistogramImpl(char* label, float* values, int32 values_count, int32 values_offset, char* overlay_text, float scale_min, float scale_max, Vec2 graph_size, int32 stride);
        public static void PlotHistogram(char* label, float* values, int32 values_count, int32 values_offset = (int32) 0, char* overlay_text = null, float scale_min = float.MaxValue, float scale_max = float.MaxValue, Vec2 graph_size = Vec2.Zero, int32 stride = sizeof(float)) => PlotHistogramImpl(label, values, values_count, values_offset, overlay_text, scale_min, scale_max, graph_size, stride);
        
        [LinkName("igPlotHistogram_FnFloatPtr")]
        private static extern void PlotHistogramImpl(char* label, function float(void* data, int32 idx) values_getter, void* data, int32 values_count, int32 values_offset, char* overlay_text, float scale_min, float scale_max, Vec2 graph_size);
        public static void PlotHistogram(char* label, function float(void* data, int32 idx) values_getter, void* data, int32 values_count, int32 values_offset = (int32) 0, char* overlay_text = null, float scale_min = float.MaxValue, float scale_max = float.MaxValue, Vec2 graph_size = Vec2.Zero) => PlotHistogramImpl(label, values_getter, data, values_count, values_offset, overlay_text, scale_min, scale_max, graph_size);
        
        [LinkName("igPlotLines_FloatPtr")]
        private static extern void PlotLinesImpl(char* label, float* values, int32 values_count, int32 values_offset, char* overlay_text, float scale_min, float scale_max, Vec2 graph_size, int32 stride);
        public static void PlotLines(char* label, float* values, int32 values_count, int32 values_offset = (int32) 0, char* overlay_text = null, float scale_min = float.MaxValue, float scale_max = float.MaxValue, Vec2 graph_size = Vec2.Zero, int32 stride = sizeof(float)) => PlotLinesImpl(label, values, values_count, values_offset, overlay_text, scale_min, scale_max, graph_size, stride);
        
        [LinkName("igPlotLines_FnFloatPtr")]
        private static extern void PlotLinesImpl(char* label, function float(void* data, int32 idx) values_getter, void* data, int32 values_count, int32 values_offset, char* overlay_text, float scale_min, float scale_max, Vec2 graph_size);
        public static void PlotLines(char* label, function float(void* data, int32 idx) values_getter, void* data, int32 values_count, int32 values_offset = (int32) 0, char* overlay_text = null, float scale_min = float.MaxValue, float scale_max = float.MaxValue, Vec2 graph_size = Vec2.Zero) => PlotLinesImpl(label, values_getter, data, values_count, values_offset, overlay_text, scale_min, scale_max, graph_size);
        
        [LinkName("igPopButtonRepeat")]
        private static extern void PopButtonRepeatImpl();
        public static void PopButtonRepeat() => PopButtonRepeatImpl();
        
        [LinkName("igPopClipRect")]
        private static extern void PopClipRectImpl();
        public static void PopClipRect() => PopClipRectImpl();
        
        [LinkName("igPopColumnsBackground")]
        private static extern void PopColumnsBackgroundImpl();
        public static void PopColumnsBackground() => PopColumnsBackgroundImpl();
        
        [LinkName("igPopFocusScope")]
        private static extern void PopFocusScopeImpl();
        public static void PopFocusScope() => PopFocusScopeImpl();
        
        [LinkName("igPopFont")]
        private static extern void PopFontImpl();
        public static void PopFont() => PopFontImpl();
        
        [LinkName("igPopID")]
        private static extern void PopIDImpl();
        public static void PopID() => PopIDImpl();
        
        [LinkName("igPopItemFlag")]
        private static extern void PopItemFlagImpl();
        public static void PopItemFlag() => PopItemFlagImpl();
        
        [LinkName("igPopItemWidth")]
        private static extern void PopItemWidthImpl();
        public static void PopItemWidth() => PopItemWidthImpl();
        
        [LinkName("igPopStyleColor")]
        private static extern void PopStyleColorImpl(int32 count);
        public static void PopStyleColor(int32 count = (int32) 1) => PopStyleColorImpl(count);
        
        [LinkName("igPopStyleVar")]
        private static extern void PopStyleVarImpl(int32 count);
        public static void PopStyleVar(int32 count = (int32) 1) => PopStyleVarImpl(count);
        
        [LinkName("igPopTabStop")]
        private static extern void PopTabStopImpl();
        public static void PopTabStop() => PopTabStopImpl();
        
        [LinkName("igPopTextWrapPos")]
        private static extern void PopTextWrapPosImpl();
        public static void PopTextWrapPos() => PopTextWrapPosImpl();
        
        [LinkName("igProgressBar")]
        private static extern void ProgressBarImpl(float fraction, Vec2 size_arg, char* overlay);
        public static void ProgressBar(float fraction, Vec2 size_arg = .(-float.MinValue,0), char* overlay = null) => ProgressBarImpl(fraction, size_arg, overlay);
        
        [LinkName("igPushButtonRepeat")]
        private static extern void PushButtonRepeatImpl(bool repeat_);
        public static void PushButtonRepeat(bool repeat_) => PushButtonRepeatImpl(repeat_);
        
        [LinkName("igPushClipRect")]
        private static extern void PushClipRectImpl(Vec2 clip_rect_min, Vec2 clip_rect_max, bool intersect_with_current_clip_rect);
        public static void PushClipRect(Vec2 clip_rect_min, Vec2 clip_rect_max, bool intersect_with_current_clip_rect) => PushClipRectImpl(clip_rect_min, clip_rect_max, intersect_with_current_clip_rect);
        
        [LinkName("igPushColumnClipRect")]
        private static extern void PushColumnClipRectImpl(int32 column_index);
        public static void PushColumnClipRect(int32 column_index) => PushColumnClipRectImpl(column_index);
        
        [LinkName("igPushColumnsBackground")]
        private static extern void PushColumnsBackgroundImpl();
        public static void PushColumnsBackground() => PushColumnsBackgroundImpl();
        
        [LinkName("igPushFocusScope")]
        private static extern void PushFocusScopeImpl(ID id);
        public static void PushFocusScope(ID id) => PushFocusScopeImpl(id);
        
        [LinkName("igPushFont")]
        private static extern void PushFontImpl(Font* font);
        public static void PushFont(Font* font) => PushFontImpl(font);
        
        [LinkName("igPushID_Str")]
        private static extern void PushIDImpl(char* str_id);
        public static void PushID(char* str_id) => PushIDImpl(str_id);
        
        [LinkName("igPushID_StrStr")]
        private static extern void PushIDImpl(char* str_id_begin, char* str_id_end);
        public static void PushID(char* str_id_begin, char* str_id_end) => PushIDImpl(str_id_begin, str_id_end);
        
        [LinkName("igPushID_Ptr")]
        private static extern void PushIDImpl(void* ptr_id);
        public static void PushID(void* ptr_id) => PushIDImpl(ptr_id);
        
        [LinkName("igPushID_Int")]
        private static extern void PushIDImpl(int32 int_id);
        public static void PushID(int32 int_id) => PushIDImpl(int_id);
        
        [LinkName("igPushItemFlag")]
        private static extern void PushItemFlagImpl(ItemFlags option, bool enabled);
        public static void PushItemFlag(ItemFlags option, bool enabled) => PushItemFlagImpl(option, enabled);
        
        [LinkName("igPushItemWidth")]
        private static extern void PushItemWidthImpl(float item_width);
        public static void PushItemWidth(float item_width) => PushItemWidthImpl(item_width);
        
        [LinkName("igPushMultiItemsWidths")]
        private static extern void PushMultiItemsWidthsImpl(int32 components, float width_full);
        public static void PushMultiItemsWidths(int32 components, float width_full) => PushMultiItemsWidthsImpl(components, width_full);
        
        [LinkName("igPushOverrideID")]
        private static extern void PushOverrideIDImpl(ID id);
        public static void PushOverrideID(ID id) => PushOverrideIDImpl(id);
        
        [LinkName("igPushStyleColor_U32")]
        private static extern void PushStyleColorImpl(Col idx, U32 col);
        public static void PushStyleColor(Col idx, U32 col) => PushStyleColorImpl(idx, col);
        
        [LinkName("igPushStyleColor_Vec4")]
        private static extern void PushStyleColorImpl(Col idx, Vec4 col);
        public static void PushStyleColor(Col idx, Vec4 col) => PushStyleColorImpl(idx, col);
        
        [LinkName("igPushStyleVar_Float")]
        private static extern void PushStyleVarImpl(StyleVar idx, float val);
        public static void PushStyleVar(StyleVar idx, float val) => PushStyleVarImpl(idx, val);
        
        [LinkName("igPushStyleVar_Vec2")]
        private static extern void PushStyleVarImpl(StyleVar idx, Vec2 val);
        public static void PushStyleVar(StyleVar idx, Vec2 val) => PushStyleVarImpl(idx, val);
        
        [LinkName("igPushTabStop")]
        private static extern void PushTabStopImpl(bool tab_stop);
        public static void PushTabStop(bool tab_stop) => PushTabStopImpl(tab_stop);
        
        [LinkName("igPushTextWrapPos")]
        private static extern void PushTextWrapPosImpl(float wrap_local_pos_x);
        public static void PushTextWrapPos(float wrap_local_pos_x = (float) 0.0f) => PushTextWrapPosImpl(wrap_local_pos_x);
        
        [LinkName("igRadioButton_Bool")]
        private static extern bool RadioButtonImpl(char* label, bool active);
        public static bool RadioButton(char* label, bool active) => RadioButtonImpl(label, active);
        
        [LinkName("igRadioButton_IntPtr")]
        private static extern bool RadioButtonImpl(char* label, int32* v, int32 v_button);
        public static bool RadioButton(char* label, int32* v, int32 v_button) => RadioButtonImpl(label, v, v_button);
        
        [LinkName("igRemoveContextHook")]
        private static extern void RemoveContextHookImpl(Context* context, ID hook_to_remove);
        public static void RemoveContextHook(Context* context, ID hook_to_remove) => RemoveContextHookImpl(context, hook_to_remove);
        
        [LinkName("igRemoveSettingsHandler")]
        private static extern void RemoveSettingsHandlerImpl(char* type_name);
        public static void RemoveSettingsHandler(char* type_name) => RemoveSettingsHandlerImpl(type_name);
        
        [LinkName("igRender")]
        private static extern void RenderImpl();
        public static void Render() => RenderImpl();
        
        [LinkName("igRenderArrow")]
        private static extern void RenderArrowImpl(DrawList* draw_list, Vec2 pos, U32 col, Dir dir, float scale);
        public static void RenderArrow(DrawList* draw_list, Vec2 pos, U32 col, Dir dir, float scale = (float) 1.0f) => RenderArrowImpl(draw_list, pos, col, dir, scale);
        
        [LinkName("igRenderArrowDockMenu")]
        private static extern void RenderArrowDockMenuImpl(DrawList* draw_list, Vec2 p_min, float sz, U32 col);
        public static void RenderArrowDockMenu(DrawList* draw_list, Vec2 p_min, float sz, U32 col) => RenderArrowDockMenuImpl(draw_list, p_min, sz, col);
        
        [LinkName("igRenderArrowPointingAt")]
        private static extern void RenderArrowPointingAtImpl(DrawList* draw_list, Vec2 pos, Vec2 half_sz, Dir direction, U32 col);
        public static void RenderArrowPointingAt(DrawList* draw_list, Vec2 pos, Vec2 half_sz, Dir direction, U32 col) => RenderArrowPointingAtImpl(draw_list, pos, half_sz, direction, col);
        
        [LinkName("igRenderBullet")]
        private static extern void RenderBulletImpl(DrawList* draw_list, Vec2 pos, U32 col);
        public static void RenderBullet(DrawList* draw_list, Vec2 pos, U32 col) => RenderBulletImpl(draw_list, pos, col);
        
        [LinkName("igRenderCheckMark")]
        private static extern void RenderCheckMarkImpl(DrawList* draw_list, Vec2 pos, U32 col, float sz);
        public static void RenderCheckMark(DrawList* draw_list, Vec2 pos, U32 col, float sz) => RenderCheckMarkImpl(draw_list, pos, col, sz);
        
        [LinkName("igRenderColorRectWithAlphaCheckerboard")]
        private static extern void RenderColorRectWithAlphaCheckerboardImpl(DrawList* draw_list, Vec2 p_min, Vec2 p_max, U32 fill_col, float grid_step, Vec2 grid_off, float rounding, DrawFlags flags);
        public static void RenderColorRectWithAlphaCheckerboard(DrawList* draw_list, Vec2 p_min, Vec2 p_max, U32 fill_col, float grid_step, Vec2 grid_off, float rounding = (float) 0.0f, DrawFlags flags = (DrawFlags) 0) => RenderColorRectWithAlphaCheckerboardImpl(draw_list, p_min, p_max, fill_col, grid_step, grid_off, rounding, flags);
        
        [LinkName("igRenderDragDropTargetRect")]
        private static extern void RenderDragDropTargetRectImpl(Rect bb);
        public static void RenderDragDropTargetRect(Rect bb) => RenderDragDropTargetRectImpl(bb);
        
        [LinkName("igRenderFrame")]
        private static extern void RenderFrameImpl(Vec2 p_min, Vec2 p_max, U32 fill_col, bool border, float rounding);
        public static void RenderFrame(Vec2 p_min, Vec2 p_max, U32 fill_col, bool border = true, float rounding = (float) 0.0f) => RenderFrameImpl(p_min, p_max, fill_col, border, rounding);
        
        [LinkName("igRenderFrameBorder")]
        private static extern void RenderFrameBorderImpl(Vec2 p_min, Vec2 p_max, float rounding);
        public static void RenderFrameBorder(Vec2 p_min, Vec2 p_max, float rounding = (float) 0.0f) => RenderFrameBorderImpl(p_min, p_max, rounding);
        
        [LinkName("igRenderMouseCursor")]
        private static extern void RenderMouseCursorImpl(Vec2 pos, float scale, MouseCursor mouse_cursor, U32 col_fill, U32 col_border, U32 col_shadow);
        public static void RenderMouseCursor(Vec2 pos, float scale, MouseCursor mouse_cursor, U32 col_fill, U32 col_border, U32 col_shadow) => RenderMouseCursorImpl(pos, scale, mouse_cursor, col_fill, col_border, col_shadow);
        
        [LinkName("igRenderNavHighlight")]
        private static extern void RenderNavHighlightImpl(Rect bb, ID id, NavHighlightFlags flags);
        public static void RenderNavHighlight(Rect bb, ID id, NavHighlightFlags flags = .TypeDefault) => RenderNavHighlightImpl(bb, id, flags);
        
        [LinkName("igRenderPlatformWindowsDefault")]
        private static extern void RenderPlatformWindowsDefaultImpl(void* platform_render_arg, void* renderer_render_arg);
        public static void RenderPlatformWindowsDefault(void* platform_render_arg = null, void* renderer_render_arg = null) => RenderPlatformWindowsDefaultImpl(platform_render_arg, renderer_render_arg);
        
        [LinkName("igRenderRectFilledRangeH")]
        private static extern void RenderRectFilledRangeHImpl(DrawList* draw_list, Rect rect, U32 col, float x_start_norm, float x_end_norm, float rounding);
        public static void RenderRectFilledRangeH(DrawList* draw_list, Rect rect, U32 col, float x_start_norm, float x_end_norm, float rounding) => RenderRectFilledRangeHImpl(draw_list, rect, col, x_start_norm, x_end_norm, rounding);
        
        [LinkName("igRenderRectFilledWithHole")]
        private static extern void RenderRectFilledWithHoleImpl(DrawList* draw_list, Rect outer, Rect inner, U32 col, float rounding);
        public static void RenderRectFilledWithHole(DrawList* draw_list, Rect outer, Rect inner, U32 col, float rounding) => RenderRectFilledWithHoleImpl(draw_list, outer, inner, col, rounding);
        
        [LinkName("igRenderText")]
        private static extern void RenderTextImpl(Vec2 pos, char* text, char* text_end, bool hide_text_after_hash);
        public static void RenderText(Vec2 pos, char* text, char* text_end = null, bool hide_text_after_hash = true) => RenderTextImpl(pos, text, text_end, hide_text_after_hash);
        
        [LinkName("igRenderTextClipped")]
        private static extern void RenderTextClippedImpl(Vec2 pos_min, Vec2 pos_max, char* text, char* text_end, Vec2* text_size_if_known, Vec2 align, Rect* clip_rect);
        public static void RenderTextClipped(Vec2 pos_min, Vec2 pos_max, char* text, char* text_end, Vec2* text_size_if_known, Vec2 align = Vec2.Zero, Rect* clip_rect = null) => RenderTextClippedImpl(pos_min, pos_max, text, text_end, text_size_if_known, align, clip_rect);
        
        [LinkName("igRenderTextClippedEx")]
        private static extern void RenderTextClippedExImpl(DrawList* draw_list, Vec2 pos_min, Vec2 pos_max, char* text, char* text_end, Vec2* text_size_if_known, Vec2 align, Rect* clip_rect);
        public static void RenderTextClippedEx(DrawList* draw_list, Vec2 pos_min, Vec2 pos_max, char* text, char* text_end, Vec2* text_size_if_known, Vec2 align = Vec2.Zero, Rect* clip_rect = null) => RenderTextClippedExImpl(draw_list, pos_min, pos_max, text, text_end, text_size_if_known, align, clip_rect);
        
        [LinkName("igRenderTextEllipsis")]
        private static extern void RenderTextEllipsisImpl(DrawList* draw_list, Vec2 pos_min, Vec2 pos_max, float clip_max_x, float ellipsis_max_x, char* text, char* text_end, Vec2* text_size_if_known);
        public static void RenderTextEllipsis(DrawList* draw_list, Vec2 pos_min, Vec2 pos_max, float clip_max_x, float ellipsis_max_x, char* text, char* text_end, Vec2* text_size_if_known) => RenderTextEllipsisImpl(draw_list, pos_min, pos_max, clip_max_x, ellipsis_max_x, text, text_end, text_size_if_known);
        
        [LinkName("igRenderTextWrapped")]
        private static extern void RenderTextWrappedImpl(Vec2 pos, char* text, char* text_end, float wrap_width);
        public static void RenderTextWrapped(Vec2 pos, char* text, char* text_end, float wrap_width) => RenderTextWrappedImpl(pos, text, text_end, wrap_width);
        
        [LinkName("igResetMouseDragDelta")]
        private static extern void ResetMouseDragDeltaImpl(MouseButton button);
        public static void ResetMouseDragDelta(MouseButton button = (MouseButton) 0) => ResetMouseDragDeltaImpl(button);
        
        [LinkName("igSameLine")]
        private static extern void SameLineImpl(float offset_from_start_x, float spacing);
        public static void SameLine(float offset_from_start_x = (float) 0.0f, float spacing = -1.0f) => SameLineImpl(offset_from_start_x, spacing);
        
        [LinkName("igSaveIniSettingsToDisk")]
        private static extern void SaveIniSettingsToDiskImpl(char* ini_filename);
        public static void SaveIniSettingsToDisk(char* ini_filename) => SaveIniSettingsToDiskImpl(ini_filename);
        
        [LinkName("igSaveIniSettingsToMemory")]
        private static extern char* SaveIniSettingsToMemoryImpl(size* out_ini_size);
        #if IMGUI_USE_REF
        public static ref char SaveIniSettingsToMemory(size* out_ini_size = null) { return ref *SaveIniSettingsToMemoryImpl(out_ini_size); }
        #else
        public static char* SaveIniSettingsToMemory(size* out_ini_size = null) => SaveIniSettingsToMemoryImpl(out_ini_size);
        #endif
        
        [LinkName("igScaleWindowsInViewport")]
        private static extern void ScaleWindowsInViewportImpl(ViewportP* viewport, float scale);
        public static void ScaleWindowsInViewport(ViewportP* viewport, float scale) => ScaleWindowsInViewportImpl(viewport, scale);
        
        [LinkName("igScrollToBringRectIntoView")]
        private static extern void ScrollToBringRectIntoViewImpl(Window* window, Rect rect);
        public static void ScrollToBringRectIntoView(Window* window, Rect rect) => ScrollToBringRectIntoViewImpl(window, rect);
        
        [LinkName("igScrollToItem")]
        private static extern void ScrollToItemImpl(ScrollFlags flags);
        public static void ScrollToItem(ScrollFlags flags = (ScrollFlags) 0) => ScrollToItemImpl(flags);
        
        [LinkName("igScrollToRect")]
        private static extern void ScrollToRectImpl(Window* window, Rect rect, ScrollFlags flags);
        public static void ScrollToRect(Window* window, Rect rect, ScrollFlags flags = (ScrollFlags) 0) => ScrollToRectImpl(window, rect, flags);
        
        [LinkName("igScrollToRectEx")]
        private static extern Vec2 ScrollToRectExImpl(Vec2* pOut, Window* window, Rect rect, ScrollFlags flags);
        public static Vec2 ScrollToRectEx(Window* window, Rect rect, ScrollFlags flags = (ScrollFlags) 0)
        {
            Vec2 pOut = default;
            ScrollToRectExImpl(&pOut, window, rect, flags);
            return pOut;
        }
        
        [LinkName("igScrollbar")]
        private static extern void ScrollbarImpl(Axis axis);
        public static void Scrollbar(Axis axis) => ScrollbarImpl(axis);
        
        [LinkName("igScrollbarEx")]
        private static extern bool ScrollbarExImpl(Rect bb, ID id, Axis axis, S64* p_scroll_v, S64 avail_v, S64 contents_v, DrawFlags flags);
        public static bool ScrollbarEx(Rect bb, ID id, Axis axis, S64* p_scroll_v, S64 avail_v, S64 contents_v, DrawFlags flags) => ScrollbarExImpl(bb, id, axis, p_scroll_v, avail_v, contents_v, flags);
        
        [LinkName("igSelectable_Bool")]
        private static extern bool SelectableImpl(char* label, bool selected, SelectableFlags flags, Vec2 size);
        public static bool Selectable(char* label, bool selected = false, SelectableFlags flags = (SelectableFlags) 0, Vec2 size = Vec2.Zero) => SelectableImpl(label, selected, flags, size);
        
        [LinkName("igSelectable_BoolPtr")]
        private static extern bool SelectableImpl(char* label, bool* p_selected, SelectableFlags flags, Vec2 size);
        public static bool Selectable(char* label, bool* p_selected, SelectableFlags flags = (SelectableFlags) 0, Vec2 size = Vec2.Zero) => SelectableImpl(label, p_selected, flags, size);
        
        [LinkName("igSeparator")]
        private static extern void SeparatorImpl();
        public static void Separator() => SeparatorImpl();
        
        [LinkName("igSeparatorEx")]
        private static extern void SeparatorExImpl(SeparatorFlags flags);
        public static void SeparatorEx(SeparatorFlags flags) => SeparatorExImpl(flags);
        
        [LinkName("igSeparatorText")]
        private static extern void SeparatorTextImpl(char* label);
        public static void SeparatorText(char* label) => SeparatorTextImpl(label);
        
        [LinkName("igSeparatorTextEx")]
        private static extern void SeparatorTextExImpl(ID id, char* label, char* label_end, float extra_width);
        public static void SeparatorTextEx(ID id, char* label, char* label_end, float extra_width) => SeparatorTextExImpl(id, label, label_end, extra_width);
        
        [LinkName("igSetActiveID")]
        private static extern void SetActiveIDImpl(ID id, Window* window);
        public static void SetActiveID(ID id, Window* window) => SetActiveIDImpl(id, window);
        
        [LinkName("igSetActiveIdUsingAllKeyboardKeys")]
        private static extern void SetActiveIdUsingAllKeyboardKeysImpl();
        public static void SetActiveIdUsingAllKeyboardKeys() => SetActiveIdUsingAllKeyboardKeysImpl();
        
        [LinkName("igSetAllocatorFunctions")]
        private static extern void SetAllocatorFunctionsImpl(MemAllocFunc alloc_func, MemFreeFunc free_func, void* user_data);
        public static void SetAllocatorFunctions(MemAllocFunc alloc_func, MemFreeFunc free_func, void* user_data = null) => SetAllocatorFunctionsImpl(alloc_func, free_func, user_data);
        
        [LinkName("igSetClipboardText")]
        private static extern void SetClipboardTextImpl(char* text);
        public static void SetClipboardText(char* text) => SetClipboardTextImpl(text);
        
        [LinkName("igSetColorEditOptions")]
        private static extern void SetColorEditOptionsImpl(ColorEditFlags flags);
        public static void SetColorEditOptions(ColorEditFlags flags) => SetColorEditOptionsImpl(flags);
        
        [LinkName("igSetColumnOffset")]
        private static extern void SetColumnOffsetImpl(int32 column_index, float offset_x);
        public static void SetColumnOffset(int32 column_index, float offset_x) => SetColumnOffsetImpl(column_index, offset_x);
        
        [LinkName("igSetColumnWidth")]
        private static extern void SetColumnWidthImpl(int32 column_index, float width);
        public static void SetColumnWidth(int32 column_index, float width) => SetColumnWidthImpl(column_index, width);
        
        [LinkName("igSetCurrentContext")]
        private static extern void SetCurrentContextImpl(Context* ctx);
        public static void SetCurrentContext(Context* ctx) => SetCurrentContextImpl(ctx);
        
        [LinkName("igSetCurrentFont")]
        private static extern void SetCurrentFontImpl(Font* font);
        public static void SetCurrentFont(Font* font) => SetCurrentFontImpl(font);
        
        [LinkName("igSetCurrentViewport")]
        private static extern void SetCurrentViewportImpl(Window* window, ViewportP* viewport);
        public static void SetCurrentViewport(Window* window, ViewportP* viewport) => SetCurrentViewportImpl(window, viewport);
        
        [LinkName("igSetCursorPos")]
        private static extern void SetCursorPosImpl(Vec2 local_pos);
        public static void SetCursorPos(Vec2 local_pos) => SetCursorPosImpl(local_pos);
        
        [LinkName("igSetCursorPosX")]
        private static extern void SetCursorPosXImpl(float local_x);
        public static void SetCursorPosX(float local_x) => SetCursorPosXImpl(local_x);
        
        [LinkName("igSetCursorPosY")]
        private static extern void SetCursorPosYImpl(float local_y);
        public static void SetCursorPosY(float local_y) => SetCursorPosYImpl(local_y);
        
        [LinkName("igSetCursorScreenPos")]
        private static extern void SetCursorScreenPosImpl(Vec2 pos);
        public static void SetCursorScreenPos(Vec2 pos) => SetCursorScreenPosImpl(pos);
        
        [LinkName("igSetDragDropPayload")]
        private static extern bool SetDragDropPayloadImpl(char* type, void* data, size sz, Cond cond);
        public static bool SetDragDropPayload(char* type, void* data, size sz, Cond cond = (Cond) 0) => SetDragDropPayloadImpl(type, data, sz, cond);
        
        [LinkName("igSetFocusID")]
        private static extern void SetFocusIDImpl(ID id, Window* window);
        public static void SetFocusID(ID id, Window* window) => SetFocusIDImpl(id, window);
        
        [LinkName("igSetHoveredID")]
        private static extern void SetHoveredIDImpl(ID id);
        public static void SetHoveredID(ID id) => SetHoveredIDImpl(id);
        
        [LinkName("igSetItemAllowOverlap")]
        private static extern void SetItemAllowOverlapImpl();
        public static void SetItemAllowOverlap() => SetItemAllowOverlapImpl();
        
        [LinkName("igSetItemDefaultFocus")]
        private static extern void SetItemDefaultFocusImpl();
        public static void SetItemDefaultFocus() => SetItemDefaultFocusImpl();
        
        [LinkName("igSetItemKeyOwner")]
        private static extern void SetItemKeyOwnerImpl(Key key, InputFlags flags);
        public static void SetItemKeyOwner(Key key, InputFlags flags = (InputFlags) 0) => SetItemKeyOwnerImpl(key, flags);
        
        [LinkName("igSetKeyOwner")]
        private static extern void SetKeyOwnerImpl(Key key, ID owner_id, InputFlags flags);
        public static void SetKeyOwner(Key key, ID owner_id, InputFlags flags = (InputFlags) 0) => SetKeyOwnerImpl(key, owner_id, flags);
        
        [LinkName("igSetKeyOwnersForKeyChord")]
        private static extern void SetKeyOwnersForKeyChordImpl(KeyChord key, ID owner_id, InputFlags flags);
        public static void SetKeyOwnersForKeyChord(KeyChord key, ID owner_id, InputFlags flags = (InputFlags) 0) => SetKeyOwnersForKeyChordImpl(key, owner_id, flags);
        
        [LinkName("igSetKeyboardFocusHere")]
        private static extern void SetKeyboardFocusHereImpl(int32 offset);
        public static void SetKeyboardFocusHere(int32 offset = (int32) 0) => SetKeyboardFocusHereImpl(offset);
        
        [LinkName("igSetLastItemData")]
        private static extern void SetLastItemDataImpl(ID item_id, ItemFlags in_flags, ItemStatusFlags status_flags, Rect item_rect);
        public static void SetLastItemData(ID item_id, ItemFlags in_flags, ItemStatusFlags status_flags, Rect item_rect) => SetLastItemDataImpl(item_id, in_flags, status_flags, item_rect);
        
        [LinkName("igSetMouseCursor")]
        private static extern void SetMouseCursorImpl(MouseCursor cursor_type);
        public static void SetMouseCursor(MouseCursor cursor_type) => SetMouseCursorImpl(cursor_type);
        
        [LinkName("igSetNavID")]
        private static extern void SetNavIDImpl(ID id, NavLayer nav_layer, ID focus_scope_id, Rect rect_rel);
        public static void SetNavID(ID id, NavLayer nav_layer, ID focus_scope_id, Rect rect_rel) => SetNavIDImpl(id, nav_layer, focus_scope_id, rect_rel);
        
        [LinkName("igSetNavWindow")]
        private static extern void SetNavWindowImpl(Window* window);
        public static void SetNavWindow(Window* window) => SetNavWindowImpl(window);
        
        [LinkName("igSetNextFrameWantCaptureKeyboard")]
        private static extern void SetNextFrameWantCaptureKeyboardImpl(bool want_capture_keyboard);
        public static void SetNextFrameWantCaptureKeyboard(bool want_capture_keyboard) => SetNextFrameWantCaptureKeyboardImpl(want_capture_keyboard);
        
        [LinkName("igSetNextFrameWantCaptureMouse")]
        private static extern void SetNextFrameWantCaptureMouseImpl(bool want_capture_mouse);
        public static void SetNextFrameWantCaptureMouse(bool want_capture_mouse) => SetNextFrameWantCaptureMouseImpl(want_capture_mouse);
        
        [LinkName("igSetNextItemOpen")]
        private static extern void SetNextItemOpenImpl(bool is_open, Cond cond);
        public static void SetNextItemOpen(bool is_open, Cond cond = (Cond) 0) => SetNextItemOpenImpl(is_open, cond);
        
        [LinkName("igSetNextItemWidth")]
        private static extern void SetNextItemWidthImpl(float item_width);
        public static void SetNextItemWidth(float item_width) => SetNextItemWidthImpl(item_width);
        
        [LinkName("igSetNextWindowBgAlpha")]
        private static extern void SetNextWindowBgAlphaImpl(float alpha);
        public static void SetNextWindowBgAlpha(float alpha) => SetNextWindowBgAlphaImpl(alpha);
        
        [LinkName("igSetNextWindowClass")]
        private static extern void SetNextWindowClassImpl(WindowClass* window_class);
        public static void SetNextWindowClass(WindowClass* window_class) => SetNextWindowClassImpl(window_class);
        
        [LinkName("igSetNextWindowCollapsed")]
        private static extern void SetNextWindowCollapsedImpl(bool collapsed, Cond cond);
        public static void SetNextWindowCollapsed(bool collapsed, Cond cond = (Cond) 0) => SetNextWindowCollapsedImpl(collapsed, cond);
        
        [LinkName("igSetNextWindowContentSize")]
        private static extern void SetNextWindowContentSizeImpl(Vec2 size);
        public static void SetNextWindowContentSize(Vec2 size) => SetNextWindowContentSizeImpl(size);
        
        [LinkName("igSetNextWindowDockID")]
        private static extern void SetNextWindowDockIDImpl(ID dock_id, Cond cond);
        public static void SetNextWindowDockID(ID dock_id, Cond cond = (Cond) 0) => SetNextWindowDockIDImpl(dock_id, cond);
        
        [LinkName("igSetNextWindowFocus")]
        private static extern void SetNextWindowFocusImpl();
        public static void SetNextWindowFocus() => SetNextWindowFocusImpl();
        
        [LinkName("igSetNextWindowPos")]
        private static extern void SetNextWindowPosImpl(Vec2 pos, Cond cond, Vec2 pivot);
        public static void SetNextWindowPos(Vec2 pos, Cond cond = (Cond) 0, Vec2 pivot = Vec2.Zero) => SetNextWindowPosImpl(pos, cond, pivot);
        
        [LinkName("igSetNextWindowScroll")]
        private static extern void SetNextWindowScrollImpl(Vec2 scroll);
        public static void SetNextWindowScroll(Vec2 scroll) => SetNextWindowScrollImpl(scroll);
        
        [LinkName("igSetNextWindowSize")]
        private static extern void SetNextWindowSizeImpl(Vec2 size, Cond cond);
        public static void SetNextWindowSize(Vec2 size, Cond cond = (Cond) 0) => SetNextWindowSizeImpl(size, cond);
        
        [LinkName("igSetNextWindowSizeConstraints")]
        private static extern void SetNextWindowSizeConstraintsImpl(Vec2 size_min, Vec2 size_max, SizeCallback custom_callback, void* custom_callback_data);
        public static void SetNextWindowSizeConstraints(Vec2 size_min, Vec2 size_max, SizeCallback custom_callback = null, void* custom_callback_data = null) => SetNextWindowSizeConstraintsImpl(size_min, size_max, custom_callback, custom_callback_data);
        
        [LinkName("igSetNextWindowViewport")]
        private static extern void SetNextWindowViewportImpl(ID viewport_id);
        public static void SetNextWindowViewport(ID viewport_id) => SetNextWindowViewportImpl(viewport_id);
        
        [LinkName("igSetScrollFromPosX_Float")]
        private static extern void SetScrollFromPosXImpl(float local_x, float center_x_ratio);
        public static void SetScrollFromPosX(float local_x, float center_x_ratio = (float) 0.5f) => SetScrollFromPosXImpl(local_x, center_x_ratio);
        
        [LinkName("igSetScrollFromPosX_WindowPtr")]
        private static extern void SetScrollFromPosXImpl(Window* window, float local_x, float center_x_ratio);
        public static void SetScrollFromPosX(Window* window, float local_x, float center_x_ratio) => SetScrollFromPosXImpl(window, local_x, center_x_ratio);
        
        [LinkName("igSetScrollFromPosY_Float")]
        private static extern void SetScrollFromPosYImpl(float local_y, float center_y_ratio);
        public static void SetScrollFromPosY(float local_y, float center_y_ratio = (float) 0.5f) => SetScrollFromPosYImpl(local_y, center_y_ratio);
        
        [LinkName("igSetScrollFromPosY_WindowPtr")]
        private static extern void SetScrollFromPosYImpl(Window* window, float local_y, float center_y_ratio);
        public static void SetScrollFromPosY(Window* window, float local_y, float center_y_ratio) => SetScrollFromPosYImpl(window, local_y, center_y_ratio);
        
        [LinkName("igSetScrollHereX")]
        private static extern void SetScrollHereXImpl(float center_x_ratio);
        public static void SetScrollHereX(float center_x_ratio = (float) 0.5f) => SetScrollHereXImpl(center_x_ratio);
        
        [LinkName("igSetScrollHereY")]
        private static extern void SetScrollHereYImpl(float center_y_ratio);
        public static void SetScrollHereY(float center_y_ratio = (float) 0.5f) => SetScrollHereYImpl(center_y_ratio);
        
        [LinkName("igSetScrollX_Float")]
        private static extern void SetScrollXImpl(float scroll_x);
        public static void SetScrollX(float scroll_x) => SetScrollXImpl(scroll_x);
        
        [LinkName("igSetScrollX_WindowPtr")]
        private static extern void SetScrollXImpl(Window* window, float scroll_x);
        public static void SetScrollX(Window* window, float scroll_x) => SetScrollXImpl(window, scroll_x);
        
        [LinkName("igSetScrollY_Float")]
        private static extern void SetScrollYImpl(float scroll_y);
        public static void SetScrollY(float scroll_y) => SetScrollYImpl(scroll_y);
        
        [LinkName("igSetScrollY_WindowPtr")]
        private static extern void SetScrollYImpl(Window* window, float scroll_y);
        public static void SetScrollY(Window* window, float scroll_y) => SetScrollYImpl(window, scroll_y);
        
        [LinkName("igSetShortcutRouting")]
        private static extern bool SetShortcutRoutingImpl(KeyChord key_chord, ID owner_id, InputFlags flags);
        public static bool SetShortcutRouting(KeyChord key_chord, ID owner_id = (ID) 0, InputFlags flags = (InputFlags) 0) => SetShortcutRoutingImpl(key_chord, owner_id, flags);
        
        [LinkName("igSetStateStorage")]
        private static extern void SetStateStorageImpl(Storage* storage);
        public static void SetStateStorage(Storage* storage) => SetStateStorageImpl(storage);
        
        [LinkName("igSetTabItemClosed")]
        private static extern void SetTabItemClosedImpl(char* tab_or_docked_window_label);
        public static void SetTabItemClosed(char* tab_or_docked_window_label) => SetTabItemClosedImpl(tab_or_docked_window_label);
        
        [LinkName("igSetTooltip")]
        private static extern void SetTooltipImpl(char* fmt, ...);
        public static void SetTooltip(char* fmt, params Object[] args) => SetTooltipImpl(scope String()..AppendF(StringView(fmt), params args));
        
        [LinkName("igSetWindowClipRectBeforeSetChannel")]
        private static extern void SetWindowClipRectBeforeSetChannelImpl(Window* window, Rect clip_rect);
        public static void SetWindowClipRectBeforeSetChannel(Window* window, Rect clip_rect) => SetWindowClipRectBeforeSetChannelImpl(window, clip_rect);
        
        [LinkName("igSetWindowCollapsed_Bool")]
        private static extern void SetWindowCollapsedImpl(bool collapsed, Cond cond);
        public static void SetWindowCollapsed(bool collapsed, Cond cond = (Cond) 0) => SetWindowCollapsedImpl(collapsed, cond);
        
        [LinkName("igSetWindowCollapsed_Str")]
        private static extern void SetWindowCollapsedImpl(char* name, bool collapsed, Cond cond);
        public static void SetWindowCollapsed(char* name, bool collapsed, Cond cond = (Cond) 0) => SetWindowCollapsedImpl(name, collapsed, cond);
        
        [LinkName("igSetWindowCollapsed_WindowPtr")]
        private static extern void SetWindowCollapsedImpl(Window* window, bool collapsed, Cond cond);
        public static void SetWindowCollapsed(Window* window, bool collapsed, Cond cond = (Cond) 0) => SetWindowCollapsedImpl(window, collapsed, cond);
        
        [LinkName("igSetWindowDock")]
        private static extern void SetWindowDockImpl(Window* window, ID dock_id, Cond cond);
        public static void SetWindowDock(Window* window, ID dock_id, Cond cond) => SetWindowDockImpl(window, dock_id, cond);
        
        [LinkName("igSetWindowFocus_Nil")]
        private static extern void SetWindowFocusImpl();
        public static void SetWindowFocus() => SetWindowFocusImpl();
        
        [LinkName("igSetWindowFocus_Str")]
        private static extern void SetWindowFocusImpl(char* name);
        public static void SetWindowFocus(char* name) => SetWindowFocusImpl(name);
        
        [LinkName("igSetWindowFontScale")]
        private static extern void SetWindowFontScaleImpl(float scale);
        public static void SetWindowFontScale(float scale) => SetWindowFontScaleImpl(scale);
        
        [LinkName("igSetWindowHiddendAndSkipItemsForCurrentFrame")]
        private static extern void SetWindowHiddendAndSkipItemsForCurrentFrameImpl(Window* window);
        public static void SetWindowHiddendAndSkipItemsForCurrentFrame(Window* window) => SetWindowHiddendAndSkipItemsForCurrentFrameImpl(window);
        
        [LinkName("igSetWindowHitTestHole")]
        private static extern void SetWindowHitTestHoleImpl(Window* window, Vec2 pos, Vec2 size);
        public static void SetWindowHitTestHole(Window* window, Vec2 pos, Vec2 size) => SetWindowHitTestHoleImpl(window, pos, size);
        
        [LinkName("igSetWindowPos_Vec2")]
        private static extern void SetWindowPosImpl(Vec2 pos, Cond cond);
        public static void SetWindowPos(Vec2 pos, Cond cond = (Cond) 0) => SetWindowPosImpl(pos, cond);
        
        [LinkName("igSetWindowPos_Str")]
        private static extern void SetWindowPosImpl(char* name, Vec2 pos, Cond cond);
        public static void SetWindowPos(char* name, Vec2 pos, Cond cond = (Cond) 0) => SetWindowPosImpl(name, pos, cond);
        
        [LinkName("igSetWindowPos_WindowPtr")]
        private static extern void SetWindowPosImpl(Window* window, Vec2 pos, Cond cond);
        public static void SetWindowPos(Window* window, Vec2 pos, Cond cond = (Cond) 0) => SetWindowPosImpl(window, pos, cond);
        
        [LinkName("igSetWindowSize_Vec2")]
        private static extern void SetWindowSizeImpl(Vec2 size, Cond cond);
        public static void SetWindowSize(Vec2 size, Cond cond = (Cond) 0) => SetWindowSizeImpl(size, cond);
        
        [LinkName("igSetWindowSize_Str")]
        private static extern void SetWindowSizeImpl(char* name, Vec2 size, Cond cond);
        public static void SetWindowSize(char* name, Vec2 size, Cond cond = (Cond) 0) => SetWindowSizeImpl(name, size, cond);
        
        [LinkName("igSetWindowSize_WindowPtr")]
        private static extern void SetWindowSizeImpl(Window* window, Vec2 size, Cond cond);
        public static void SetWindowSize(Window* window, Vec2 size, Cond cond = (Cond) 0) => SetWindowSizeImpl(window, size, cond);
        
        [LinkName("igSetWindowViewport")]
        private static extern void SetWindowViewportImpl(Window* window, ViewportP* viewport);
        public static void SetWindowViewport(Window* window, ViewportP* viewport) => SetWindowViewportImpl(window, viewport);
        
        [LinkName("igShadeVertsLinearColorGradientKeepAlpha")]
        private static extern void ShadeVertsLinearColorGradientKeepAlphaImpl(DrawList* draw_list, int32 vert_start_idx, int32 vert_end_idx, Vec2 gradient_p0, Vec2 gradient_p1, U32 col0, U32 col1);
        public static void ShadeVertsLinearColorGradientKeepAlpha(DrawList* draw_list, int32 vert_start_idx, int32 vert_end_idx, Vec2 gradient_p0, Vec2 gradient_p1, U32 col0, U32 col1) => ShadeVertsLinearColorGradientKeepAlphaImpl(draw_list, vert_start_idx, vert_end_idx, gradient_p0, gradient_p1, col0, col1);
        
        [LinkName("igShadeVertsLinearUV")]
        private static extern void ShadeVertsLinearUVImpl(DrawList* draw_list, int32 vert_start_idx, int32 vert_end_idx, Vec2 a, Vec2 b, Vec2 uv_a, Vec2 uv_b, bool clamp);
        public static void ShadeVertsLinearUV(DrawList* draw_list, int32 vert_start_idx, int32 vert_end_idx, Vec2 a, Vec2 b, Vec2 uv_a, Vec2 uv_b, bool clamp) => ShadeVertsLinearUVImpl(draw_list, vert_start_idx, vert_end_idx, a, b, uv_a, uv_b, clamp);
        
        [LinkName("igShortcut")]
        private static extern bool ShortcutImpl(KeyChord key_chord, ID owner_id, InputFlags flags);
        public static bool Shortcut(KeyChord key_chord, ID owner_id = (ID) 0, InputFlags flags = (InputFlags) 0) => ShortcutImpl(key_chord, owner_id, flags);
        
        [LinkName("igShowAboutWindow")]
        private static extern void ShowAboutWindowImpl(bool* p_open);
        public static void ShowAboutWindow(bool* p_open = null) => ShowAboutWindowImpl(p_open);
        
        [LinkName("igShowDebugLogWindow")]
        private static extern void ShowDebugLogWindowImpl(bool* p_open);
        public static void ShowDebugLogWindow(bool* p_open = null) => ShowDebugLogWindowImpl(p_open);
        
        [LinkName("igShowDemoWindow")]
        private static extern void ShowDemoWindowImpl(bool* p_open);
        public static void ShowDemoWindow(bool* p_open = null) => ShowDemoWindowImpl(p_open);
        
        [LinkName("igShowFontAtlas")]
        private static extern void ShowFontAtlasImpl(FontAtlas* atlas);
        public static void ShowFontAtlas(FontAtlas* atlas) => ShowFontAtlasImpl(atlas);
        
        [LinkName("igShowFontSelector")]
        private static extern void ShowFontSelectorImpl(char* label);
        public static void ShowFontSelector(char* label) => ShowFontSelectorImpl(label);
        
        [LinkName("igShowMetricsWindow")]
        private static extern void ShowMetricsWindowImpl(bool* p_open);
        public static void ShowMetricsWindow(bool* p_open = null) => ShowMetricsWindowImpl(p_open);
        
        [LinkName("igShowStackToolWindow")]
        private static extern void ShowStackToolWindowImpl(bool* p_open);
        public static void ShowStackToolWindow(bool* p_open = null) => ShowStackToolWindowImpl(p_open);
        
        [LinkName("igShowStyleEditor")]
        private static extern void ShowStyleEditorImpl(Style* ref_);
        public static void ShowStyleEditor(Style* ref_ = null) => ShowStyleEditorImpl(ref_);
        
        [LinkName("igShowStyleSelector")]
        private static extern bool ShowStyleSelectorImpl(char* label);
        public static bool ShowStyleSelector(char* label) => ShowStyleSelectorImpl(label);
        
        [LinkName("igShowUserGuide")]
        private static extern void ShowUserGuideImpl();
        public static void ShowUserGuide() => ShowUserGuideImpl();
        
        [LinkName("igShrinkWidths")]
        private static extern void ShrinkWidthsImpl(ShrinkWidthItem* items, int32 count, float width_excess);
        public static void ShrinkWidths(ShrinkWidthItem* items, int32 count, float width_excess) => ShrinkWidthsImpl(items, count, width_excess);
        
        [LinkName("igShutdown")]
        private static extern void ShutdownImpl();
        public static void Shutdown() => ShutdownImpl();
        
        [LinkName("igSliderAngle")]
        private static extern bool SliderAngleImpl(char* label, float* v_rad, float v_degrees_min, float v_degrees_max, char* format, SliderFlags flags);
        public static bool SliderAngle(char* label, float* v_rad, float v_degrees_min = -360.0f, float v_degrees_max = +360.0f, char* format = "%.0f deg", SliderFlags flags = (SliderFlags) 0) => SliderAngleImpl(label, v_rad, v_degrees_min, v_degrees_max, format, flags);
        
        [LinkName("igSliderBehavior")]
        private static extern bool SliderBehaviorImpl(Rect bb, ID id, DataType data_type, void* p_v, void* p_min, void* p_max, char* format, SliderFlags flags, Rect* out_grab_bb);
        public static bool SliderBehavior(Rect bb, ID id, DataType data_type, void* p_v, void* p_min, void* p_max, char* format, SliderFlags flags, out Rect out_grab_bb)
        {
            out_grab_bb = ?;
            return SliderBehaviorImpl(bb, id, data_type, p_v, p_min, p_max, format, flags, &out_grab_bb);
        }
        
        [LinkName("igSliderFloat")]
        private static extern bool SliderFloatImpl(char* label, float* v, float v_min, float v_max, char* format, SliderFlags flags);
        public static bool SliderFloat(char* label, float* v, float v_min, float v_max, char* format = "%.3f", SliderFlags flags = (SliderFlags) 0) => SliderFloatImpl(label, v, v_min, v_max, format, flags);
        
        [LinkName("igSliderFloat2")]
        private static extern bool SliderFloat2Impl(char* label, float[2] v, float v_min, float v_max, char* format, SliderFlags flags);
        public static bool SliderFloat2(char* label, ref float[2] v, float v_min, float v_max, char* format = "%.3f", SliderFlags flags = (SliderFlags) 0) => SliderFloat2Impl(label, v, v_min, v_max, format, flags);
        
        [LinkName("igSliderFloat3")]
        private static extern bool SliderFloat3Impl(char* label, float[3] v, float v_min, float v_max, char* format, SliderFlags flags);
        public static bool SliderFloat3(char* label, ref float[3] v, float v_min, float v_max, char* format = "%.3f", SliderFlags flags = (SliderFlags) 0) => SliderFloat3Impl(label, v, v_min, v_max, format, flags);
        
        [LinkName("igSliderFloat4")]
        private static extern bool SliderFloat4Impl(char* label, float[4] v, float v_min, float v_max, char* format, SliderFlags flags);
        public static bool SliderFloat4(char* label, ref float[4] v, float v_min, float v_max, char* format = "%.3f", SliderFlags flags = (SliderFlags) 0) => SliderFloat4Impl(label, v, v_min, v_max, format, flags);
        
        [LinkName("igSliderInt")]
        private static extern bool SliderIntImpl(char* label, int32* v, int32 v_min, int32 v_max, char* format, SliderFlags flags);
        public static bool SliderInt(char* label, int32* v, int32 v_min, int32 v_max, char* format = "%d", SliderFlags flags = (SliderFlags) 0) => SliderIntImpl(label, v, v_min, v_max, format, flags);
        
        [LinkName("igSliderInt2")]
        private static extern bool SliderInt2Impl(char* label, int32[2] v, int32 v_min, int32 v_max, char* format, SliderFlags flags);
        public static bool SliderInt2(char* label, ref int32[2] v, int32 v_min, int32 v_max, char* format = "%d", SliderFlags flags = (SliderFlags) 0) => SliderInt2Impl(label, v, v_min, v_max, format, flags);
        
        [LinkName("igSliderInt3")]
        private static extern bool SliderInt3Impl(char* label, int32[3] v, int32 v_min, int32 v_max, char* format, SliderFlags flags);
        public static bool SliderInt3(char* label, ref int32[3] v, int32 v_min, int32 v_max, char* format = "%d", SliderFlags flags = (SliderFlags) 0) => SliderInt3Impl(label, v, v_min, v_max, format, flags);
        
        [LinkName("igSliderInt4")]
        private static extern bool SliderInt4Impl(char* label, int32[4] v, int32 v_min, int32 v_max, char* format, SliderFlags flags);
        public static bool SliderInt4(char* label, ref int32[4] v, int32 v_min, int32 v_max, char* format = "%d", SliderFlags flags = (SliderFlags) 0) => SliderInt4Impl(label, v, v_min, v_max, format, flags);
        
        [LinkName("igSliderScalar")]
        private static extern bool SliderScalarImpl(char* label, DataType data_type, void* p_data, void* p_min, void* p_max, char* format, SliderFlags flags);
        public static bool SliderScalar(char* label, DataType data_type, void* p_data, void* p_min, void* p_max, char* format = null, SliderFlags flags = (SliderFlags) 0) => SliderScalarImpl(label, data_type, p_data, p_min, p_max, format, flags);
        
        [LinkName("igSliderScalarN")]
        private static extern bool SliderScalarNImpl(char* label, DataType data_type, void* p_data, int32 components, void* p_min, void* p_max, char* format, SliderFlags flags);
        public static bool SliderScalarN(char* label, DataType data_type, void* p_data, int32 components, void* p_min, void* p_max, char* format = null, SliderFlags flags = (SliderFlags) 0) => SliderScalarNImpl(label, data_type, p_data, components, p_min, p_max, format, flags);
        
        [LinkName("igSmallButton")]
        private static extern bool SmallButtonImpl(char* label);
        public static bool SmallButton(char* label) => SmallButtonImpl(label);
        
        [LinkName("igSpacing")]
        private static extern void SpacingImpl();
        public static void Spacing() => SpacingImpl();
        
        [LinkName("igSplitterBehavior")]
        private static extern bool SplitterBehaviorImpl(Rect bb, ID id, Axis axis, float* size1, float* size2, float min_size1, float min_size2, float hover_extend, float hover_visibility_delay, U32 bg_col);
        public static bool SplitterBehavior(Rect bb, ID id, Axis axis, float* size1, float* size2, float min_size1, float min_size2, float hover_extend = (float) 0.0f, float hover_visibility_delay = (float) 0.0f, U32 bg_col = (U32) 0) => SplitterBehaviorImpl(bb, id, axis, size1, size2, min_size1, min_size2, hover_extend, hover_visibility_delay, bg_col);
        
        [LinkName("igStartMouseMovingWindow")]
        private static extern void StartMouseMovingWindowImpl(Window* window);
        public static void StartMouseMovingWindow(Window* window) => StartMouseMovingWindowImpl(window);
        
        [LinkName("igStartMouseMovingWindowOrNode")]
        private static extern void StartMouseMovingWindowOrNodeImpl(Window* window, DockNode* node, bool undock_floating_node);
        public static void StartMouseMovingWindowOrNode(Window* window, DockNode* node, bool undock_floating_node) => StartMouseMovingWindowOrNodeImpl(window, node, undock_floating_node);
        
        [LinkName("igStyleColorsClassic")]
        private static extern void StyleColorsClassicImpl(Style* dst);
        public static void StyleColorsClassic(Style* dst = null) => StyleColorsClassicImpl(dst);
        
        [LinkName("igStyleColorsDark")]
        private static extern void StyleColorsDarkImpl(Style* dst);
        public static void StyleColorsDark(Style* dst = null) => StyleColorsDarkImpl(dst);
        
        [LinkName("igStyleColorsLight")]
        private static extern void StyleColorsLightImpl(Style* dst);
        public static void StyleColorsLight(Style* dst = null) => StyleColorsLightImpl(dst);
        
        [LinkName("igTabBarAddTab")]
        private static extern void TabBarAddTabImpl(TabBar* tab_bar, TabItemFlags tab_flags, Window* window);
        public static void TabBarAddTab(TabBar* tab_bar, TabItemFlags tab_flags, Window* window) => TabBarAddTabImpl(tab_bar, tab_flags, window);
        
        [LinkName("igTabBarCloseTab")]
        private static extern void TabBarCloseTabImpl(TabBar* tab_bar, TabItem* tab);
        public static void TabBarCloseTab(TabBar* tab_bar, TabItem* tab) => TabBarCloseTabImpl(tab_bar, tab);
        
        [LinkName("igTabBarFindMostRecentlySelectedTabForActiveWindow")]
        private static extern TabItem* TabBarFindMostRecentlySelectedTabForActiveWindowImpl(TabBar* tab_bar);
        #if IMGUI_USE_REF
        public static ref TabItem TabBarFindMostRecentlySelectedTabForActiveWindow(TabBar* tab_bar) { return ref *TabBarFindMostRecentlySelectedTabForActiveWindowImpl(tab_bar); }
        #else
        public static TabItem* TabBarFindMostRecentlySelectedTabForActiveWindow(TabBar* tab_bar) => TabBarFindMostRecentlySelectedTabForActiveWindowImpl(tab_bar);
        #endif
        
        [LinkName("igTabBarFindTabByID")]
        private static extern TabItem* TabBarFindTabByIDImpl(TabBar* tab_bar, ID tab_id);
        #if IMGUI_USE_REF
        public static ref TabItem TabBarFindTabByID(TabBar* tab_bar, ID tab_id) { return ref *TabBarFindTabByIDImpl(tab_bar, tab_id); }
        #else
        public static TabItem* TabBarFindTabByID(TabBar* tab_bar, ID tab_id) => TabBarFindTabByIDImpl(tab_bar, tab_id);
        #endif
        
        [LinkName("igTabBarFindTabByOrder")]
        private static extern TabItem* TabBarFindTabByOrderImpl(TabBar* tab_bar, int32 order);
        #if IMGUI_USE_REF
        public static ref TabItem TabBarFindTabByOrder(TabBar* tab_bar, int32 order) { return ref *TabBarFindTabByOrderImpl(tab_bar, order); }
        #else
        public static TabItem* TabBarFindTabByOrder(TabBar* tab_bar, int32 order) => TabBarFindTabByOrderImpl(tab_bar, order);
        #endif
        
        [LinkName("igTabBarGetCurrentTab")]
        private static extern TabItem* TabBarGetCurrentTabImpl(TabBar* tab_bar);
        #if IMGUI_USE_REF
        public static ref TabItem TabBarGetCurrentTab(TabBar* tab_bar) { return ref *TabBarGetCurrentTabImpl(tab_bar); }
        #else
        public static TabItem* TabBarGetCurrentTab(TabBar* tab_bar) => TabBarGetCurrentTabImpl(tab_bar);
        #endif
        
        [LinkName("igTabBarGetTabName")]
        private static extern char* TabBarGetTabNameImpl(TabBar* tab_bar, TabItem* tab);
        #if IMGUI_USE_REF
        public static ref char TabBarGetTabName(TabBar* tab_bar, TabItem* tab) { return ref *TabBarGetTabNameImpl(tab_bar, tab); }
        #else
        public static char* TabBarGetTabName(TabBar* tab_bar, TabItem* tab) => TabBarGetTabNameImpl(tab_bar, tab);
        #endif
        
        [LinkName("igTabBarGetTabOrder")]
        private static extern int32 TabBarGetTabOrderImpl(TabBar* tab_bar, TabItem* tab);
        public static int32 TabBarGetTabOrder(TabBar* tab_bar, TabItem* tab) => TabBarGetTabOrderImpl(tab_bar, tab);
        
        [LinkName("igTabBarProcessReorder")]
        private static extern bool TabBarProcessReorderImpl(TabBar* tab_bar);
        public static bool TabBarProcessReorder(TabBar* tab_bar) => TabBarProcessReorderImpl(tab_bar);
        
        [LinkName("igTabBarQueueFocus")]
        private static extern void TabBarQueueFocusImpl(TabBar* tab_bar, TabItem* tab);
        public static void TabBarQueueFocus(TabBar* tab_bar, TabItem* tab) => TabBarQueueFocusImpl(tab_bar, tab);
        
        [LinkName("igTabBarQueueReorder")]
        private static extern void TabBarQueueReorderImpl(TabBar* tab_bar, TabItem* tab, int32 offset);
        public static void TabBarQueueReorder(TabBar* tab_bar, TabItem* tab, int32 offset) => TabBarQueueReorderImpl(tab_bar, tab, offset);
        
        [LinkName("igTabBarQueueReorderFromMousePos")]
        private static extern void TabBarQueueReorderFromMousePosImpl(TabBar* tab_bar, TabItem* tab, Vec2 mouse_pos);
        public static void TabBarQueueReorderFromMousePos(TabBar* tab_bar, TabItem* tab, Vec2 mouse_pos) => TabBarQueueReorderFromMousePosImpl(tab_bar, tab, mouse_pos);
        
        [LinkName("igTabBarRemoveTab")]
        private static extern void TabBarRemoveTabImpl(TabBar* tab_bar, ID tab_id);
        public static void TabBarRemoveTab(TabBar* tab_bar, ID tab_id) => TabBarRemoveTabImpl(tab_bar, tab_id);
        
        [LinkName("igTabItemBackground")]
        private static extern void TabItemBackgroundImpl(DrawList* draw_list, Rect bb, TabItemFlags flags, U32 col);
        public static void TabItemBackground(DrawList* draw_list, Rect bb, TabItemFlags flags, U32 col) => TabItemBackgroundImpl(draw_list, bb, flags, col);
        
        [LinkName("igTabItemButton")]
        private static extern bool TabItemButtonImpl(char* label, TabItemFlags flags);
        public static bool TabItemButton(char* label, TabItemFlags flags = (TabItemFlags) 0) => TabItemButtonImpl(label, flags);
        
        [LinkName("igTabItemCalcSize_Str")]
        private static extern Vec2 TabItemCalcSizeImpl(Vec2* pOut, char* label, bool has_close_button_or_unsaved_marker);
        public static Vec2 TabItemCalcSize(char* label, bool has_close_button_or_unsaved_marker)
        {
            Vec2 pOut = default;
            TabItemCalcSizeImpl(&pOut, label, has_close_button_or_unsaved_marker);
            return pOut;
        }
        
        [LinkName("igTabItemCalcSize_WindowPtr")]
        private static extern Vec2 TabItemCalcSizeImpl(Vec2* pOut, Window* window);
        public static Vec2 TabItemCalcSize(Window* window)
        {
            Vec2 pOut = default;
            TabItemCalcSizeImpl(&pOut, window);
            return pOut;
        }
        
        [LinkName("igTabItemEx")]
        private static extern bool TabItemExImpl(TabBar* tab_bar, char* label, bool* p_open, TabItemFlags flags, Window* docked_window);
        public static bool TabItemEx(TabBar* tab_bar, char* label, bool* p_open, TabItemFlags flags, Window* docked_window) => TabItemExImpl(tab_bar, label, p_open, flags, docked_window);
        
        [LinkName("igTabItemLabelAndCloseButton")]
        private static extern void TabItemLabelAndCloseButtonImpl(DrawList* draw_list, Rect bb, TabItemFlags flags, Vec2 frame_padding, char* label, ID tab_id, ID close_button_id, bool is_contents_visible, bool* out_just_closed, bool* out_text_clipped);
        public static void TabItemLabelAndCloseButton(DrawList* draw_list, Rect bb, TabItemFlags flags, Vec2 frame_padding, char* label, ID tab_id, ID close_button_id, bool is_contents_visible, out bool out_just_closed, out bool out_text_clipped)
        {
            out_just_closed = ?;
            out_text_clipped = ?;
        }
        
        [LinkName("igTableBeginApplyRequests")]
        private static extern void TableBeginApplyRequestsImpl(Table* table);
        public static void TableBeginApplyRequests(Table* table) => TableBeginApplyRequestsImpl(table);
        
        [LinkName("igTableBeginCell")]
        private static extern void TableBeginCellImpl(Table* table, int32 column_n);
        public static void TableBeginCell(Table* table, int32 column_n) => TableBeginCellImpl(table, column_n);
        
        [LinkName("igTableBeginContextMenuPopup")]
        private static extern bool TableBeginContextMenuPopupImpl(Table* table);
        public static bool TableBeginContextMenuPopup(Table* table) => TableBeginContextMenuPopupImpl(table);
        
        [LinkName("igTableBeginInitMemory")]
        private static extern void TableBeginInitMemoryImpl(Table* table, int32 columns_count);
        public static void TableBeginInitMemory(Table* table, int32 columns_count) => TableBeginInitMemoryImpl(table, columns_count);
        
        [LinkName("igTableBeginRow")]
        private static extern void TableBeginRowImpl(Table* table);
        public static void TableBeginRow(Table* table) => TableBeginRowImpl(table);
        
        [LinkName("igTableDrawBorders")]
        private static extern void TableDrawBordersImpl(Table* table);
        public static void TableDrawBorders(Table* table) => TableDrawBordersImpl(table);
        
        [LinkName("igTableDrawContextMenu")]
        private static extern void TableDrawContextMenuImpl(Table* table);
        public static void TableDrawContextMenu(Table* table) => TableDrawContextMenuImpl(table);
        
        [LinkName("igTableEndCell")]
        private static extern void TableEndCellImpl(Table* table);
        public static void TableEndCell(Table* table) => TableEndCellImpl(table);
        
        [LinkName("igTableEndRow")]
        private static extern void TableEndRowImpl(Table* table);
        public static void TableEndRow(Table* table) => TableEndRowImpl(table);
        
        [LinkName("igTableFindByID")]
        private static extern Table* TableFindByIDImpl(ID id);
        #if IMGUI_USE_REF
        public static ref Table TableFindByID(ID id) { return ref *TableFindByIDImpl(id); }
        #else
        public static Table* TableFindByID(ID id) => TableFindByIDImpl(id);
        #endif
        
        [LinkName("igTableFixColumnSortDirection")]
        private static extern void TableFixColumnSortDirectionImpl(Table* table, TableColumn* column);
        public static void TableFixColumnSortDirection(Table* table, TableColumn* column) => TableFixColumnSortDirectionImpl(table, column);
        
        [LinkName("igTableGcCompactSettings")]
        private static extern void TableGcCompactSettingsImpl();
        public static void TableGcCompactSettings() => TableGcCompactSettingsImpl();
        
        [LinkName("igTableGcCompactTransientBuffers_TablePtr")]
        private static extern void TableGcCompactTransientBuffersImpl(Table* table);
        public static void TableGcCompactTransientBuffers(Table* table) => TableGcCompactTransientBuffersImpl(table);
        
        [LinkName("igTableGcCompactTransientBuffers_TableTempDataPtr")]
        private static extern void TableGcCompactTransientBuffersImpl(TableTempData* table);
        public static void TableGcCompactTransientBuffers(TableTempData* table) => TableGcCompactTransientBuffersImpl(table);
        
        [LinkName("igTableGetBoundSettings")]
        private static extern TableSettings* TableGetBoundSettingsImpl(Table* table);
        #if IMGUI_USE_REF
        public static ref TableSettings TableGetBoundSettings(Table* table) { return ref *TableGetBoundSettingsImpl(table); }
        #else
        public static TableSettings* TableGetBoundSettings(Table* table) => TableGetBoundSettingsImpl(table);
        #endif
        
        [LinkName("igTableGetCellBgRect")]
        private static extern Rect TableGetCellBgRectImpl(Rect* pOut, Table* table, int32 column_n);
        public static Rect TableGetCellBgRect(Table* table, int32 column_n)
        {
            Rect pOut = default;
            TableGetCellBgRectImpl(&pOut, table, column_n);
            return pOut;
        }
        
        [LinkName("igTableGetColumnCount")]
        private static extern int32 TableGetColumnCountImpl();
        public static int32 TableGetColumnCount() => TableGetColumnCountImpl();
        
        [LinkName("igTableGetColumnFlags")]
        private static extern TableColumnFlags TableGetColumnFlagsImpl(int32 column_n);
        public static TableColumnFlags TableGetColumnFlags(int32 column_n = -1) => TableGetColumnFlagsImpl(column_n);
        
        [LinkName("igTableGetColumnIndex")]
        private static extern int32 TableGetColumnIndexImpl();
        public static int32 TableGetColumnIndex() => TableGetColumnIndexImpl();
        
        [LinkName("igTableGetColumnName_Int")]
        private static extern char* TableGetColumnNameImpl(int32 column_n);
        #if IMGUI_USE_REF
        public static ref char TableGetColumnName(int32 column_n = -1) { return ref *TableGetColumnNameImpl(column_n); }
        #else
        public static char* TableGetColumnName(int32 column_n = -1) => TableGetColumnNameImpl(column_n);
        #endif
        
        [LinkName("igTableGetColumnName_TablePtr")]
        private static extern char* TableGetColumnNameImpl(Table* table, int32 column_n);
        #if IMGUI_USE_REF
        public static ref char TableGetColumnName(Table* table, int32 column_n) { return ref *TableGetColumnNameImpl(table, column_n); }
        #else
        public static char* TableGetColumnName(Table* table, int32 column_n) => TableGetColumnNameImpl(table, column_n);
        #endif
        
        [LinkName("igTableGetColumnNextSortDirection")]
        private static extern SortDirection TableGetColumnNextSortDirectionImpl(TableColumn* column);
        public static SortDirection TableGetColumnNextSortDirection(TableColumn* column) => TableGetColumnNextSortDirectionImpl(column);
        
        [LinkName("igTableGetColumnResizeID")]
        private static extern ID TableGetColumnResizeIDImpl(Table* table, int32 column_n, int32 instance_no);
        public static ID TableGetColumnResizeID(Table* table, int32 column_n, int32 instance_no = (int32) 0) => TableGetColumnResizeIDImpl(table, column_n, instance_no);
        
        [LinkName("igTableGetColumnWidthAuto")]
        private static extern float TableGetColumnWidthAutoImpl(Table* table, TableColumn* column);
        public static float TableGetColumnWidthAuto(Table* table, TableColumn* column) => TableGetColumnWidthAutoImpl(table, column);
        
        [LinkName("igTableGetHeaderRowHeight")]
        private static extern float TableGetHeaderRowHeightImpl();
        public static float TableGetHeaderRowHeight() => TableGetHeaderRowHeightImpl();
        
        [LinkName("igTableGetHoveredColumn")]
        private static extern int32 TableGetHoveredColumnImpl();
        public static int32 TableGetHoveredColumn() => TableGetHoveredColumnImpl();
        
        [LinkName("igTableGetInstanceData")]
        private static extern TableInstanceData* TableGetInstanceDataImpl(Table* table, int32 instance_no);
        #if IMGUI_USE_REF
        public static ref TableInstanceData TableGetInstanceData(Table* table, int32 instance_no) { return ref *TableGetInstanceDataImpl(table, instance_no); }
        #else
        public static TableInstanceData* TableGetInstanceData(Table* table, int32 instance_no) => TableGetInstanceDataImpl(table, instance_no);
        #endif
        
        [LinkName("igTableGetInstanceID")]
        private static extern ID TableGetInstanceIDImpl(Table* table, int32 instance_no);
        public static ID TableGetInstanceID(Table* table, int32 instance_no) => TableGetInstanceIDImpl(table, instance_no);
        
        [LinkName("igTableGetMaxColumnWidth")]
        private static extern float TableGetMaxColumnWidthImpl(Table* table, int32 column_n);
        public static float TableGetMaxColumnWidth(Table* table, int32 column_n) => TableGetMaxColumnWidthImpl(table, column_n);
        
        [LinkName("igTableGetRowIndex")]
        private static extern int32 TableGetRowIndexImpl();
        public static int32 TableGetRowIndex() => TableGetRowIndexImpl();
        
        [LinkName("igTableGetSortSpecs")]
        private static extern TableSortSpecs* TableGetSortSpecsImpl();
        #if IMGUI_USE_REF
        public static ref TableSortSpecs TableGetSortSpecs() { return ref *TableGetSortSpecsImpl(); }
        #else
        public static TableSortSpecs* TableGetSortSpecs() => TableGetSortSpecsImpl();
        #endif
        
        [LinkName("igTableHeader")]
        private static extern void TableHeaderImpl(char* label);
        public static void TableHeader(char* label) => TableHeaderImpl(label);
        
        [LinkName("igTableHeadersRow")]
        private static extern void TableHeadersRowImpl();
        public static void TableHeadersRow() => TableHeadersRowImpl();
        
        [LinkName("igTableLoadSettings")]
        private static extern void TableLoadSettingsImpl(Table* table);
        public static void TableLoadSettings(Table* table) => TableLoadSettingsImpl(table);
        
        [LinkName("igTableMergeDrawChannels")]
        private static extern void TableMergeDrawChannelsImpl(Table* table);
        public static void TableMergeDrawChannels(Table* table) => TableMergeDrawChannelsImpl(table);
        
        [LinkName("igTableNextColumn")]
        private static extern bool TableNextColumnImpl();
        public static bool TableNextColumn() => TableNextColumnImpl();
        
        [LinkName("igTableNextRow")]
        private static extern void TableNextRowImpl(TableRowFlags row_flags, float min_row_height);
        public static void TableNextRow(TableRowFlags row_flags = (TableRowFlags) 0, float min_row_height = (float) 0.0f) => TableNextRowImpl(row_flags, min_row_height);
        
        [LinkName("igTableOpenContextMenu")]
        private static extern void TableOpenContextMenuImpl(int32 column_n);
        public static void TableOpenContextMenu(int32 column_n = -1) => TableOpenContextMenuImpl(column_n);
        
        [LinkName("igTablePopBackgroundChannel")]
        private static extern void TablePopBackgroundChannelImpl();
        public static void TablePopBackgroundChannel() => TablePopBackgroundChannelImpl();
        
        [LinkName("igTablePushBackgroundChannel")]
        private static extern void TablePushBackgroundChannelImpl();
        public static void TablePushBackgroundChannel() => TablePushBackgroundChannelImpl();
        
        [LinkName("igTableRemove")]
        private static extern void TableRemoveImpl(Table* table);
        public static void TableRemove(Table* table) => TableRemoveImpl(table);
        
        [LinkName("igTableResetSettings")]
        private static extern void TableResetSettingsImpl(Table* table);
        public static void TableResetSettings(Table* table) => TableResetSettingsImpl(table);
        
        [LinkName("igTableSaveSettings")]
        private static extern void TableSaveSettingsImpl(Table* table);
        public static void TableSaveSettings(Table* table) => TableSaveSettingsImpl(table);
        
        [LinkName("igTableSetBgColor")]
        private static extern void TableSetBgColorImpl(TableBgTarget target, U32 color, int32 column_n);
        public static void TableSetBgColor(TableBgTarget target, U32 color, int32 column_n = -1) => TableSetBgColorImpl(target, color, column_n);
        
        [LinkName("igTableSetColumnEnabled")]
        private static extern void TableSetColumnEnabledImpl(int32 column_n, bool v);
        public static void TableSetColumnEnabled(int32 column_n, bool v) => TableSetColumnEnabledImpl(column_n, v);
        
        [LinkName("igTableSetColumnIndex")]
        private static extern bool TableSetColumnIndexImpl(int32 column_n);
        public static bool TableSetColumnIndex(int32 column_n) => TableSetColumnIndexImpl(column_n);
        
        [LinkName("igTableSetColumnSortDirection")]
        private static extern void TableSetColumnSortDirectionImpl(int32 column_n, SortDirection sort_direction, bool append_to_sort_specs);
        public static void TableSetColumnSortDirection(int32 column_n, SortDirection sort_direction, bool append_to_sort_specs) => TableSetColumnSortDirectionImpl(column_n, sort_direction, append_to_sort_specs);
        
        [LinkName("igTableSetColumnWidth")]
        private static extern void TableSetColumnWidthImpl(int32 column_n, float width);
        public static void TableSetColumnWidth(int32 column_n, float width) => TableSetColumnWidthImpl(column_n, width);
        
        [LinkName("igTableSetColumnWidthAutoAll")]
        private static extern void TableSetColumnWidthAutoAllImpl(Table* table);
        public static void TableSetColumnWidthAutoAll(Table* table) => TableSetColumnWidthAutoAllImpl(table);
        
        [LinkName("igTableSetColumnWidthAutoSingle")]
        private static extern void TableSetColumnWidthAutoSingleImpl(Table* table, int32 column_n);
        public static void TableSetColumnWidthAutoSingle(Table* table, int32 column_n) => TableSetColumnWidthAutoSingleImpl(table, column_n);
        
        [LinkName("igTableSettingsAddSettingsHandler")]
        private static extern void TableSettingsAddSettingsHandlerImpl();
        public static void TableSettingsAddSettingsHandler() => TableSettingsAddSettingsHandlerImpl();
        
        [LinkName("igTableSettingsCreate")]
        private static extern TableSettings* TableSettingsCreateImpl(ID id, int32 columns_count);
        #if IMGUI_USE_REF
        public static ref TableSettings TableSettingsCreate(ID id, int32 columns_count) { return ref *TableSettingsCreateImpl(id, columns_count); }
        #else
        public static TableSettings* TableSettingsCreate(ID id, int32 columns_count) => TableSettingsCreateImpl(id, columns_count);
        #endif
        
        [LinkName("igTableSettingsFindByID")]
        private static extern TableSettings* TableSettingsFindByIDImpl(ID id);
        #if IMGUI_USE_REF
        public static ref TableSettings TableSettingsFindByID(ID id) { return ref *TableSettingsFindByIDImpl(id); }
        #else
        public static TableSettings* TableSettingsFindByID(ID id) => TableSettingsFindByIDImpl(id);
        #endif
        
        [LinkName("igTableSetupColumn")]
        private static extern void TableSetupColumnImpl(char* label, TableColumnFlags flags, float init_width_or_weight, ID user_id);
        public static void TableSetupColumn(char* label, TableColumnFlags flags = (TableColumnFlags) 0, float init_width_or_weight = (float) 0.0f, ID user_id = (ID) 0) => TableSetupColumnImpl(label, flags, init_width_or_weight, user_id);
        
        [LinkName("igTableSetupDrawChannels")]
        private static extern void TableSetupDrawChannelsImpl(Table* table);
        public static void TableSetupDrawChannels(Table* table) => TableSetupDrawChannelsImpl(table);
        
        [LinkName("igTableSetupScrollFreeze")]
        private static extern void TableSetupScrollFreezeImpl(int32 cols, int32 rows);
        public static void TableSetupScrollFreeze(int32 cols, int32 rows) => TableSetupScrollFreezeImpl(cols, rows);
        
        [LinkName("igTableSortSpecsBuild")]
        private static extern void TableSortSpecsBuildImpl(Table* table);
        public static void TableSortSpecsBuild(Table* table) => TableSortSpecsBuildImpl(table);
        
        [LinkName("igTableSortSpecsSanitize")]
        private static extern void TableSortSpecsSanitizeImpl(Table* table);
        public static void TableSortSpecsSanitize(Table* table) => TableSortSpecsSanitizeImpl(table);
        
        [LinkName("igTableUpdateBorders")]
        private static extern void TableUpdateBordersImpl(Table* table);
        public static void TableUpdateBorders(Table* table) => TableUpdateBordersImpl(table);
        
        [LinkName("igTableUpdateColumnsWeightFromWidth")]
        private static extern void TableUpdateColumnsWeightFromWidthImpl(Table* table);
        public static void TableUpdateColumnsWeightFromWidth(Table* table) => TableUpdateColumnsWeightFromWidthImpl(table);
        
        [LinkName("igTableUpdateLayout")]
        private static extern void TableUpdateLayoutImpl(Table* table);
        public static void TableUpdateLayout(Table* table) => TableUpdateLayoutImpl(table);
        
        [LinkName("igTempInputIsActive")]
        private static extern bool TempInputIsActiveImpl(ID id);
        public static bool TempInputIsActive(ID id) => TempInputIsActiveImpl(id);
        
        [LinkName("igTempInputScalar")]
        private static extern bool TempInputScalarImpl(Rect bb, ID id, char* label, DataType data_type, void* p_data, char* format, void* p_clamp_min, void* p_clamp_max);
        public static bool TempInputScalar(Rect bb, ID id, char* label, DataType data_type, void* p_data, char* format, void* p_clamp_min = null, void* p_clamp_max = null) => TempInputScalarImpl(bb, id, label, data_type, p_data, format, p_clamp_min, p_clamp_max);
        
        [LinkName("igTempInputText")]
        private static extern bool TempInputTextImpl(Rect bb, ID id, char* label, char* buf, int32 buf_size, InputTextFlags flags);
        public static bool TempInputText(Rect bb, ID id, char* label, char* buf, int32 buf_size, InputTextFlags flags) => TempInputTextImpl(bb, id, label, buf, buf_size, flags);
        
        [LinkName("igTestKeyOwner")]
        private static extern bool TestKeyOwnerImpl(Key key, ID owner_id);
        public static bool TestKeyOwner(Key key, ID owner_id) => TestKeyOwnerImpl(key, owner_id);
        
        [LinkName("igTestShortcutRouting")]
        private static extern bool TestShortcutRoutingImpl(KeyChord key_chord, ID owner_id);
        public static bool TestShortcutRouting(KeyChord key_chord, ID owner_id) => TestShortcutRoutingImpl(key_chord, owner_id);
        
        [LinkName("igText")]
        private static extern void TextImpl(char* fmt, ...);
        public static void Text(char* fmt, params Object[] args) => TextImpl(scope String()..AppendF(StringView(fmt), params args));
        
        [LinkName("igTextColored")]
        private static extern void TextColoredImpl(Vec4 col, char* fmt, ...);
        public static void TextColored(Vec4 col, char* fmt, params Object[] args) => TextColoredImpl(col, scope String()..AppendF(StringView(fmt), params args));
        
        [LinkName("igTextDisabled")]
        private static extern void TextDisabledImpl(char* fmt, ...);
        public static void TextDisabled(char* fmt, params Object[] args) => TextDisabledImpl(scope String()..AppendF(StringView(fmt), params args));
        
        [LinkName("igTextEx")]
        private static extern void TextExImpl(char* text, char* text_end, TextFlags flags);
        public static void TextEx(char* text, char* text_end = null, TextFlags flags = (TextFlags) 0) => TextExImpl(text, text_end, flags);
        
        [LinkName("igTextUnformatted")]
        private static extern void TextUnformattedImpl(char* text, char* text_end);
        public static void TextUnformatted(char* text, char* text_end = null) => TextUnformattedImpl(text, text_end);
        
        [LinkName("igTextWrapped")]
        private static extern void TextWrappedImpl(char* fmt, ...);
        public static void TextWrapped(char* fmt, params Object[] args) => TextWrappedImpl(scope String()..AppendF(StringView(fmt), params args));
        
        [LinkName("igTranslateWindowsInViewport")]
        private static extern void TranslateWindowsInViewportImpl(ViewportP* viewport, Vec2 old_pos, Vec2 new_pos);
        public static void TranslateWindowsInViewport(ViewportP* viewport, Vec2 old_pos, Vec2 new_pos) => TranslateWindowsInViewportImpl(viewport, old_pos, new_pos);
        
        [LinkName("igTreeNode_Str")]
        private static extern bool TreeNodeImpl(char* label);
        public static bool TreeNode(char* label) => TreeNodeImpl(label);
        
        [LinkName("igTreeNode_StrStr")]
        private static extern bool TreeNodeImpl(char* str_id, char* fmt, ...);
        public static bool TreeNode(char* str_id, char* fmt, params Object[] args) => TreeNodeImpl(str_id, scope String()..AppendF(StringView(fmt), params args));
        
        [LinkName("igTreeNode_Ptr")]
        private static extern bool TreeNodeImpl(void* ptr_id, char* fmt, ...);
        public static bool TreeNode(void* ptr_id, char* fmt, params Object[] args) => TreeNodeImpl(ptr_id, scope String()..AppendF(StringView(fmt), params args));
        
        [LinkName("igTreeNodeBehavior")]
        private static extern bool TreeNodeBehaviorImpl(ID id, TreeNodeFlags flags, char* label, char* label_end);
        public static bool TreeNodeBehavior(ID id, TreeNodeFlags flags, char* label, char* label_end = null) => TreeNodeBehaviorImpl(id, flags, label, label_end);
        
        [LinkName("igTreeNodeEx_Str")]
        private static extern bool TreeNodeExImpl(char* label, TreeNodeFlags flags);
        public static bool TreeNodeEx(char* label, TreeNodeFlags flags = (TreeNodeFlags) 0) => TreeNodeExImpl(label, flags);
        
        [LinkName("igTreeNodeEx_StrStr")]
        private static extern bool TreeNodeExImpl(char* str_id, TreeNodeFlags flags, char* fmt, ...);
        public static bool TreeNodeEx(char* str_id, TreeNodeFlags flags, char* fmt, params Object[] args) => TreeNodeExImpl(str_id, flags, scope String()..AppendF(StringView(fmt), params args));
        
        [LinkName("igTreeNodeEx_Ptr")]
        private static extern bool TreeNodeExImpl(void* ptr_id, TreeNodeFlags flags, char* fmt, ...);
        public static bool TreeNodeEx(void* ptr_id, TreeNodeFlags flags, char* fmt, params Object[] args) => TreeNodeExImpl(ptr_id, flags, scope String()..AppendF(StringView(fmt), params args));
        
        [LinkName("igTreeNodeSetOpen")]
        private static extern void TreeNodeSetOpenImpl(ID id, bool open);
        public static void TreeNodeSetOpen(ID id, bool open) => TreeNodeSetOpenImpl(id, open);
        
        [LinkName("igTreeNodeUpdateNextOpen")]
        private static extern bool TreeNodeUpdateNextOpenImpl(ID id, TreeNodeFlags flags);
        public static bool TreeNodeUpdateNextOpen(ID id, TreeNodeFlags flags) => TreeNodeUpdateNextOpenImpl(id, flags);
        
        [LinkName("igTreePop")]
        private static extern void TreePopImpl();
        public static void TreePop() => TreePopImpl();
        
        [LinkName("igTreePush_Str")]
        private static extern void TreePushImpl(char* str_id);
        public static void TreePush(char* str_id) => TreePushImpl(str_id);
        
        [LinkName("igTreePush_Ptr")]
        private static extern void TreePushImpl(void* ptr_id);
        public static void TreePush(void* ptr_id) => TreePushImpl(ptr_id);
        
        [LinkName("igTreePushOverrideID")]
        private static extern void TreePushOverrideIDImpl(ID id);
        public static void TreePushOverrideID(ID id) => TreePushOverrideIDImpl(id);
        
        [LinkName("igUnindent")]
        private static extern void UnindentImpl(float indent_w);
        public static void Unindent(float indent_w = (float) 0.0f) => UnindentImpl(indent_w);
        
        [LinkName("igUpdateHoveredWindowAndCaptureFlags")]
        private static extern void UpdateHoveredWindowAndCaptureFlagsImpl();
        public static void UpdateHoveredWindowAndCaptureFlags() => UpdateHoveredWindowAndCaptureFlagsImpl();
        
        [LinkName("igUpdateInputEvents")]
        private static extern void UpdateInputEventsImpl(bool trickle_fast_inputs);
        public static void UpdateInputEvents(bool trickle_fast_inputs) => UpdateInputEventsImpl(trickle_fast_inputs);
        
        [LinkName("igUpdateMouseMovingWindowEndFrame")]
        private static extern void UpdateMouseMovingWindowEndFrameImpl();
        public static void UpdateMouseMovingWindowEndFrame() => UpdateMouseMovingWindowEndFrameImpl();
        
        [LinkName("igUpdateMouseMovingWindowNewFrame")]
        private static extern void UpdateMouseMovingWindowNewFrameImpl();
        public static void UpdateMouseMovingWindowNewFrame() => UpdateMouseMovingWindowNewFrameImpl();
        
        [LinkName("igUpdatePlatformWindows")]
        private static extern void UpdatePlatformWindowsImpl();
        public static void UpdatePlatformWindows() => UpdatePlatformWindowsImpl();
        
        [LinkName("igUpdateWindowParentAndRootLinks")]
        private static extern void UpdateWindowParentAndRootLinksImpl(Window* window, WindowFlags flags, Window* parent_window);
        public static void UpdateWindowParentAndRootLinks(Window* window, WindowFlags flags, Window* parent_window) => UpdateWindowParentAndRootLinksImpl(window, flags, parent_window);
        
        [LinkName("igVSliderFloat")]
        private static extern bool VSliderFloatImpl(char* label, Vec2 size, float* v, float v_min, float v_max, char* format, SliderFlags flags);
        public static bool VSliderFloat(char* label, Vec2 size, float* v, float v_min, float v_max, char* format = "%.3f", SliderFlags flags = (SliderFlags) 0) => VSliderFloatImpl(label, size, v, v_min, v_max, format, flags);
        
        [LinkName("igVSliderInt")]
        private static extern bool VSliderIntImpl(char* label, Vec2 size, int32* v, int32 v_min, int32 v_max, char* format, SliderFlags flags);
        public static bool VSliderInt(char* label, Vec2 size, int32* v, int32 v_min, int32 v_max, char* format = "%d", SliderFlags flags = (SliderFlags) 0) => VSliderIntImpl(label, size, v, v_min, v_max, format, flags);
        
        [LinkName("igVSliderScalar")]
        private static extern bool VSliderScalarImpl(char* label, Vec2 size, DataType data_type, void* p_data, void* p_min, void* p_max, char* format, SliderFlags flags);
        public static bool VSliderScalar(char* label, Vec2 size, DataType data_type, void* p_data, void* p_min, void* p_max, char* format = null, SliderFlags flags = (SliderFlags) 0) => VSliderScalarImpl(label, size, data_type, p_data, p_min, p_max, format, flags);
        
        [LinkName("igValue_Bool")]
        private static extern void ValueImpl(char* prefix, bool b);
        public static void Value(char* prefix, bool b) => ValueImpl(prefix, b);
        
        [LinkName("igValue_Int")]
        private static extern void ValueImpl(char* prefix, int32 v);
        public static void Value(char* prefix, int32 v) => ValueImpl(prefix, v);
        
        [LinkName("igValue_Uint")]
        private static extern void ValueImpl(char* prefix, uint32 v);
        public static void Value(char* prefix, uint32 v) => ValueImpl(prefix, v);
        
        [LinkName("igValue_Float")]
        private static extern void ValueImpl(char* prefix, float v, char* float_format);
        public static void Value(char* prefix, float v, char* float_format = null) => ValueImpl(prefix, v, float_format);
        
        [LinkName("igWindowRectAbsToRel")]
        private static extern Rect WindowRectAbsToRelImpl(Rect* pOut, Window* window, Rect r);
        public static Rect WindowRectAbsToRel(Window* window, Rect r)
        {
            Rect pOut = default;
            WindowRectAbsToRelImpl(&pOut, window, r);
            return pOut;
        }
        
        [LinkName("igWindowRectRelToAbs")]
        private static extern Rect WindowRectRelToAbsImpl(Rect* pOut, Window* window, Rect r);
        public static Rect WindowRectRelToAbs(Window* window, Rect r)
        {
            Rect pOut = default;
            WindowRectRelToAbsImpl(&pOut, window, r);
            return pOut;
        }
    }
}