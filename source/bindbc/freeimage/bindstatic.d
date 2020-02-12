
//          Copyright Michael D. Parker 2018.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

module bindbc.freeimage.bindstatic;

version(BindFI_Static):

import core.stdc.config,
       core.stdc.stddef;
import bindbc.freeimage.types;

extern(System) @nogc nothrow {
	void FreeImage_Initialise(BOOL load_local_plugins_only = FALSE);
	void FreeImage_DeInitialise();
	const(char)* FreeImage_GetVersion();
	const(char)* FreeImage_GetCopyrightMessage();
	void FreeImage_SetOutputMessageStdCall(FreeImage_OutputMessageFunctionStdCall);
	void FreeImage_SetOutputMessage(FreeImage_OutputMessageFunction);
	void FreeImage_OutputMessageProc(int,const(char)*, ...);
	FIBITMAP* FreeImage_Allocate(int,int,int,uint red_mask = 0,uint green_mask = 0,uint blue_mask = 0);
	FIBITMAP* FreeImage_AllocateT(FREE_IMAGE_TYPE type,int,int,int = 8,uint red_mask = 0,uint green_mask = 0,uint blue_mask = 0);
	FIBITMAP* FreeImage_Clone(FIBITMAP*);
	void FreeImage_Unload(FIBITMAP*);
	BOOL FreeImage_HasPixels(FIBITMAP*);
	FIBITMAP* FreeImage_Load(FREE_IMAGE_FORMAT,const(char)*,int flags = 0);
	FIBITMAP* FreeImage_LoadU(FREE_IMAGE_FORMAT,const(wchar_t)*,int flags = 0);
	FIBITMAP* FreeImage_LoadFromHandle(FREE_IMAGE_FORMAT,FreeImageIO*, fi_handle,int flags = 0);
	BOOL FreeImage_Save(FREE_IMAGE_FORMAT,FIBITMAP*,const(char)*,int flags = 0);
	BOOL FreeImage_SaveU(FREE_IMAGE_FORMAT,FIBITMAP*,const(wchar_t)*,int flags = 0);
	BOOL FreeImage_SaveToHandle(FREE_IMAGE_FORMAT,FIBITMAP*,FreeImageIO*, fi_handle,int flags = 0);
	FIMEMORY* FreeImage_OpenMemory(BYTE* data = null,DWORD size_in_bytes = 0);
	void FreeImage_CloseMemory(FIMEMORY* stream);
	FIBITMAP* FreeImage_LoadFromMemory(FREE_IMAGE_FORMAT,FIMEMORY*,int flags = 0);
	BOOL FreeImage_SaveToMemory(FREE_IMAGE_FORMAT,FIBITMAP*,FIMEMORY*,int flags = 0);
	c_long FreeImage_TellMemory(FIMEMORY*);
	BOOL FreeImage_SeekMemory(FIMEMORY*, c_long,int);
	BOOL FreeImage_AcquireMemory(FIMEMORY*,BYTE**,DWORD*);
	uint FreeImage_ReadMemory(void*,uint,uint,FIMEMORY*);
	uint FreeImage_WriteMemory(const(void*),uint,uint,FIMEMORY*);
	FIMULTIBITMAP* FreeImage_LoadMultiBitmapFromMemory(FREE_IMAGE_FORMAT fif,FIMEMORY*,int flags = 0);
	BOOL FreeImage_SaveMultiBitmapToMemory(FREE_IMAGE_FORMAT, FIMULTIBITMAP* bitmap,FIMEMORY*,int flags);
	FREE_IMAGE_FORMAT FreeImage_RegisterLocalPlugin(FI_InitProc,const(char)* format = null,const(char)* description = null,const(char)* extension = null,const(char)* regexpr = null);

    version(Windows) {
        FREE_IMAGE_FORMAT _FreeImage_RegisterExternalPlugin(const(char)*,const(char)* format = null,const(char)* description = null,const(char)* extension = null,const(char)* regexpr = null);
    }

   int FreeImage_GetFIFCount();
	int FreeImage_SetPluginEnabled(FREE_IMAGE_FORMAT,BOOL);
	int FreeImage_IsPluginEnabled(FREE_IMAGE_FORMAT);
	FREE_IMAGE_FORMAT FreeImage_GetFIFFromFormat(const(char)*);
	FREE_IMAGE_FORMAT FreeImage_GetFIFFromMime(const(char)*);
	const(char)* FreeImage_GetFormatFromFIF(FREE_IMAGE_FORMAT);
	const(char)* FreeImage_GetFIFExtensionList(FREE_IMAGE_FORMAT);
	const(char)* FreeImage_GetFIFDescription(FREE_IMAGE_FORMAT);
	const(char)* FreeImage_GetFIFRegExpr(FREE_IMAGE_FORMAT);
	const(char)* FreeImage_GetFIFMimeType(FREE_IMAGE_FORMAT);
	FREE_IMAGE_FORMAT FreeImage_GetFIFFromFilename(const(char)*);
	FREE_IMAGE_FORMAT FreeImage_GetFIFFromFilenameU(const(wchar_t)*);
	BOOL FreeImage_FIFSupportsReading(FREE_IMAGE_FORMAT);
	BOOL FreeImage_FIFSupportsWriting(FREE_IMAGE_FORMAT);
	BOOL FreeImage_FIFSupportsExportBPP(FREE_IMAGE_FORMAT,int);
	BOOL FreeImage_FIFSupportsExportType(FREE_IMAGE_FORMAT,FREE_IMAGE_TYPE);
	BOOL FreeImage_FIFSupportsICCProfiles(FREE_IMAGE_FORMAT);
	BOOL FreeImage_FIFSupportsNoPixels(FREE_IMAGE_FORMAT);
	FIMULTIBITMAP* FreeImage_OpenMultiBitmap(FREE_IMAGE_FORMAT,const(char)*,BOOL,BOOL,BOOL keep_cache_in_memory = FALSE,int flags = 0);
	FIMULTIBITMAP* FreeImage_OpenMultiBitmapFromHandle(FREE_IMAGE_FORMAT,FreeImageIO*, fi_handle,int flags = 0);
	BOOL FreeImage_SaveMultiBitmapToHandle(FREE_IMAGE_FORMAT, FIMULTIBITMAP*,FreeImageIO*, fi_handle,int flags = 0);
	BOOL FreeImage_CloseMultiBitmap(FIMULTIBITMAP*,int flags = 0);
	int FreeImage_GetPageCount(FIMULTIBITMAP*);
	void FreeImage_AppendPage(FIMULTIBITMAP*,FIBITMAP*);
	void FreeImage_InsertPage(FIMULTIBITMAP*,int,FIBITMAP*);
	void FreeImage_DeletePage(FIMULTIBITMAP*,int);
	FIBITMAP* FreeImage_LockPage(FIMULTIBITMAP*,int);
	void FreeImage_UnlockPage(FIMULTIBITMAP*,FIBITMAP*,BOOL);
	BOOL FreeImage_MovePage(FIMULTIBITMAP*,int,int);
	BOOL FreeImage_GetLockedPageNumbers(FIMULTIBITMAP*,int*,int*);
	FREE_IMAGE_FORMAT FreeImage_GetFileType(const(char)*,int size = 0);
	FREE_IMAGE_FORMAT FreeImage_GetFileTypeU(const(wchar_t)*,int size = 0);
	FREE_IMAGE_FORMAT FreeImage_GetFileTypeFromHandle(FreeImageIO*, fi_handle,int size = 0);
	FREE_IMAGE_FORMAT FreeImage_GetFileTypeFromMemory(FIMEMORY*,int size = 0);
	FREE_IMAGE_TYPE FreeImage_GetImageType(FIBITMAP*);
	BOOL FreeImage_IsLittleEndian();
	BOOL FreeImage_LookupX11Color(const(char)* ,BYTE*,BYTE*,BYTE*);
	BOOL FreeImage_LookupSVGColor(const(char)* ,BYTE*,BYTE*,BYTE*);
	BYTE* FreeImage_GetBits(FIBITMAP*);
	BYTE* FreeImage_GetScanLine(FIBITMAP*,int scanline);
	BOOL FreeImage_GetPixelIndex(FIBITMAP*,uint,uint,BYTE*);
	BOOL FreeImage_GetPixelColor(FIBITMAP*,uint,uint, RGBQUAD*);
	BOOL FreeImage_SetPixelIndex(FIBITMAP*,uint,uint,BYTE*);
	BOOL FreeImage_SetPixelColor(FIBITMAP*,uint,uint, RGBQUAD*);
	uint FreeImage_GetColorsUsed(FIBITMAP*);
	uint FreeImage_GetBPP(FIBITMAP*);
	uint FreeImage_GetWidth(FIBITMAP*);
	uint FreeImage_GetHeight(FIBITMAP*);
	uint FreeImage_GetLine(FIBITMAP*);
	uint FreeImage_GetPitch(FIBITMAP*);
	uint FreeImage_GetDIBSize(FIBITMAP*);
	uint FreeImage_GetMemorySize(FIBITMAP*); // Added in 3.17.;
	RGBQUAD* FreeImage_GetPalette(FIBITMAP*);
	uint FreeImage_GetDotsPerMeterX(FIBITMAP*);
	uint FreeImage_GetDotsPerMeterY(FIBITMAP*);
	void FreeImage_SetDotsPerMeterX(FIBITMAP*,uint);
	void FreeImage_SetDotsPerMeterY(FIBITMAP*,uint);
	BITMAPINFOHEADER* FreeImage_GetInfoHeader(FIBITMAP*);
	BITMAPINFO* FreeImage_GetInfo(FIBITMAP*);
	FREE_IMAGE_COLOR_TYPE FreeImage_GetColorType(FIBITMAP*);
	uint FreeImage_GetRedMask(FIBITMAP*);
	uint FreeImage_GetGreenMask(FIBITMAP*);
	uint FreeImage_GetBlueMask(FIBITMAP*);
	uint FreeImage_GetTransparencyCount(FIBITMAP*);
	BYTE* FreeImage_GetTransparencyTable(FIBITMAP*);
	void FreeImage_SetTransparent(FIBITMAP*,BOOL);
	void FreeImage_SetTransparencyTable(FIBITMAP*,BYTE*,int);
	BOOL FreeImage_IsTransparent(FIBITMAP*);
	void FreeImage_SetTransparentIndex(FIBITMAP*,int);
	int FreeImage_GetTransparentIndex(FIBITMAP*);
	BOOL FreeImage_HasBackgroundColor(FIBITMAP*);
	BOOL FreeImage_GetBackgroundColor(FIBITMAP*,RGBQUAD*);
	BOOL FreeImage_SetBackgroundColor(FIBITMAP*,RGBQUAD*);
	FIBITMAP* FreeImage_GetThumbnail(FIBITMAP*);
	BOOL FreeImage_SetThumbnail(FIBITMAP*,FIBITMAP*);
	FIICCPROFILE* FreeImage_GetICCProfile(FIBITMAP*);
	FIICCPROFILE* FreeImage_CreateICCProfile(FIBITMAP*,void*,c_long);
	void FreeImage_DestroyICCProfile(FIBITMAP*);
	void FreeImage_ConvertLine1To4(BYTE*,BYTE*,int);
	void FreeImage_ConvertLine8To4(BYTE*,BYTE*,int,RGBQUAD*);
	void FreeImage_ConvertLine16To4_555(BYTE*,BYTE*,int);
	void FreeImage_ConvertLine16To4_565(BYTE*,BYTE*,int);
	void FreeImage_ConvertLine24To4(BYTE*,BYTE*,int);
	void FreeImage_ConvertLine32To4(BYTE*,BYTE*,int);
	void FreeImage_ConvertLine1To8(BYTE*,BYTE*,int);
	void FreeImage_ConvertLine4To8(BYTE*,BYTE*,int);
	void FreeImage_ConvertLine16To8_555(BYTE*,BYTE*,int);
	void FreeImage_ConvertLine16To8_565(BYTE*,BYTE*,int);
	void FreeImage_ConvertLine24To8(BYTE*,BYTE*,int);
	void FreeImage_ConvertLine32To8(BYTE*,BYTE*,int);
	void FreeImage_ConvertLine1To16_555(BYTE*,BYTE*,int,RGBQUAD*);
	void FreeImage_ConvertLine4To16_555(BYTE*,BYTE*,int,RGBQUAD*);
	void FreeImage_ConvertLine8To16_555(BYTE*,BYTE*,int,RGBQUAD*);
	void FreeImage_ConvertLine16_565_To16_555(BYTE*,BYTE*,int);
	void FreeImage_ConvertLine24To16_555(BYTE*,BYTE*,int);
	void FreeImage_ConvertLine32To16_555(BYTE*,BYTE*,int);
	void FreeImage_ConvertLine1To16_565(BYTE*,BYTE*,int,RGBQUAD*);
	void FreeImage_ConvertLine4To16_565(BYTE*,BYTE*,int,RGBQUAD*);
	void FreeImage_ConvertLine8To16_565(BYTE*,BYTE*,int,RGBQUAD*);
	void FreeImage_ConvertLine16_555_To16_565(BYTE*,BYTE*,int);
	void FreeImage_ConvertLine24To16_565(BYTE*,BYTE*,int);
	void FreeImage_ConvertLine32To16_565(BYTE*,BYTE*,int);
	void FreeImage_ConvertLine1To24(BYTE*,BYTE*,int,RGBQUAD*);
	void FreeImage_ConvertLine4To24(BYTE*,BYTE*,int,RGBQUAD*);
	void FreeImage_ConvertLine8To24(BYTE*,BYTE*,int,RGBQUAD*);
	void FreeImage_ConvertLine16To24_555(BYTE*,BYTE*,int);
	void FreeImage_ConvertLine16To24_565(BYTE*,BYTE*,int);
	void FreeImage_ConvertLine32To24(BYTE*,BYTE*,int);
	void FreeImage_ConvertLine1To32(BYTE*,BYTE*,int,RGBQUAD*);
	void FreeImage_ConvertLine4To32(BYTE*,BYTE*,int,RGBQUAD*);
	void FreeImage_ConvertLine8To32(BYTE*,BYTE*,int,RGBQUAD*);
	void FreeImage_ConvertLine16To32_555(BYTE*,BYTE*,int);
	void FreeImage_ConvertLine16To32_565(BYTE*,BYTE*,int);
	void FreeImage_ConvertLine24To32(BYTE*,BYTE*,int);
	FIBITMAP* FreeImage_ConvertTo4Bits(FIBITMAP*);
	FIBITMAP* FreeImage_ConvertTo8Bits(FIBITMAP*);
	FIBITMAP* FreeImage_ConvertToGreyscale(FIBITMAP*);
	FIBITMAP* FreeImage_ConvertTo16Bits555(FIBITMAP*);
	FIBITMAP* FreeImage_ConvertTo16Bits565(FIBITMAP*);
	FIBITMAP* FreeImage_ConvertTo24Bits(FIBITMAP*);
	FIBITMAP* FreeImage_ConvertTo32Bits(FIBITMAP*);
	FIBITMAP* FreeImage_ColorQuantize(FIBITMAP*,FREE_IMAGE_QUANTIZE);
	FIBITMAP* FreeImage_ColorQuantizeEx(FIBITMAP*,FREE_IMAGE_QUANTIZE quantize = FIQ_WUQUANT,int PaletteSize = 256,int ReserveSize = 0,RGBQUAD* ReservePalette = null);
	FIBITMAP* FreeImage_Threshold(FIBITMAP*,BYTE);
	FIBITMAP* FreeImage_Dither(FIBITMAP*,FREE_IMAGE_DITHER);
	FIBITMAP* FreeImage_ConvertFromRawBits(BYTE* bits,int,int,int,uint,uint,uint,uint,BOOL topdown = FALSE);
	FIBITMAP* FreeImage_ConvertFromRawBitsEx(BOOL,BYTE*,FREE_IMAGE_TYPE,int,int,int,uint,uint,uint,uint,BOOL topdown=FALSE);    // Added in 3.17.;
	void FreeImage_ConvertToRawBits(BYTE* bits,FIBITMAP*,int,uint,uint,uint,uint,BOOL topdown = FALSE);
	FIBITMAP* FreeImage_ConvertToFloat(FIBITMAP*);
	FIBITMAP* FreeImage_ConvertToRGBF(FIBITMAP*);
	FIBITMAP* FreeImage_ConvertToRGBAF(FIBITMAP*);    // Added in 3.17.;
	FIBITMAP* FreeImage_ConvertToUINT16(FIBITMAP*);
	FIBITMAP* FreeImage_ConvertToRGB16(FIBITMAP*);
	FIBITMAP* FreeImage_ConvertToRGBA16(FIBITMAP*);   // Added in 3.17.;
	FIBITMAP* FreeImage_ConvertToStandardType(FIBITMAP*,BOOL scale_linear = TRUE);
	FIBITMAP* FreeImage_ConvertToType(FIBITMAP*,FREE_IMAGE_TYPE,BOOL scale_linear = TRUE);
	FIBITMAP* FreeImage_ToneMapping(FIBITMAP*,FREE_IMAGE_TMO, double first_param = 0,double second_param = 0);
	FIBITMAP* FreeImage_TmoDrago03(FIBITMAP*,double = 2.2,double exposure = 0);
	FIBITMAP* FreeImage_TmoReinhard05(FIBITMAP*,double intensity = 0,double constrast = 0);
	FIBITMAP* FreeImage_TmoReinhard05Ex(FIBITMAP*,double intensity = 0,double constrast = 0,double adaptation = 1,double color_correction = 0);
	FIBITMAP* FreeImage_TmoFattal02(FIBITMAP*,double color_saturation = 0.5,double attenuation = 0.85);
	DWORD FreeImage_ZLibCompress(BYTE*,DWORD,BYTE*,DWORD);
	DWORD FreeImage_ZLibUncompress(BYTE*,DWORD,BYTE*,DWORD);
	DWORD FreeImage_ZLibGZip(BYTE*,DWORD,BYTE*,DWORD);
	DWORD FreeImage_ZLibGUnzip(BYTE*,DWORD,BYTE*,DWORD);
	DWORD FreeImage_ZLibCRC32(DWORD crc,BYTE*,DWORD);
	FITAG* FreeImage_CreateTag();
	void FreeImage_DeleteTag(FITAG*);
	FITAG* FreeImage_CloneTag(FITAG*);
	const(char)* FreeImage_GetTagKey(FITAG*);
	const(char)* FreeImage_GetTagDescription(FITAG*);
	WORD FreeImage_GetTagID(FITAG*);
	FREE_IMAGE_MDTYPE FreeImage_GetTagType(FITAG*);
	DWORD FreeImage_GetTagCount(FITAG*);
	DWORD FreeImage_GetTagLength(FITAG*);
	const(void)* FreeImage_GetTagValue(FITAG*);
	BOOL FreeImage_SetTagKey(FITAG*,const(char)*);
	BOOL FreeImage_SetTagDescription(FITAG*,const(char)*);
	BOOL FreeImage_SetTagID(FITAG*, WORD id);
	BOOL FreeImage_SetTagType(FITAG*, FREE_IMAGE_MDTYPE);
	BOOL FreeImage_SetTagCount(FITAG*,DWORD);
	BOOL FreeImage_SetTagLength(FITAG*,DWORD);
	BOOL FreeImage_SetTagValue(FITAG*,const(void)*);
	FIMETADATA* FreeImage_FindFirstMetadata(FREE_IMAGE_MDMODEL,FIBITMAP*,FITAG**);
	BOOL FreeImage_FindNextMetadata(FIMETADATA*,FITAG**);
	void FreeImage_FindCloseMetadata(FIMETADATA*);
	BOOL FreeImage_SetMetadata(FREE_IMAGE_MDMODEL,FIBITMAP*,const(char)*,FITAG*);
	BOOL FreeImage_GetMetadata(FREE_IMAGE_MDMODEL,FIBITMAP*,const(char)*,FITAG**);
	BOOL FreeImage_SetMetadataKeyValue(FREE_IMAGE_MDMODEL,FIBITMAP*,const(char)*,const(char)*); // Added in 3.17.;
	uint FreeImage_GetMetadataCount(FREE_IMAGE_MDMODEL,FIBITMAP*);
	BOOL FreeImage_CloneMetadata(FIBITMAP*,FIBITMAP*);
	const(char)* FreeImage_TagToString(FREE_IMAGE_MDMODEL,FITAG*,char* = null);

	version(BindFI_JPEGTransform) {
		BOOL FreeImage_JPEGTransform(const(char)*,const(char)*,FREE_IMAGE_JPEG_OPERATION,BOOL perfect=TRUE);
		BOOL FreeImage_JPEGTransformU(const(wchar_t)*,const(wchar_t)*,FREE_IMAGE_JPEG_OPERATION,BOOL perfect=TRUE);
		BOOL FreeImage_JPEGCrop(const(char)*,const(char)*,int,int,int,int);
		BOOL FreeImage_JPEGCropU(const(wchar_t)*,const(wchar_t)*,int,int,int,int);
		BOOL FreeImage_JPEGTransformFromHandle(FreeImageIO*,fi_handle,FreeImageIO*,fi_handle,FREE_IMAGE_JPEG_OPERATION,int*,int*,int*,int*,BOOL perfect=TRUE);
		BOOL FreeImage_JPEGTransformCombined(const(char)*,const(char)*,FREE_IMAGE_JPEG_OPERATION,int*,int*,int*,int*,BOOL perfect=TRUE);
		BOOL FreeImage_JPEGTransformCombinedU(const(wchar_t)*,const(wchar_t)*,FREE_IMAGE_JPEG_OPERATION,int*,int*,int*,int*,BOOL perfect=TRUE);
		BOOL FreeImage_JPEGTransformCombinedFromMemory(FIMEMORY*,FIMEMORY*,FREE_IMAGE_JPEG_OPERATION,int*,int*,int*,int*,BOOL perfect=TRUE);
	}

	FIBITMAP* FreeImage_Rotate(FIBITMAP*,double angle,const(void*) bkcolor = null);
	FIBITMAP* FreeImage_RotateEx(FIBITMAP*,double,double,double,double,double,BOOL);
	BOOL FreeImage_FlipHorizontal(FIBITMAP*);
	BOOL FreeImage_FlipVertical(FIBITMAP*);
	FIBITMAP* FreeImage_Rescale(FIBITMAP*,int,int,FREE_IMAGE_FILTER);
	FIBITMAP* FreeImage_MakeThumbnail(FIBITMAP*,int,BOOL convert = TRUE);
	FIBITMAP* FreeImage_RescaleRect(FIBITMAP*,int,int,int,int,int,int,FREE_IMAGE_FILTER filter = FILTER_CATMULLROM,uint flags = 0); // Added in 3.17.;
	BOOL FreeImage_AdjustCurve(FIBITMAP*,BYTE*,FREE_IMAGE_COLOR_CHANNEL);
	BOOL FreeImage_AdjustGamma(FIBITMAP*,double);
	BOOL FreeImage_AdjustBrightness(FIBITMAP*,double);
	BOOL FreeImage_AdjustContrast(FIBITMAP*,double);
	BOOL FreeImage_Invert(FIBITMAP*);
	BOOL FreeImage_GetHistogram(FIBITMAP*,DWORD*,FREE_IMAGE_COLOR_CHANNEL = FICC_BLACK);
	int FreeImage_GetAdjustColorsLookupTable(BYTE* LUT,double,double,double,BOOL);
	BOOL FreeImage_AdjustColors(FIBITMAP*,double,double,double,BOOL invert = FALSE);
	uint FreeImage_ApplyColorMapping(FIBITMAP*,RGBQUAD*, RGBQUAD*,uint,BOOL,BOOL);
	uint FreeImage_SwapColors(FIBITMAP*,RGBQUAD*,RGBQUAD*,BOOL);
	uint FreeImage_ApplyPaletteIndexMapping(FIBITMAP*,BYTE*,BYTE*,uint,BOOL);
	uint FreeImage_SwapPaletteIndices(FIBITMAP*,BYTE*,BYTE*);
	FIBITMAP* FreeImage_GetChannel(FIBITMAP*,FREE_IMAGE_COLOR_CHANNEL);
	BOOL FreeImage_SetChannel(FIBITMAP*,FIBITMAP*,FREE_IMAGE_COLOR_CHANNEL);
	FIBITMAP* FreeImage_GetComplexChannel(FIBITMAP*,FREE_IMAGE_COLOR_CHANNEL);
	BOOL FreeImage_SetComplexChannel(FIBITMAP*,FIBITMAP*,FREE_IMAGE_COLOR_CHANNEL);
	FIBITMAP* FreeImage_Copy(FIBITMAP*,int,int,int,int);
	BOOL FreeImage_Paste(FIBITMAP*,FIBITMAP*,int,int,int);
	FIBITMAP* FreeImage_CreateView(FIBITMAP*,uint,uint,uint,uint); // Added in 3.17.;
	FIBITMAP* FreeImage_Composite(FIBITMAP*,BOOL useFileBkg = FALSE,RGBQUAD* appBkColor = null,FIBITMAP*bg = null);
	BOOL FreeImage_PreMultiplyWithAlpha(FIBITMAP*);
	BOOL FreeImage_FillBackground(FIBITMAP*,const(void*),int options = 0);
	FIBITMAP* FreeImage_EnlargeCanvas(FIBITMAP*,int,int,int,int,const(void*),int options = 0);
	FIBITMAP* FreeImage_AllocateEx(int,int,int,const(RGBQUAD)*,int options = 0,const(RGBQUAD)* palette = null,uint red_mask = 0,uint green_mask = 0,uint blue_mask = 0);
	FIBITMAP* FreeImage_AllocateExT(FREE_IMAGE_TYPE,int,int,int,const(void*),int options = 0,const(RGBQUAD)* palette = null,uint red_mask = 0,uint green_mask = 0,uint blue_mask = 0);
	FIBITMAP* FreeImage_MultigridPoissonSolver(FIBITMAP*,int ncycle = 3);

	static if(fiSupport >= FISupport.fi318) {
		BOOL FreeImage_Validate(FREE_IMAGE_FORMAT,const(char)*);
		BOOL FreeImage_ValidateU(FREE_IMAGE_FORMAT,const(wchar_t)*);
		BOOL FreeImage_ValidateFromHandle(FREE_IMAGE_FORMAT,FreeImageIO*,fi_handle);
		BOOL FreeImage_ValidateFromMemory(FREE_IMAGE_FORMAT,FIMEMORY);
		void FreeImage_ConvertLine1To32MapTransparency(BYTE*,BYTE*,int,RGBQUAD*,BYTE*,int);
		void FreeImage_ConvertLine4To32MapTransparency(BYTE*,BYTE*,int,RGBQUAD*,BYTE*,int);
		void FreeImage_ConvertLine8To32MapTransparency(BYTE*,BYTE*,int,RGBQUAD*,BYTE*,int);
	}
}