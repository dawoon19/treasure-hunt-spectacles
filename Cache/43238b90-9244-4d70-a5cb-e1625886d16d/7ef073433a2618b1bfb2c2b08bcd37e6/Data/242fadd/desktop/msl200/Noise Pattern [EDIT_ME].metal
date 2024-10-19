#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
#if 0
NGS_BACKEND_SHADER_FLAGS_BEGIN__
NGS_BACKEND_SHADER_FLAGS_END__
#endif
namespace SNAP_VS {
int sc_GetStereoViewIndex()
{
    return 0;
}
}
    #ifndef sc_TextureRenderingLayout_Regular
        #define sc_TextureRenderingLayout_Regular 0
        #define sc_TextureRenderingLayout_StereoInstancedClipped 1
        #define sc_TextureRenderingLayout_StereoMultiview 2
    #endif
    #define depthToGlobal   depthScreenToViewSpace
    #define depthToLocal    depthViewToScreenSpace
    #ifndef quantizeUV
        #define quantizeUV sc_QuantizeUV
        #define sc_platformUVFlip sc_PlatformFlipV
        #define sc_PlatformFlipUV sc_PlatformFlipV
    #endif
    #ifndef sc_SampleTexture
        #define sc_SampleTexture sc_SampleTextureBiasOrLevel
    #endif
    #ifndef sc_texture2DLod
        #define sc_texture2DLod sc_InternalTextureLevel
        #define sc_textureLod sc_InternalTextureLevel
        #define sc_textureBias sc_InternalTextureBiasOrLevel
        #define sc_texture sc_InternalTexture
    #endif
#ifdef uv2
#undef uv2
#endif
#ifdef uv3
#undef uv3
#endif
//SG_REFLECTION_BEGIN(200)
//attribute vec4 boneData 5
//attribute vec3 blendShape0Pos 6
//attribute vec3 blendShape0Normal 12
//attribute vec3 blendShape1Pos 7
//attribute vec3 blendShape1Normal 13
//attribute vec3 blendShape2Pos 8
//attribute vec3 blendShape2Normal 14
//attribute vec3 blendShape3Pos 9
//attribute vec3 blendShape4Pos 10
//attribute vec3 blendShape5Pos 11
//attribute vec4 position 0
//attribute vec3 normal 1
//attribute vec4 tangent 2
//attribute vec2 texture0 3
//attribute vec2 texture1 4
//attribute vec4 color 18
//attribute vec3 positionNext 15
//attribute vec3 positionPrevious 16
//attribute vec4 strandProperties 17
//output vec4 FragColor0 0
//output vec4 FragColor1 1
//output vec4 FragColor2 2
//output vec4 FragColor3 3
//sampler sampler baseTexSmpSC 2:22
//sampler sampler intensityTextureSmpSC 2:23
//sampler sampler sc_ScreenTextureSmpSC 2:28
//sampler sampler z_hitIdAndBarycentricSmp 2:31
//sampler sampler z_rayDirectionsSmpSC 2:32
//texture texture2D baseTex 2:4:2:22
//texture texture2D intensityTexture 2:5:2:23
//texture texture2D sc_ScreenTexture 2:17:2:28
//texture utexture2D z_hitIdAndBarycentric 2:20:2:31
//texture texture2D z_rayDirections 2:21:2:32
//ubo float sc_BonesUBO 2:3:96 {
//sc_Bone_t sc_Bones 0:[]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 2:33:4432 {
//sc_PointLight_t sc_PointLights 0:[3]:80
//bool sc_PointLights.falloffEnabled 0
//float sc_PointLights.falloffEndDistance 4
//float sc_PointLights.negRcpFalloffEndDistance4 8
//float sc_PointLights.angleScale 12
//float sc_PointLights.angleOffset 16
//float3 sc_PointLights.direction 32
//float3 sc_PointLights.position 48
//float4 sc_PointLights.color 64
//sc_DirectionalLight_t sc_DirectionalLights 240:[3]:32
//float3 sc_DirectionalLights.direction 0
//float4 sc_DirectionalLights.color 16
//sc_AmbientLight_t sc_AmbientLights 336:[3]:32
//float3 sc_AmbientLights.color 0
//float sc_AmbientLights.intensity 16
//sc_LightEstimationData_t sc_LightEstimationData 432
//sc_SphericalGaussianLight_t sc_LightEstimationData.sg 0:[12]:48
//float3 sc_LightEstimationData.sg.color 0
//float sc_LightEstimationData.sg.sharpness 16
//float3 sc_LightEstimationData.sg.axis 32
//float3 sc_LightEstimationData.ambientLight 576
//float4 sc_EnvmapDiffuseSize 1024
//float4 sc_EnvmapDiffuseDims 1040
//float4 sc_EnvmapDiffuseView 1056
//float4 sc_EnvmapSpecularSize 1072
//float4 sc_EnvmapSpecularDims 1088
//float4 sc_EnvmapSpecularView 1104
//float3 sc_EnvmapRotation 1120
//float sc_EnvmapExposure 1136
//float3 sc_Sh 1152:[9]:16
//float sc_ShIntensity 1296
//float4 sc_Time 1312
//float4 sc_UniformConstants 1328
//float4 sc_GeometryInfo 1344
//float4x4 sc_ModelViewProjectionMatrixArray 1360:[2]:64
//float4x4 sc_ModelViewProjectionMatrixInverseArray 1488:[2]:64
//float4x4 sc_ViewProjectionMatrixArray 1616:[2]:64
//float4x4 sc_ViewProjectionMatrixInverseArray 1744:[2]:64
//float4x4 sc_ModelViewMatrixArray 1872:[2]:64
//float4x4 sc_ModelViewMatrixInverseArray 2000:[2]:64
//float3x3 sc_ViewNormalMatrixArray 2128:[2]:48
//float3x3 sc_ViewNormalMatrixInverseArray 2224:[2]:48
//float4x4 sc_ProjectionMatrixArray 2320:[2]:64
//float4x4 sc_ProjectionMatrixInverseArray 2448:[2]:64
//float4x4 sc_ViewMatrixArray 2576:[2]:64
//float4x4 sc_ViewMatrixInverseArray 2704:[2]:64
//float4x4 sc_PrevFrameViewProjectionMatrixArray 2832:[2]:64
//float4x4 sc_ModelMatrix 2960
//float4x4 sc_ModelMatrixInverse 3024
//float3x3 sc_NormalMatrix 3088
//float3x3 sc_NormalMatrixInverse 3136
//float4x4 sc_PrevFrameModelMatrix 3184
//float4x4 sc_PrevFrameModelMatrixInverse 3248
//float3 sc_LocalAabbMin 3312
//float3 sc_LocalAabbMax 3328
//float3 sc_WorldAabbMin 3344
//float3 sc_WorldAabbMax 3360
//float4 sc_WindowToViewportTransform 3376
//sc_Camera_t sc_Camera 3392
//float3 sc_Camera.position 0
//float sc_Camera.aspect 16
//float2 sc_Camera.clipPlanes 24
//float sc_ShadowDensity 3424
//float4 sc_ShadowColor 3440
//float4x4 sc_ProjectorMatrix 3456
//float _sc_GetFramebufferColorInvalidUsageMarker 3520
//float shaderComplexityValue 3524
//float sc_DisableFrustumCullingMarker 3528
//float4 weights0 3536
//float4 weights1 3552
//float4 weights2 3568
//float4 sc_StereoClipPlanes 3584:[2]:16
//int sc_FallbackInstanceID 3616
//float _sc_framebufferFetchMarker 3620
//float2 sc_TAAJitterOffset 3624
//float strandWidth 3632
//float strandTaper 3636
//float4 sc_StrandDataMapTextureSize 3648
//float clumpInstanceCount 3664
//float clumpRadius 3668
//float clumpTipScale 3672
//float hairstyleInstanceCount 3676
//float hairstyleNoise 3680
//float4 sc_ScreenTextureSize 3696
//float4 sc_ScreenTextureDims 3712
//float4 sc_ScreenTextureView 3728
//bool isProxyMode 3744
//int instance_id 3748
//int lray_triangles_last 3752
//bool noEarlyZ 3756
//bool has_animated_pn 3760
//int emitter_stride 3764
//int proxy_offset_position 3768
//int proxy_offset_normal 3772
//int proxy_offset_tangent 3776
//int proxy_offset_color 3780
//int proxy_offset_texture0 3784
//int proxy_offset_texture1 3788
//int proxy_offset_texture2 3792
//int proxy_offset_texture3 3796
//int proxy_format_position 3800
//int proxy_format_normal 3804
//int proxy_format_tangent 3808
//int proxy_format_color 3812
//int proxy_format_texture0 3816
//int proxy_format_texture1 3820
//int proxy_format_texture2 3824
//int proxy_format_texture3 3828
//float4 z_rayDirectionsSize 3840
//float4 z_rayDirectionsDims 3856
//float4 z_rayDirectionsView 3872
//float correctedIntensity 3888
//float4 intensityTextureSize 3904
//float4 intensityTextureDims 3920
//float4 intensityTextureView 3936
//float3x3 intensityTextureTransform 3952
//float4 intensityTextureUvMinMax 4000
//float4 intensityTextureBorderColor 4016
//float reflBlurWidth 4032
//float reflBlurMinRough 4036
//float reflBlurMaxRough 4040
//int overrideTimeEnabled 4044
//float overrideTimeElapsed 4048
//float overrideTimeDelta 4052
//int PreviewEnabled 4056
//int PreviewNodeID 4060
//float alphaTestThreshold 4064
//float4 edgeColor 4080
//float4 fillColor 4096
//float noiseFrequency 4112
//float opaticy 4116
//float4 baseTexSize 4128
//float4 baseTexDims 4144
//float4 baseTexView 4160
//float3x3 baseTexTransform 4176
//float4 baseTexUvMinMax 4224
//float4 baseTexBorderColor 4240
//float4 Port_Import_N020 4256
//float Port_Import_N014 4272
//float4 Port_Import_N015 4288
//float3 Port_Default_N019 4304
//float Port_Import_N013 4320
//float2 Port_Input1_N003 4328
//float Port_Multiplier_N009 4336
//float Port_RangeMinA_N002 4340
//float Port_RangeMaxA_N002 4344
//float Port_RangeMinB_N002 4348
//float Port_RangeMaxB_N002 4352
//float Port_Import_N029 4356
//float Port_Import_N011 4360
//float4 Port_Import_N027 4368
//float Port_Input1_N022 4384
//float Port_Value1_N023 4388
//float Port_Default_N037 4392
//float Port_Import_N031 4396
//float Port_Input1_N025 4400
//float Port_Value1_N030 4404
//float Port_Default_N039 4408
//float Port_Import_N032 4412
//float Port_Input1_N033 4416
//float Port_Value1_N035 4420
//float Port_Default_N052 4424
//float depthRef 4428
//}
//ssbo int layoutIndices 2:0:4 {
//uint _Triangles 0:[]:4
//}
//ssbo float layoutVerticesPN 2:2:4 {
//float _VerticesPN 0:[]:4
//}
//ssbo float layoutVertices 2:1:4 {
//float _Vertices 0:[]:4
//}
//spec_const bool BLEND_MODE_AVERAGE 1000
//spec_const bool BLEND_MODE_BRIGHT 1001
//spec_const bool BLEND_MODE_COLOR_BURN 1002
//spec_const bool BLEND_MODE_COLOR_DODGE 1003
//spec_const bool BLEND_MODE_COLOR 1004
//spec_const bool BLEND_MODE_DARKEN 1005
//spec_const bool BLEND_MODE_DIFFERENCE 1006
//spec_const bool BLEND_MODE_DIVIDE 1007
//spec_const bool BLEND_MODE_DIVISION 1008
//spec_const bool BLEND_MODE_EXCLUSION 1009
//spec_const bool BLEND_MODE_FORGRAY 1010
//spec_const bool BLEND_MODE_HARD_GLOW 1011
//spec_const bool BLEND_MODE_HARD_LIGHT 1012
//spec_const bool BLEND_MODE_HARD_MIX 1013
//spec_const bool BLEND_MODE_HARD_PHOENIX 1014
//spec_const bool BLEND_MODE_HARD_REFLECT 1015
//spec_const bool BLEND_MODE_HUE 1016
//spec_const bool BLEND_MODE_INTENSE 1017
//spec_const bool BLEND_MODE_LIGHTEN 1018
//spec_const bool BLEND_MODE_LINEAR_LIGHT 1019
//spec_const bool BLEND_MODE_LUMINOSITY 1020
//spec_const bool BLEND_MODE_NEGATION 1021
//spec_const bool BLEND_MODE_NOTBRIGHT 1022
//spec_const bool BLEND_MODE_OVERLAY 1023
//spec_const bool BLEND_MODE_PIN_LIGHT 1024
//spec_const bool BLEND_MODE_REALISTIC 1025
//spec_const bool BLEND_MODE_SATURATION 1026
//spec_const bool BLEND_MODE_SOFT_LIGHT 1027
//spec_const bool BLEND_MODE_SUBTRACT 1028
//spec_const bool BLEND_MODE_VIVID_LIGHT 1029
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 1030
//spec_const bool SC_USE_CLAMP_TO_BORDER_baseTex 1031
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 1032
//spec_const bool SC_USE_UV_MIN_MAX_baseTex 1033
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 1034
//spec_const bool SC_USE_UV_TRANSFORM_baseTex 1035
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 1036
//spec_const bool Tweak_N1 1037
//spec_const bool Tweak_N40 1038
//spec_const bool Tweak_N41 1039
//spec_const bool Tweak_N42 1040
//spec_const bool UseViewSpaceDepthVariant 1041
//spec_const bool baseTexHasSwappedViews 1042
//spec_const bool intensityTextureHasSwappedViews 1043
//spec_const bool sc_BlendMode_AddWithAlphaFactor 1044
//spec_const bool sc_BlendMode_Add 1045
//spec_const bool sc_BlendMode_AlphaTest 1046
//spec_const bool sc_BlendMode_AlphaToCoverage 1047
//spec_const bool sc_BlendMode_ColoredGlass 1048
//spec_const bool sc_BlendMode_Custom 1049
//spec_const bool sc_BlendMode_Max 1050
//spec_const bool sc_BlendMode_Min 1051
//spec_const bool sc_BlendMode_MultiplyOriginal 1052
//spec_const bool sc_BlendMode_Multiply 1053
//spec_const bool sc_BlendMode_Normal 1054
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 1055
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 1056
//spec_const bool sc_BlendMode_PremultipliedAlpha 1057
//spec_const bool sc_BlendMode_Screen 1058
//spec_const bool sc_DepthOnly 1059
//spec_const bool sc_FramebufferFetch 1060
//spec_const bool sc_MotionVectorsPass 1061
//spec_const bool sc_OITCompositingPass 1062
//spec_const bool sc_OITDepthBoundsPass 1063
//spec_const bool sc_OITDepthGatherPass 1064
//spec_const bool sc_ProjectiveShadowsCaster 1065
//spec_const bool sc_ProjectiveShadowsReceiver 1066
//spec_const bool sc_ProxyAlphaOne 1067
//spec_const bool sc_RenderAlphaToColor 1068
//spec_const bool sc_ScreenTextureHasSwappedViews 1069
//spec_const bool sc_ShaderComplexityAnalyzer 1070
//spec_const bool sc_UseFramebufferFetchMarker 1071
//spec_const bool sc_VertexBlendingUseNormals 1072
//spec_const bool sc_VertexBlending 1073
//spec_const int SC_DEVICE_CLASS 1074
//spec_const int SC_SOFTWARE_WRAP_MODE_U_baseTex 1075
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 1076
//spec_const int SC_SOFTWARE_WRAP_MODE_V_baseTex 1077
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 1078
//spec_const int baseTexLayout 1079
//spec_const int intensityTextureLayout 1080
//spec_const int sc_DepthBufferMode 1081
//spec_const int sc_RenderingSpace 1082
//spec_const int sc_ScreenTextureLayout 1083
//spec_const int sc_SkinBonesCount 1084
//spec_const int sc_StereoRenderingMode 1085
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 1086
//SG_REFLECTION_END
constant bool BLEND_MODE_AVERAGE [[function_constant(1000)]];
constant bool BLEND_MODE_AVERAGE_tmp = is_function_constant_defined(BLEND_MODE_AVERAGE) ? BLEND_MODE_AVERAGE : false;
constant bool BLEND_MODE_BRIGHT [[function_constant(1001)]];
constant bool BLEND_MODE_BRIGHT_tmp = is_function_constant_defined(BLEND_MODE_BRIGHT) ? BLEND_MODE_BRIGHT : false;
constant bool BLEND_MODE_COLOR_BURN [[function_constant(1002)]];
constant bool BLEND_MODE_COLOR_BURN_tmp = is_function_constant_defined(BLEND_MODE_COLOR_BURN) ? BLEND_MODE_COLOR_BURN : false;
constant bool BLEND_MODE_COLOR_DODGE [[function_constant(1003)]];
constant bool BLEND_MODE_COLOR_DODGE_tmp = is_function_constant_defined(BLEND_MODE_COLOR_DODGE) ? BLEND_MODE_COLOR_DODGE : false;
constant bool BLEND_MODE_COLOR [[function_constant(1004)]];
constant bool BLEND_MODE_COLOR_tmp = is_function_constant_defined(BLEND_MODE_COLOR) ? BLEND_MODE_COLOR : false;
constant bool BLEND_MODE_DARKEN [[function_constant(1005)]];
constant bool BLEND_MODE_DARKEN_tmp = is_function_constant_defined(BLEND_MODE_DARKEN) ? BLEND_MODE_DARKEN : false;
constant bool BLEND_MODE_DIFFERENCE [[function_constant(1006)]];
constant bool BLEND_MODE_DIFFERENCE_tmp = is_function_constant_defined(BLEND_MODE_DIFFERENCE) ? BLEND_MODE_DIFFERENCE : false;
constant bool BLEND_MODE_DIVIDE [[function_constant(1007)]];
constant bool BLEND_MODE_DIVIDE_tmp = is_function_constant_defined(BLEND_MODE_DIVIDE) ? BLEND_MODE_DIVIDE : false;
constant bool BLEND_MODE_DIVISION [[function_constant(1008)]];
constant bool BLEND_MODE_DIVISION_tmp = is_function_constant_defined(BLEND_MODE_DIVISION) ? BLEND_MODE_DIVISION : false;
constant bool BLEND_MODE_EXCLUSION [[function_constant(1009)]];
constant bool BLEND_MODE_EXCLUSION_tmp = is_function_constant_defined(BLEND_MODE_EXCLUSION) ? BLEND_MODE_EXCLUSION : false;
constant bool BLEND_MODE_FORGRAY [[function_constant(1010)]];
constant bool BLEND_MODE_FORGRAY_tmp = is_function_constant_defined(BLEND_MODE_FORGRAY) ? BLEND_MODE_FORGRAY : false;
constant bool BLEND_MODE_HARD_GLOW [[function_constant(1011)]];
constant bool BLEND_MODE_HARD_GLOW_tmp = is_function_constant_defined(BLEND_MODE_HARD_GLOW) ? BLEND_MODE_HARD_GLOW : false;
constant bool BLEND_MODE_HARD_LIGHT [[function_constant(1012)]];
constant bool BLEND_MODE_HARD_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_HARD_LIGHT) ? BLEND_MODE_HARD_LIGHT : false;
constant bool BLEND_MODE_HARD_MIX [[function_constant(1013)]];
constant bool BLEND_MODE_HARD_MIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_MIX) ? BLEND_MODE_HARD_MIX : false;
constant bool BLEND_MODE_HARD_PHOENIX [[function_constant(1014)]];
constant bool BLEND_MODE_HARD_PHOENIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_PHOENIX) ? BLEND_MODE_HARD_PHOENIX : false;
constant bool BLEND_MODE_HARD_REFLECT [[function_constant(1015)]];
constant bool BLEND_MODE_HARD_REFLECT_tmp = is_function_constant_defined(BLEND_MODE_HARD_REFLECT) ? BLEND_MODE_HARD_REFLECT : false;
constant bool BLEND_MODE_HUE [[function_constant(1016)]];
constant bool BLEND_MODE_HUE_tmp = is_function_constant_defined(BLEND_MODE_HUE) ? BLEND_MODE_HUE : false;
constant bool BLEND_MODE_INTENSE [[function_constant(1017)]];
constant bool BLEND_MODE_INTENSE_tmp = is_function_constant_defined(BLEND_MODE_INTENSE) ? BLEND_MODE_INTENSE : false;
constant bool BLEND_MODE_LIGHTEN [[function_constant(1018)]];
constant bool BLEND_MODE_LIGHTEN_tmp = is_function_constant_defined(BLEND_MODE_LIGHTEN) ? BLEND_MODE_LIGHTEN : false;
constant bool BLEND_MODE_LINEAR_LIGHT [[function_constant(1019)]];
constant bool BLEND_MODE_LINEAR_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_LINEAR_LIGHT) ? BLEND_MODE_LINEAR_LIGHT : false;
constant bool BLEND_MODE_LUMINOSITY [[function_constant(1020)]];
constant bool BLEND_MODE_LUMINOSITY_tmp = is_function_constant_defined(BLEND_MODE_LUMINOSITY) ? BLEND_MODE_LUMINOSITY : false;
constant bool BLEND_MODE_NEGATION [[function_constant(1021)]];
constant bool BLEND_MODE_NEGATION_tmp = is_function_constant_defined(BLEND_MODE_NEGATION) ? BLEND_MODE_NEGATION : false;
constant bool BLEND_MODE_NOTBRIGHT [[function_constant(1022)]];
constant bool BLEND_MODE_NOTBRIGHT_tmp = is_function_constant_defined(BLEND_MODE_NOTBRIGHT) ? BLEND_MODE_NOTBRIGHT : false;
constant bool BLEND_MODE_OVERLAY [[function_constant(1023)]];
constant bool BLEND_MODE_OVERLAY_tmp = is_function_constant_defined(BLEND_MODE_OVERLAY) ? BLEND_MODE_OVERLAY : false;
constant bool BLEND_MODE_PIN_LIGHT [[function_constant(1024)]];
constant bool BLEND_MODE_PIN_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_PIN_LIGHT) ? BLEND_MODE_PIN_LIGHT : false;
constant bool BLEND_MODE_REALISTIC [[function_constant(1025)]];
constant bool BLEND_MODE_REALISTIC_tmp = is_function_constant_defined(BLEND_MODE_REALISTIC) ? BLEND_MODE_REALISTIC : false;
constant bool BLEND_MODE_SATURATION [[function_constant(1026)]];
constant bool BLEND_MODE_SATURATION_tmp = is_function_constant_defined(BLEND_MODE_SATURATION) ? BLEND_MODE_SATURATION : false;
constant bool BLEND_MODE_SOFT_LIGHT [[function_constant(1027)]];
constant bool BLEND_MODE_SOFT_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_SOFT_LIGHT) ? BLEND_MODE_SOFT_LIGHT : false;
constant bool BLEND_MODE_SUBTRACT [[function_constant(1028)]];
constant bool BLEND_MODE_SUBTRACT_tmp = is_function_constant_defined(BLEND_MODE_SUBTRACT) ? BLEND_MODE_SUBTRACT : false;
constant bool BLEND_MODE_VIVID_LIGHT [[function_constant(1029)]];
constant bool BLEND_MODE_VIVID_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_VIVID_LIGHT) ? BLEND_MODE_VIVID_LIGHT : false;
constant bool ENABLE_STIPPLE_PATTERN_TEST [[function_constant(1030)]];
constant bool ENABLE_STIPPLE_PATTERN_TEST_tmp = is_function_constant_defined(ENABLE_STIPPLE_PATTERN_TEST) ? ENABLE_STIPPLE_PATTERN_TEST : false;
constant bool SC_USE_CLAMP_TO_BORDER_baseTex [[function_constant(1031)]];
constant bool SC_USE_CLAMP_TO_BORDER_baseTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_baseTex) ? SC_USE_CLAMP_TO_BORDER_baseTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(1032)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_baseTex [[function_constant(1033)]];
constant bool SC_USE_UV_MIN_MAX_baseTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_baseTex) ? SC_USE_UV_MIN_MAX_baseTex : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(1034)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_baseTex [[function_constant(1035)]];
constant bool SC_USE_UV_TRANSFORM_baseTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_baseTex) ? SC_USE_UV_TRANSFORM_baseTex : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(1036)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool Tweak_N1 [[function_constant(1037)]];
constant bool Tweak_N1_tmp = is_function_constant_defined(Tweak_N1) ? Tweak_N1 : false;
constant bool Tweak_N40 [[function_constant(1038)]];
constant bool Tweak_N40_tmp = is_function_constant_defined(Tweak_N40) ? Tweak_N40 : false;
constant bool Tweak_N41 [[function_constant(1039)]];
constant bool Tweak_N41_tmp = is_function_constant_defined(Tweak_N41) ? Tweak_N41 : false;
constant bool Tweak_N42 [[function_constant(1040)]];
constant bool Tweak_N42_tmp = is_function_constant_defined(Tweak_N42) ? Tweak_N42 : false;
constant bool UseViewSpaceDepthVariant [[function_constant(1041)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool baseTexHasSwappedViews [[function_constant(1042)]];
constant bool baseTexHasSwappedViews_tmp = is_function_constant_defined(baseTexHasSwappedViews) ? baseTexHasSwappedViews : false;
constant bool intensityTextureHasSwappedViews [[function_constant(1043)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(1044)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(1045)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(1046)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(1047)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(1048)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(1049)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(1050)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(1051)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(1052)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(1053)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(1054)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(1055)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(1056)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(1057)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(1058)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(1059)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_FramebufferFetch [[function_constant(1060)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_MotionVectorsPass [[function_constant(1061)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(1062)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(1063)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(1064)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(1065)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(1066)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_ProxyAlphaOne [[function_constant(1067)]];
constant bool sc_ProxyAlphaOne_tmp = is_function_constant_defined(sc_ProxyAlphaOne) ? sc_ProxyAlphaOne : false;
constant bool sc_RenderAlphaToColor [[function_constant(1068)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(1069)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(1070)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(1071)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(1072)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(1073)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant int SC_DEVICE_CLASS [[function_constant(1074)]];
constant int SC_DEVICE_CLASS_tmp = is_function_constant_defined(SC_DEVICE_CLASS) ? SC_DEVICE_CLASS : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_baseTex [[function_constant(1075)]];
constant int SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_baseTex) ? SC_SOFTWARE_WRAP_MODE_U_baseTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(1076)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_baseTex [[function_constant(1077)]];
constant int SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_baseTex) ? SC_SOFTWARE_WRAP_MODE_V_baseTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(1078)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int baseTexLayout [[function_constant(1079)]];
constant int baseTexLayout_tmp = is_function_constant_defined(baseTexLayout) ? baseTexLayout : 0;
constant int intensityTextureLayout [[function_constant(1080)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int sc_DepthBufferMode [[function_constant(1081)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_RenderingSpace [[function_constant(1082)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(1083)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_SkinBonesCount [[function_constant(1084)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(1085)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(1086)]];
constant int sc_StereoRendering_IsClipDistanceEnabled_tmp = is_function_constant_defined(sc_StereoRendering_IsClipDistanceEnabled) ? sc_StereoRendering_IsClipDistanceEnabled : 0;

namespace SNAP_VS {
struct sc_Vertex_t
{
float4 position;
float3 normal;
float3 tangent;
float2 texture0;
float2 texture1;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[3];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float _sc_GetFramebufferColorInvalidUsageMarker;
float shaderComplexityValue;
float sc_DisableFrustumCullingMarker;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float _sc_framebufferFetchMarker;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
int isProxyMode;
int instance_id;
int lray_triangles_last;
int noEarlyZ;
int has_animated_pn;
int emitter_stride;
int proxy_offset_position;
int proxy_offset_normal;
int proxy_offset_tangent;
int proxy_offset_color;
int proxy_offset_texture0;
int proxy_offset_texture1;
int proxy_offset_texture2;
int proxy_offset_texture3;
int proxy_format_position;
int proxy_format_normal;
int proxy_format_tangent;
int proxy_format_color;
int proxy_format_texture0;
int proxy_format_texture1;
int proxy_format_texture2;
int proxy_format_texture3;
float4 z_rayDirectionsSize;
float4 z_rayDirectionsDims;
float4 z_rayDirectionsView;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed;
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float4 edgeColor;
float4 fillColor;
float noiseFrequency;
float opaticy;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float4 Port_Import_N020;
float Port_Import_N014;
float4 Port_Import_N015;
float3 Port_Default_N019;
float Port_Import_N013;
float2 Port_Input1_N003;
float Port_Multiplier_N009;
float Port_RangeMinA_N002;
float Port_RangeMaxA_N002;
float Port_RangeMinB_N002;
float Port_RangeMaxB_N002;
float Port_Import_N029;
float Port_Import_N011;
float4 Port_Import_N027;
float Port_Input1_N022;
float Port_Value1_N023;
float Port_Default_N037;
float Port_Import_N031;
float Port_Input1_N025;
float Port_Value1_N030;
float Port_Default_N039;
float Port_Import_N032;
float Port_Input1_N033;
float Port_Value1_N035;
float Port_Default_N052;
float depthRef;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct layoutIndices_obj
{
uint _Triangles[1];
};
struct layoutVertices_obj
{
float _Vertices[1];
};
struct layoutVerticesPN_obj
{
float _VerticesPN[1];
};
struct sc_Set2
{
const device layoutIndices_obj* layoutIndices [[id(0)]];
const device layoutVertices_obj* layoutVertices [[id(1)]];
const device layoutVerticesPN_obj* layoutVerticesPN [[id(2)]];
constant sc_Bones_obj* sc_BonesUBO [[id(3)]];
texture2d<float> baseTex [[id(4)]];
texture2d<float> intensityTexture [[id(5)]];
texture2d<float> sc_ScreenTexture [[id(17)]];
texture2d<uint> z_hitIdAndBarycentric [[id(20)]];
texture2d<float> z_rayDirections [[id(21)]];
sampler baseTexSmpSC [[id(22)]];
sampler intensityTextureSmpSC [[id(23)]];
sampler sc_ScreenTextureSmpSC [[id(28)]];
sampler z_hitIdAndBarycentricSmp [[id(31)]];
sampler z_rayDirectionsSmpSC [[id(32)]];
constant userUniformsObj* UserUniforms [[id(33)]];
};
struct main_vert_out
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
float4 gl_Position [[position]];
};
struct main_vert_in
{
float4 position [[attribute(0)]];
float3 normal [[attribute(1)]];
float4 tangent [[attribute(2)]];
float2 texture0 [[attribute(3)]];
float2 texture1 [[attribute(4)]];
float4 boneData [[attribute(5)]];
float3 blendShape0Pos [[attribute(6)]];
float3 blendShape1Pos [[attribute(7)]];
float3 blendShape2Pos [[attribute(8)]];
float3 blendShape3Pos [[attribute(9)]];
float3 blendShape4Pos [[attribute(10)]];
float3 blendShape5Pos [[attribute(11)]];
float3 blendShape0Normal [[attribute(12)]];
float3 blendShape1Normal [[attribute(13)]];
float3 blendShape2Normal [[attribute(14)]];
float3 positionNext [[attribute(15)]];
float3 positionPrevious [[attribute(16)]];
float4 strandProperties [[attribute(17)]];
float4 color [[attribute(18)]];
};
vertex main_vert_out main_vert(main_vert_in in [[stage_in]],constant sc_Set2& sc_set2 [[buffer(2)]],uint gl_InstanceIndex [[instance_id]])
{
main_vert_out out={};
bool l9_0=(*sc_set2.UserUniforms).isProxyMode!=0;
if (l9_0)
{
float4 param=float4(in.position.xy,(*sc_set2.UserUniforms).depthRef+(1e-10*in.position.z),1.0+(1e-10*in.position.w));
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_1=param;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_2=dot(l9_1,(*sc_set2.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_3=l9_2;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_3;
}
}
float4 l9_4=float4(param.x,-param.y,(param.z*0.5)+(param.w*0.5),param.w);
out.gl_Position=l9_4;
return out;
}
out.PreviewVertexColor=float4(0.5);
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=float4(0.5);
PreviewInfo.Saved=false;
out.PreviewVertexSaved=0.0;
sc_Vertex_t l9_6;
l9_6.position=in.position;
l9_6.normal=in.normal;
l9_6.tangent=in.tangent.xyz;
l9_6.texture0=in.texture0;
l9_6.texture1=in.texture1;
sc_Vertex_t l9_7=l9_6;
sc_Vertex_t param_1=l9_7;
sc_Vertex_t l9_8=param_1;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_9=l9_8;
float3 l9_10=in.blendShape0Pos;
float3 l9_11=in.blendShape0Normal;
float l9_12=(*sc_set2.UserUniforms).weights0.x;
sc_Vertex_t l9_13=l9_9;
float3 l9_14=l9_10;
float l9_15=l9_12;
float3 l9_16=l9_13.position.xyz+(l9_14*l9_15);
l9_13.position=float4(l9_16.x,l9_16.y,l9_16.z,l9_13.position.w);
l9_9=l9_13;
l9_9.normal+=(l9_11*l9_12);
l9_8=l9_9;
sc_Vertex_t l9_17=l9_8;
float3 l9_18=in.blendShape1Pos;
float3 l9_19=in.blendShape1Normal;
float l9_20=(*sc_set2.UserUniforms).weights0.y;
sc_Vertex_t l9_21=l9_17;
float3 l9_22=l9_18;
float l9_23=l9_20;
float3 l9_24=l9_21.position.xyz+(l9_22*l9_23);
l9_21.position=float4(l9_24.x,l9_24.y,l9_24.z,l9_21.position.w);
l9_17=l9_21;
l9_17.normal+=(l9_19*l9_20);
l9_8=l9_17;
sc_Vertex_t l9_25=l9_8;
float3 l9_26=in.blendShape2Pos;
float3 l9_27=in.blendShape2Normal;
float l9_28=(*sc_set2.UserUniforms).weights0.z;
sc_Vertex_t l9_29=l9_25;
float3 l9_30=l9_26;
float l9_31=l9_28;
float3 l9_32=l9_29.position.xyz+(l9_30*l9_31);
l9_29.position=float4(l9_32.x,l9_32.y,l9_32.z,l9_29.position.w);
l9_25=l9_29;
l9_25.normal+=(l9_27*l9_28);
l9_8=l9_25;
}
else
{
sc_Vertex_t l9_33=l9_8;
float3 l9_34=in.blendShape0Pos;
float l9_35=(*sc_set2.UserUniforms).weights0.x;
float3 l9_36=l9_33.position.xyz+(l9_34*l9_35);
l9_33.position=float4(l9_36.x,l9_36.y,l9_36.z,l9_33.position.w);
l9_8=l9_33;
sc_Vertex_t l9_37=l9_8;
float3 l9_38=in.blendShape1Pos;
float l9_39=(*sc_set2.UserUniforms).weights0.y;
float3 l9_40=l9_37.position.xyz+(l9_38*l9_39);
l9_37.position=float4(l9_40.x,l9_40.y,l9_40.z,l9_37.position.w);
l9_8=l9_37;
sc_Vertex_t l9_41=l9_8;
float3 l9_42=in.blendShape2Pos;
float l9_43=(*sc_set2.UserUniforms).weights0.z;
float3 l9_44=l9_41.position.xyz+(l9_42*l9_43);
l9_41.position=float4(l9_44.x,l9_44.y,l9_44.z,l9_41.position.w);
l9_8=l9_41;
sc_Vertex_t l9_45=l9_8;
float3 l9_46=in.blendShape3Pos;
float l9_47=(*sc_set2.UserUniforms).weights0.w;
float3 l9_48=l9_45.position.xyz+(l9_46*l9_47);
l9_45.position=float4(l9_48.x,l9_48.y,l9_48.z,l9_45.position.w);
l9_8=l9_45;
sc_Vertex_t l9_49=l9_8;
float3 l9_50=in.blendShape4Pos;
float l9_51=(*sc_set2.UserUniforms).weights1.x;
float3 l9_52=l9_49.position.xyz+(l9_50*l9_51);
l9_49.position=float4(l9_52.x,l9_52.y,l9_52.z,l9_49.position.w);
l9_8=l9_49;
sc_Vertex_t l9_53=l9_8;
float3 l9_54=in.blendShape5Pos;
float l9_55=(*sc_set2.UserUniforms).weights1.y;
float3 l9_56=l9_53.position.xyz+(l9_54*l9_55);
l9_53.position=float4(l9_56.x,l9_56.y,l9_56.z,l9_53.position.w);
l9_8=l9_53;
}
}
param_1=l9_8;
sc_Vertex_t l9_57=param_1;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_58=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_58=float4(1.0,fract(in.boneData.yzw));
l9_58.x-=dot(l9_58.yzw,float3(1.0));
}
float4 l9_59=l9_58;
float4 l9_60=l9_59;
int l9_61=0;
int l9_62=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_62=int(in.boneData[l9_61]);
}
int l9_63=l9_62;
int l9_64=l9_63;
int l9_65=1;
int l9_66=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_66=int(in.boneData[l9_65]);
}
int l9_67=l9_66;
int l9_68=l9_67;
int l9_69=2;
int l9_70=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_70=int(in.boneData[l9_69]);
}
int l9_71=l9_70;
int l9_72=l9_71;
int l9_73=3;
int l9_74=0;
if (sc_SkinBonesCount_tmp>0)
{
l9_74=int(in.boneData[l9_73]);
}
int l9_75=l9_74;
int l9_76=l9_75;
int l9_77=l9_64;
float4 l9_78=l9_57.position;
float3 l9_79=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_80=l9_77;
float4 l9_81=(*sc_set2.sc_BonesUBO).sc_Bones[l9_80].boneMatrix[0];
float4 l9_82=(*sc_set2.sc_BonesUBO).sc_Bones[l9_80].boneMatrix[1];
float4 l9_83=(*sc_set2.sc_BonesUBO).sc_Bones[l9_80].boneMatrix[2];
float4 l9_84[3];
l9_84[0]=l9_81;
l9_84[1]=l9_82;
l9_84[2]=l9_83;
l9_79=float3(dot(l9_78,l9_84[0]),dot(l9_78,l9_84[1]),dot(l9_78,l9_84[2]));
}
else
{
l9_79=l9_78.xyz;
}
float3 l9_85=l9_79;
float3 l9_86=l9_85;
float l9_87=l9_60.x;
int l9_88=l9_68;
float4 l9_89=l9_57.position;
float3 l9_90=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_91=l9_88;
float4 l9_92=(*sc_set2.sc_BonesUBO).sc_Bones[l9_91].boneMatrix[0];
float4 l9_93=(*sc_set2.sc_BonesUBO).sc_Bones[l9_91].boneMatrix[1];
float4 l9_94=(*sc_set2.sc_BonesUBO).sc_Bones[l9_91].boneMatrix[2];
float4 l9_95[3];
l9_95[0]=l9_92;
l9_95[1]=l9_93;
l9_95[2]=l9_94;
l9_90=float3(dot(l9_89,l9_95[0]),dot(l9_89,l9_95[1]),dot(l9_89,l9_95[2]));
}
else
{
l9_90=l9_89.xyz;
}
float3 l9_96=l9_90;
float3 l9_97=l9_96;
float l9_98=l9_60.y;
int l9_99=l9_72;
float4 l9_100=l9_57.position;
float3 l9_101=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_102=l9_99;
float4 l9_103=(*sc_set2.sc_BonesUBO).sc_Bones[l9_102].boneMatrix[0];
float4 l9_104=(*sc_set2.sc_BonesUBO).sc_Bones[l9_102].boneMatrix[1];
float4 l9_105=(*sc_set2.sc_BonesUBO).sc_Bones[l9_102].boneMatrix[2];
float4 l9_106[3];
l9_106[0]=l9_103;
l9_106[1]=l9_104;
l9_106[2]=l9_105;
l9_101=float3(dot(l9_100,l9_106[0]),dot(l9_100,l9_106[1]),dot(l9_100,l9_106[2]));
}
else
{
l9_101=l9_100.xyz;
}
float3 l9_107=l9_101;
float3 l9_108=l9_107;
float l9_109=l9_60.z;
int l9_110=l9_76;
float4 l9_111=l9_57.position;
float3 l9_112=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_113=l9_110;
float4 l9_114=(*sc_set2.sc_BonesUBO).sc_Bones[l9_113].boneMatrix[0];
float4 l9_115=(*sc_set2.sc_BonesUBO).sc_Bones[l9_113].boneMatrix[1];
float4 l9_116=(*sc_set2.sc_BonesUBO).sc_Bones[l9_113].boneMatrix[2];
float4 l9_117[3];
l9_117[0]=l9_114;
l9_117[1]=l9_115;
l9_117[2]=l9_116;
l9_112=float3(dot(l9_111,l9_117[0]),dot(l9_111,l9_117[1]),dot(l9_111,l9_117[2]));
}
else
{
l9_112=l9_111.xyz;
}
float3 l9_118=l9_112;
float3 l9_119=(((l9_86*l9_87)+(l9_97*l9_98))+(l9_108*l9_109))+(l9_118*l9_60.w);
l9_57.position=float4(l9_119.x,l9_119.y,l9_119.z,l9_57.position.w);
int l9_120=l9_64;
float3x3 l9_121=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_120].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_120].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_120].normalMatrix[2].xyz));
float3x3 l9_122=l9_121;
float3x3 l9_123=l9_122;
int l9_124=l9_68;
float3x3 l9_125=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_124].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_124].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_124].normalMatrix[2].xyz));
float3x3 l9_126=l9_125;
float3x3 l9_127=l9_126;
int l9_128=l9_72;
float3x3 l9_129=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_128].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_128].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_128].normalMatrix[2].xyz));
float3x3 l9_130=l9_129;
float3x3 l9_131=l9_130;
int l9_132=l9_76;
float3x3 l9_133=float3x3(float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_132].normalMatrix[0].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_132].normalMatrix[1].xyz),float3((*sc_set2.sc_BonesUBO).sc_Bones[l9_132].normalMatrix[2].xyz));
float3x3 l9_134=l9_133;
float3x3 l9_135=l9_134;
l9_57.normal=((((l9_123*l9_57.normal)*l9_60.x)+((l9_127*l9_57.normal)*l9_60.y))+((l9_131*l9_57.normal)*l9_60.z))+((l9_135*l9_57.normal)*l9_60.w);
l9_57.tangent=((((l9_123*l9_57.tangent)*l9_60.x)+((l9_127*l9_57.tangent)*l9_60.y))+((l9_131*l9_57.tangent)*l9_60.z))+((l9_135*l9_57.tangent)*l9_60.w);
}
param_1=l9_57;
if (sc_RenderingSpace_tmp==3)
{
out.varPos=float3(0.0);
out.varNormal=param_1.normal;
out.varTangent=float4(param_1.tangent.x,param_1.tangent.y,param_1.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==4)
{
out.varPos=float3(0.0);
out.varNormal=param_1.normal;
out.varTangent=float4(param_1.tangent.x,param_1.tangent.y,param_1.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
out.varPos=param_1.position.xyz;
out.varNormal=param_1.normal;
out.varTangent=float4(param_1.tangent.x,param_1.tangent.y,param_1.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
out.varPos=((*sc_set2.UserUniforms).sc_ModelMatrix*param_1.position).xyz;
out.varNormal=(*sc_set2.UserUniforms).sc_NormalMatrix*param_1.normal;
float3 l9_136=(*sc_set2.UserUniforms).sc_NormalMatrix*param_1.tangent;
out.varTangent=float4(l9_136.x,l9_136.y,l9_136.z,out.varTangent.w);
}
}
}
}
if ((*sc_set2.UserUniforms).PreviewEnabled==1)
{
param_1.texture0.x=1.0-param_1.texture0.x;
}
out.varColor=in.color;
sc_Vertex_t v=param_1;
float3 WorldPosition=out.varPos;
float3 WorldNormal=out.varNormal;
float3 WorldTangent=out.varTangent.xyz;
if ((*sc_set2.UserUniforms).PreviewEnabled==1)
{
WorldPosition=out.varPos;
WorldNormal=out.varNormal;
WorldTangent=out.varTangent.xyz;
}
sc_Vertex_t param_2=v;
float3 param_3=WorldPosition;
float3 param_4=WorldNormal;
float3 param_5=WorldTangent;
float4 param_6=v.position;
out.varPos=param_3;
out.varNormal=normalize(param_4);
float3 l9_137=normalize(param_5);
out.varTangent=float4(l9_137.x,l9_137.y,l9_137.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
if ((int(UseViewSpaceDepthVariant_tmp)!=0)&&(((int(sc_OITDepthGatherPass_tmp)!=0)||(int(sc_OITCompositingPass_tmp)!=0))||(int(sc_OITDepthBoundsPass_tmp)!=0)))
{
float4 l9_138=param_2.position;
float4 l9_139=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
int l9_140=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_140=0;
}
else
{
l9_140=gl_InstanceIndex%2;
}
int l9_141=l9_140;
l9_139=(*sc_set2.UserUniforms).sc_ProjectionMatrixInverseArray[l9_141]*l9_138;
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_142=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_142=0;
}
else
{
l9_142=gl_InstanceIndex%2;
}
int l9_143=l9_142;
l9_139=(*sc_set2.UserUniforms).sc_ViewMatrixArray[l9_143]*l9_138;
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_144=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_144=0;
}
else
{
l9_144=gl_InstanceIndex%2;
}
int l9_145=l9_144;
l9_139=(*sc_set2.UserUniforms).sc_ModelViewMatrixArray[l9_145]*l9_138;
}
else
{
l9_139=l9_138;
}
}
}
float4 l9_146=l9_139;
out.varViewSpaceDepth=-l9_146.z;
}
float4 l9_147=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
l9_147=param_6;
}
else
{
if (sc_RenderingSpace_tmp==4)
{
int l9_148=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_148=0;
}
else
{
l9_148=gl_InstanceIndex%2;
}
int l9_149=l9_148;
l9_147=((*sc_set2.UserUniforms).sc_ModelViewMatrixArray[l9_149]*param_2.position)*float4(1.0/(*sc_set2.UserUniforms).sc_Camera.aspect,1.0,1.0,1.0);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_150=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_150=0;
}
else
{
l9_150=gl_InstanceIndex%2;
}
int l9_151=l9_150;
l9_147=(*sc_set2.UserUniforms).sc_ViewProjectionMatrixArray[l9_151]*float4(out.varPos,1.0);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_152=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_152=0;
}
else
{
l9_152=gl_InstanceIndex%2;
}
int l9_153=l9_152;
l9_147=(*sc_set2.UserUniforms).sc_ViewProjectionMatrixArray[l9_153]*float4(out.varPos,1.0);
}
}
}
}
out.varPackedTex=float4(param_2.texture0,param_2.texture1);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float4 l9_154=param_2.position;
float4 l9_155=l9_154;
if (sc_RenderingSpace_tmp==1)
{
l9_155=(*sc_set2.UserUniforms).sc_ModelMatrix*l9_154;
}
float4 l9_156=(*sc_set2.UserUniforms).sc_ProjectorMatrix*l9_155;
float2 l9_157=((l9_156.xy/float2(l9_156.w))*0.5)+float2(0.5);
out.varShadowTex=l9_157;
}
float4 l9_158=l9_147;
if (sc_DepthBufferMode_tmp==1)
{
float l9_159=2.0/log2((*sc_set2.UserUniforms).sc_Camera.clipPlanes.y+1.0);
l9_158.z=((log2(fast::max((*sc_set2.UserUniforms).sc_Camera.clipPlanes.x,1.0+l9_158.w))*l9_159)-1.0)*l9_158.w;
}
float4 l9_160=l9_158;
l9_147=l9_160;
float4 l9_161=l9_147;
float4 l9_162=l9_161;
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_163=l9_162;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_164=dot(l9_163,(*sc_set2.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_165=l9_164;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_165;
}
}
float4 l9_166=float4(l9_162.x,-l9_162.y,(l9_162.z*0.5)+(l9_162.w*0.5),l9_162.w);
out.gl_Position=l9_166;
v=param_2;
if (PreviewInfo.Saved)
{
out.PreviewVertexColor=float4(PreviewInfo.Color.xyz,1.0);
out.PreviewVertexSaved=1.0;
}
return out;
}
} // VERTEX SHADER


namespace SNAP_FS {
struct RayHitPayload
{
float3 viewDirWS;
float3 positionWS;
float3 normalWS;
float4 tangentWS;
float4 color;
float2 uv0;
float2 uv1;
float2 uv2;
float2 uv3;
uint2 id;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float2 gScreenCoord;
float2 Surface_UVCoord0;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[3];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float _sc_GetFramebufferColorInvalidUsageMarker;
float shaderComplexityValue;
float sc_DisableFrustumCullingMarker;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float _sc_framebufferFetchMarker;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
int isProxyMode;
int instance_id;
int lray_triangles_last;
int noEarlyZ;
int has_animated_pn;
int emitter_stride;
int proxy_offset_position;
int proxy_offset_normal;
int proxy_offset_tangent;
int proxy_offset_color;
int proxy_offset_texture0;
int proxy_offset_texture1;
int proxy_offset_texture2;
int proxy_offset_texture3;
int proxy_format_position;
int proxy_format_normal;
int proxy_format_tangent;
int proxy_format_color;
int proxy_format_texture0;
int proxy_format_texture1;
int proxy_format_texture2;
int proxy_format_texture3;
float4 z_rayDirectionsSize;
float4 z_rayDirectionsDims;
float4 z_rayDirectionsView;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed;
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float4 edgeColor;
float4 fillColor;
float noiseFrequency;
float opaticy;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float4 Port_Import_N020;
float Port_Import_N014;
float4 Port_Import_N015;
float3 Port_Default_N019;
float Port_Import_N013;
float2 Port_Input1_N003;
float Port_Multiplier_N009;
float Port_RangeMinA_N002;
float Port_RangeMaxA_N002;
float Port_RangeMinB_N002;
float Port_RangeMaxB_N002;
float Port_Import_N029;
float Port_Import_N011;
float4 Port_Import_N027;
float Port_Input1_N022;
float Port_Value1_N023;
float Port_Default_N037;
float Port_Import_N031;
float Port_Input1_N025;
float Port_Value1_N030;
float Port_Default_N039;
float Port_Import_N032;
float Port_Input1_N033;
float Port_Value1_N035;
float Port_Default_N052;
float depthRef;
};
struct layoutVertices_obj
{
float _Vertices[1];
};
struct layoutVerticesPN_obj
{
float _VerticesPN[1];
};
struct layoutIndices_obj
{
uint _Triangles[1];
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct sc_Set2
{
const device layoutIndices_obj* layoutIndices [[id(0)]];
const device layoutVertices_obj* layoutVertices [[id(1)]];
const device layoutVerticesPN_obj* layoutVerticesPN [[id(2)]];
constant sc_Bones_obj* sc_BonesUBO [[id(3)]];
texture2d<float> baseTex [[id(4)]];
texture2d<float> intensityTexture [[id(5)]];
texture2d<float> sc_ScreenTexture [[id(17)]];
texture2d<uint> z_hitIdAndBarycentric [[id(20)]];
texture2d<float> z_rayDirections [[id(21)]];
sampler baseTexSmpSC [[id(22)]];
sampler intensityTextureSmpSC [[id(23)]];
sampler sc_ScreenTextureSmpSC [[id(28)]];
sampler z_hitIdAndBarycentricSmp [[id(31)]];
sampler z_rayDirectionsSmpSC [[id(32)]];
constant userUniformsObj* UserUniforms [[id(33)]];
};
struct main_frag_out
{
float4 FragColor0 [[color(0)]];
float4 FragColor1 [[color(1)]];
float4 FragColor2 [[color(2)]];
float4 FragColor3 [[color(3)]];
};
struct main_frag_in
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
RayHitPayload GetHitData(thread const int2& screenPos,constant userUniformsObj& UserUniforms,thread texture2d<float> z_rayDirections,thread sampler z_rayDirectionsSmpSC,thread texture2d<uint> z_hitIdAndBarycentric,thread sampler z_hitIdAndBarycentricSmp,const device layoutVertices_obj& layoutVertices,const device layoutVerticesPN_obj& layoutVerticesPN,const device layoutIndices_obj& layoutIndices)
{
int2 param=screenPos;
uint4 l9_0=z_hitIdAndBarycentric.read(uint2(param),0);
uint4 id_and_barycentric=l9_0;
RayHitPayload rhp;
rhp.id=id_and_barycentric.xy;
if (rhp.id.x!=uint(UserUniforms.instance_id))
{
return rhp;
}
float2 brc_vw=float2(as_type<half2>(id_and_barycentric.z|(id_and_barycentric.w<<uint(16))));
float3 brc=float3((1.0-brc_vw.x)-brc_vw.y,brc_vw);
float2 param_1=z_rayDirections.read(uint2(screenPos),0).xy;
float3 l9_1=float3(param_1.x,param_1.y,(1.0-abs(param_1.x))-abs(param_1.y));
float l9_2=fast::clamp(-l9_1.z,0.0,1.0);
float l9_3;
if (l9_1.x>=0.0)
{
l9_3=-l9_2;
}
else
{
l9_3=l9_2;
}
float l9_4=l9_3;
float l9_5;
if (l9_1.y>=0.0)
{
l9_5=-l9_2;
}
else
{
l9_5=l9_2;
}
float2 l9_6=l9_1.xy+float2(l9_4,l9_5);
l9_1=float3(l9_6.x,l9_6.y,l9_1.z);
float3 l9_7=normalize(l9_1);
float3 rayDir=l9_7;
rhp.viewDirWS=-rayDir;
uint param_2=rhp.id.y;
uint l9_8=min(param_2,uint(UserUniforms.lray_triangles_last));
uint l9_9=l9_8*6u;
uint l9_10=l9_9&4294967292u;
uint4 l9_11=(uint4(uint2(layoutIndices._Triangles[l9_10/4u]),uint2(layoutIndices._Triangles[(l9_10/4u)+1u]))&uint4(65535u,4294967295u,65535u,4294967295u))>>uint4(0u,16u,0u,16u);
int3 l9_12;
if (l9_9==l9_10)
{
l9_12=int3(l9_11.xyz);
}
else
{
l9_12=int3(l9_11.yzw);
}
int3 l9_13=l9_12;
int3 i=l9_13;
if (UserUniforms.has_animated_pn!=0)
{
float3 param_3=brc;
int3 param_4=i;
int param_5=0;
int3 l9_14=(param_4*int3(6))+int3(param_5);
int l9_15=l9_14.x;
float3 l9_16=float3(layoutVerticesPN._VerticesPN[l9_15],layoutVerticesPN._VerticesPN[l9_15+1],layoutVerticesPN._VerticesPN[l9_15+2]);
int l9_17=l9_14.y;
float3 l9_18=float3(layoutVerticesPN._VerticesPN[l9_17],layoutVerticesPN._VerticesPN[l9_17+1],layoutVerticesPN._VerticesPN[l9_17+2]);
int l9_19=l9_14.z;
float3 l9_20=float3(layoutVerticesPN._VerticesPN[l9_19],layoutVerticesPN._VerticesPN[l9_19+1],layoutVerticesPN._VerticesPN[l9_19+2]);
float3 l9_21=((l9_16*param_3.x)+(l9_18*param_3.y))+(l9_20*param_3.z);
rhp.positionWS=l9_21;
}
else
{
float3 param_6=brc;
int3 param_7=i;
int3 l9_22=int3((param_7.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_position,(param_7.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_position,(param_7.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_position);
float3 l9_23=float3(0.0);
if (UserUniforms.proxy_format_position==5)
{
int l9_24=l9_22.x;
float3 l9_25=float3(layoutVertices._Vertices[l9_24],layoutVertices._Vertices[l9_24+1],layoutVertices._Vertices[l9_24+2]);
int l9_26=l9_22.y;
float3 l9_27=float3(layoutVertices._Vertices[l9_26],layoutVertices._Vertices[l9_26+1],layoutVertices._Vertices[l9_26+2]);
int l9_28=l9_22.z;
float3 l9_29=float3(layoutVertices._Vertices[l9_28],layoutVertices._Vertices[l9_28+1],layoutVertices._Vertices[l9_28+2]);
l9_23=((l9_25*param_6.x)+(l9_27*param_6.y))+(l9_29*param_6.z);
}
else
{
if (UserUniforms.proxy_format_position==6)
{
int l9_30=l9_22.x;
float3 l9_31=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_30]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_30+1]))).x);
int l9_32=l9_22.y;
float3 l9_33=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_32]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_32+1]))).x);
int l9_34=l9_22.z;
float3 l9_35=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_34]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_34+1]))).x);
l9_23=((l9_31*param_6.x)+(l9_33*param_6.y))+(l9_35*param_6.z);
}
else
{
l9_23=float3(1.0,0.0,0.0);
}
}
float3 l9_36=l9_23;
float3 positionOS=l9_36;
rhp.positionWS=(UserUniforms.sc_ModelMatrix*float4(positionOS,1.0)).xyz;
}
if (UserUniforms.proxy_offset_normal>0)
{
if (UserUniforms.has_animated_pn!=0)
{
float3 param_8=brc;
int3 param_9=i;
int param_10=3;
int3 l9_37=(param_9*int3(6))+int3(param_10);
int l9_38=l9_37.x;
float3 l9_39=float3(layoutVerticesPN._VerticesPN[l9_38],layoutVerticesPN._VerticesPN[l9_38+1],layoutVerticesPN._VerticesPN[l9_38+2]);
int l9_40=l9_37.y;
float3 l9_41=float3(layoutVerticesPN._VerticesPN[l9_40],layoutVerticesPN._VerticesPN[l9_40+1],layoutVerticesPN._VerticesPN[l9_40+2]);
int l9_42=l9_37.z;
float3 l9_43=float3(layoutVerticesPN._VerticesPN[l9_42],layoutVerticesPN._VerticesPN[l9_42+1],layoutVerticesPN._VerticesPN[l9_42+2]);
float3 l9_44=((l9_39*param_8.x)+(l9_41*param_8.y))+(l9_43*param_8.z);
rhp.normalWS=l9_44;
}
else
{
float3 param_11=brc;
int3 param_12=i;
int3 l9_45=int3((param_12.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_normal,(param_12.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_normal,(param_12.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_normal);
float3 l9_46=float3(0.0);
if (UserUniforms.proxy_format_normal==5)
{
int l9_47=l9_45.x;
float3 l9_48=float3(layoutVertices._Vertices[l9_47],layoutVertices._Vertices[l9_47+1],layoutVertices._Vertices[l9_47+2]);
int l9_49=l9_45.y;
float3 l9_50=float3(layoutVertices._Vertices[l9_49],layoutVertices._Vertices[l9_49+1],layoutVertices._Vertices[l9_49+2]);
int l9_51=l9_45.z;
float3 l9_52=float3(layoutVertices._Vertices[l9_51],layoutVertices._Vertices[l9_51+1],layoutVertices._Vertices[l9_51+2]);
l9_46=((l9_48*param_11.x)+(l9_50*param_11.y))+(l9_52*param_11.z);
}
else
{
if (UserUniforms.proxy_format_normal==6)
{
int l9_53=l9_45.x;
float3 l9_54=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_53]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_53+1]))).x);
int l9_55=l9_45.y;
float3 l9_56=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_55]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_55+1]))).x);
int l9_57=l9_45.z;
float3 l9_58=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_57]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_57+1]))).x);
l9_46=((l9_54*param_11.x)+(l9_56*param_11.y))+(l9_58*param_11.z);
}
else
{
l9_46=float3(1.0,0.0,0.0);
}
}
float3 l9_59=l9_46;
float3 normalOS=l9_59;
rhp.normalWS=normalize(UserUniforms.sc_NormalMatrix*normalOS);
}
}
else
{
rhp.normalWS=float3(1.0,0.0,0.0);
}
bool l9_60=!(UserUniforms.has_animated_pn!=0);
bool l9_61;
if (l9_60)
{
l9_61=UserUniforms.proxy_offset_tangent>0;
}
else
{
l9_61=l9_60;
}
if (l9_61)
{
float3 param_13=brc;
int3 param_14=i;
int3 l9_62=int3((param_14.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_tangent,(param_14.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_tangent,(param_14.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_tangent);
float4 l9_63=float4(0.0);
if (UserUniforms.proxy_format_tangent==5)
{
int l9_64=l9_62.x;
float4 l9_65=float4(layoutVertices._Vertices[l9_64],layoutVertices._Vertices[l9_64+1],layoutVertices._Vertices[l9_64+2],layoutVertices._Vertices[l9_64+3]);
int l9_66=l9_62.y;
float4 l9_67=float4(layoutVertices._Vertices[l9_66],layoutVertices._Vertices[l9_66+1],layoutVertices._Vertices[l9_66+2],layoutVertices._Vertices[l9_66+3]);
int l9_68=l9_62.z;
float4 l9_69=float4(layoutVertices._Vertices[l9_68],layoutVertices._Vertices[l9_68+1],layoutVertices._Vertices[l9_68+2],layoutVertices._Vertices[l9_68+3]);
l9_63=((l9_65*param_13.x)+(l9_67*param_13.y))+(l9_69*param_13.z);
}
else
{
if (UserUniforms.proxy_format_tangent==6)
{
int l9_70=l9_62.x;
float4 l9_71=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_70]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_70+1]))));
int l9_72=l9_62.y;
float4 l9_73=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_72]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_72+1]))));
int l9_74=l9_62.z;
float4 l9_75=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_74]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_74+1]))));
l9_63=((l9_71*param_13.x)+(l9_73*param_13.y))+(l9_75*param_13.z);
}
else
{
if (UserUniforms.proxy_format_tangent==2)
{
int l9_76=l9_62.x;
uint l9_77=as_type<uint>(layoutVertices._Vertices[l9_76]);
uint l9_78=l9_77&255u;
uint l9_79=(l9_77>>uint(8))&255u;
uint l9_80=(l9_77>>uint(16))&255u;
uint l9_81=(l9_77>>uint(24))&255u;
float4 l9_82=float4(float(l9_78),float(l9_79),float(l9_80),float(l9_81))/float4(255.0);
int l9_83=l9_62.y;
uint l9_84=as_type<uint>(layoutVertices._Vertices[l9_83]);
uint l9_85=l9_84&255u;
uint l9_86=(l9_84>>uint(8))&255u;
uint l9_87=(l9_84>>uint(16))&255u;
uint l9_88=(l9_84>>uint(24))&255u;
float4 l9_89=float4(float(l9_85),float(l9_86),float(l9_87),float(l9_88))/float4(255.0);
int l9_90=l9_62.z;
uint l9_91=as_type<uint>(layoutVertices._Vertices[l9_90]);
uint l9_92=l9_91&255u;
uint l9_93=(l9_91>>uint(8))&255u;
uint l9_94=(l9_91>>uint(16))&255u;
uint l9_95=(l9_91>>uint(24))&255u;
float4 l9_96=float4(float(l9_92),float(l9_93),float(l9_94),float(l9_95))/float4(255.0);
l9_63=((l9_82*param_13.x)+(l9_89*param_13.y))+(l9_96*param_13.z);
}
else
{
l9_63=float4(1.0,0.0,0.0,0.0);
}
}
}
float4 l9_97=l9_63;
float4 tangentOS=l9_97;
float3 tangentWS=normalize(UserUniforms.sc_NormalMatrix*tangentOS.xyz);
rhp.tangentWS=float4(tangentWS,tangentOS.w);
}
else
{
rhp.tangentWS=float4(1.0,0.0,0.0,1.0);
}
if (UserUniforms.proxy_format_color>0)
{
float3 param_15=brc;
int3 param_16=i;
int3 l9_98=int3((param_16.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_color,(param_16.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_color,(param_16.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_color);
float4 l9_99=float4(0.0);
if (UserUniforms.proxy_format_color==5)
{
int l9_100=l9_98.x;
float4 l9_101=float4(layoutVertices._Vertices[l9_100],layoutVertices._Vertices[l9_100+1],layoutVertices._Vertices[l9_100+2],layoutVertices._Vertices[l9_100+3]);
int l9_102=l9_98.y;
float4 l9_103=float4(layoutVertices._Vertices[l9_102],layoutVertices._Vertices[l9_102+1],layoutVertices._Vertices[l9_102+2],layoutVertices._Vertices[l9_102+3]);
int l9_104=l9_98.z;
float4 l9_105=float4(layoutVertices._Vertices[l9_104],layoutVertices._Vertices[l9_104+1],layoutVertices._Vertices[l9_104+2],layoutVertices._Vertices[l9_104+3]);
l9_99=((l9_101*param_15.x)+(l9_103*param_15.y))+(l9_105*param_15.z);
}
else
{
if (UserUniforms.proxy_format_color==6)
{
int l9_106=l9_98.x;
float4 l9_107=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_106]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_106+1]))));
int l9_108=l9_98.y;
float4 l9_109=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_108]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_108+1]))));
int l9_110=l9_98.z;
float4 l9_111=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_110]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_110+1]))));
l9_99=((l9_107*param_15.x)+(l9_109*param_15.y))+(l9_111*param_15.z);
}
else
{
if (UserUniforms.proxy_format_color==2)
{
int l9_112=l9_98.x;
uint l9_113=as_type<uint>(layoutVertices._Vertices[l9_112]);
uint l9_114=l9_113&255u;
uint l9_115=(l9_113>>uint(8))&255u;
uint l9_116=(l9_113>>uint(16))&255u;
uint l9_117=(l9_113>>uint(24))&255u;
float4 l9_118=float4(float(l9_114),float(l9_115),float(l9_116),float(l9_117))/float4(255.0);
int l9_119=l9_98.y;
uint l9_120=as_type<uint>(layoutVertices._Vertices[l9_119]);
uint l9_121=l9_120&255u;
uint l9_122=(l9_120>>uint(8))&255u;
uint l9_123=(l9_120>>uint(16))&255u;
uint l9_124=(l9_120>>uint(24))&255u;
float4 l9_125=float4(float(l9_121),float(l9_122),float(l9_123),float(l9_124))/float4(255.0);
int l9_126=l9_98.z;
uint l9_127=as_type<uint>(layoutVertices._Vertices[l9_126]);
uint l9_128=l9_127&255u;
uint l9_129=(l9_127>>uint(8))&255u;
uint l9_130=(l9_127>>uint(16))&255u;
uint l9_131=(l9_127>>uint(24))&255u;
float4 l9_132=float4(float(l9_128),float(l9_129),float(l9_130),float(l9_131))/float4(255.0);
l9_99=((l9_118*param_15.x)+(l9_125*param_15.y))+(l9_132*param_15.z);
}
else
{
l9_99=float4(1.0,0.0,0.0,0.0);
}
}
}
float4 l9_133=l9_99;
rhp.color=l9_133;
}
float2 dummy_red_black=float2(dot(brc,float3(int3(1)-(i%int3(2)))),0.0);
if (UserUniforms.proxy_format_texture0>0)
{
float3 param_17=brc;
int3 param_18=i;
int3 l9_134=int3((param_18.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture0,(param_18.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture0,(param_18.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture0);
float2 l9_135=float2(0.0);
if (UserUniforms.proxy_format_texture0==5)
{
int l9_136=l9_134.x;
float2 l9_137=float2(layoutVertices._Vertices[l9_136],layoutVertices._Vertices[l9_136+1]);
int l9_138=l9_134.y;
float2 l9_139=float2(layoutVertices._Vertices[l9_138],layoutVertices._Vertices[l9_138+1]);
int l9_140=l9_134.z;
float2 l9_141=float2(layoutVertices._Vertices[l9_140],layoutVertices._Vertices[l9_140+1]);
l9_135=((l9_137*param_17.x)+(l9_139*param_17.y))+(l9_141*param_17.z);
}
else
{
if (UserUniforms.proxy_format_texture0==6)
{
int l9_142=l9_134.x;
float2 l9_143=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_142])));
int l9_144=l9_134.y;
float2 l9_145=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_144])));
int l9_146=l9_134.z;
float2 l9_147=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_146])));
l9_135=((l9_143*param_17.x)+(l9_145*param_17.y))+(l9_147*param_17.z);
}
else
{
l9_135=float2(1.0,0.0);
}
}
float2 l9_148=l9_135;
rhp.uv0=l9_148;
}
else
{
rhp.uv0=dummy_red_black;
}
if (UserUniforms.proxy_format_texture1>0)
{
float3 param_19=brc;
int3 param_20=i;
int3 l9_149=int3((param_20.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture1,(param_20.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture1,(param_20.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture1);
float2 l9_150=float2(0.0);
if (UserUniforms.proxy_format_texture1==5)
{
int l9_151=l9_149.x;
float2 l9_152=float2(layoutVertices._Vertices[l9_151],layoutVertices._Vertices[l9_151+1]);
int l9_153=l9_149.y;
float2 l9_154=float2(layoutVertices._Vertices[l9_153],layoutVertices._Vertices[l9_153+1]);
int l9_155=l9_149.z;
float2 l9_156=float2(layoutVertices._Vertices[l9_155],layoutVertices._Vertices[l9_155+1]);
l9_150=((l9_152*param_19.x)+(l9_154*param_19.y))+(l9_156*param_19.z);
}
else
{
if (UserUniforms.proxy_format_texture1==6)
{
int l9_157=l9_149.x;
float2 l9_158=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_157])));
int l9_159=l9_149.y;
float2 l9_160=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_159])));
int l9_161=l9_149.z;
float2 l9_162=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_161])));
l9_150=((l9_158*param_19.x)+(l9_160*param_19.y))+(l9_162*param_19.z);
}
else
{
l9_150=float2(1.0,0.0);
}
}
float2 l9_163=l9_150;
rhp.uv1=l9_163;
}
else
{
rhp.uv1=dummy_red_black;
}
if (UserUniforms.proxy_format_texture2>0)
{
float3 param_21=brc;
int3 param_22=i;
int3 l9_164=int3((param_22.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture2,(param_22.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture2,(param_22.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture2);
float2 l9_165=float2(0.0);
if (UserUniforms.proxy_format_texture2==5)
{
int l9_166=l9_164.x;
float2 l9_167=float2(layoutVertices._Vertices[l9_166],layoutVertices._Vertices[l9_166+1]);
int l9_168=l9_164.y;
float2 l9_169=float2(layoutVertices._Vertices[l9_168],layoutVertices._Vertices[l9_168+1]);
int l9_170=l9_164.z;
float2 l9_171=float2(layoutVertices._Vertices[l9_170],layoutVertices._Vertices[l9_170+1]);
l9_165=((l9_167*param_21.x)+(l9_169*param_21.y))+(l9_171*param_21.z);
}
else
{
if (UserUniforms.proxy_format_texture2==6)
{
int l9_172=l9_164.x;
float2 l9_173=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_172])));
int l9_174=l9_164.y;
float2 l9_175=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_174])));
int l9_176=l9_164.z;
float2 l9_177=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_176])));
l9_165=((l9_173*param_21.x)+(l9_175*param_21.y))+(l9_177*param_21.z);
}
else
{
l9_165=float2(1.0,0.0);
}
}
float2 l9_178=l9_165;
rhp.uv2=l9_178;
}
else
{
rhp.uv2=dummy_red_black;
}
if (UserUniforms.proxy_format_texture3>0)
{
float3 param_23=brc;
int3 param_24=i;
int3 l9_179=int3((param_24.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture3,(param_24.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture3,(param_24.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture3);
float2 l9_180=float2(0.0);
if (UserUniforms.proxy_format_texture3==5)
{
int l9_181=l9_179.x;
float2 l9_182=float2(layoutVertices._Vertices[l9_181],layoutVertices._Vertices[l9_181+1]);
int l9_183=l9_179.y;
float2 l9_184=float2(layoutVertices._Vertices[l9_183],layoutVertices._Vertices[l9_183+1]);
int l9_185=l9_179.z;
float2 l9_186=float2(layoutVertices._Vertices[l9_185],layoutVertices._Vertices[l9_185+1]);
l9_180=((l9_182*param_23.x)+(l9_184*param_23.y))+(l9_186*param_23.z);
}
else
{
if (UserUniforms.proxy_format_texture3==6)
{
int l9_187=l9_179.x;
float2 l9_188=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_187])));
int l9_189=l9_179.y;
float2 l9_190=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_189])));
int l9_191=l9_179.z;
float2 l9_192=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_191])));
l9_180=((l9_188*param_23.x)+(l9_190*param_23.y))+(l9_192*param_23.z);
}
else
{
l9_180=float2(1.0,0.0);
}
}
float2 l9_193=l9_180;
rhp.uv3=l9_193;
}
else
{
rhp.uv3=dummy_red_black;
}
return rhp;
}
float2 VoronoiHash2D(thread float2& UV,thread const float& Offset)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2x2 m=float2x2(float2(0.15270001,0.4763),float2(0.4991,0.8998));
UV=fract(sin(mod(UV*m,float2(3.1400001)))*0.32345);
return float2((sin(UV.y*Offset)*0.5)+0.5,(cos(UV.x*Offset)*0.5)+0.5);
}
else
{
return float2(0.0);
}
}
float transformSingleColor(thread const float& original,thread const float& intMap,thread const float& target)
{
if (((int(BLEND_MODE_REALISTIC_tmp)!=0)||(int(BLEND_MODE_FORGRAY_tmp)!=0))||(int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
return original/pow(1.0-target,intMap);
}
else
{
if ((int(BLEND_MODE_DIVISION_tmp)!=0))
{
return original/(1.0-target);
}
else
{
if ((int(BLEND_MODE_BRIGHT_tmp)!=0))
{
return original/pow(1.0-target,2.0-(2.0*original));
}
}
}
return 0.0;
}
float3 transformColor(thread const float& yValue,thread const float3& original,thread const float3& target,thread const float& weight,thread const float& intMap)
{
if ((int(BLEND_MODE_INTENSE_tmp)!=0))
{
float3 param=original;
float3 l9_0=param;
float4 l9_1;
if (l9_0.y<l9_0.z)
{
l9_1=float4(l9_0.zy,-1.0,0.66666669);
}
else
{
l9_1=float4(l9_0.yz,0.0,-0.33333334);
}
float4 l9_2=l9_1;
float4 l9_3;
if (l9_0.x<l9_2.x)
{
l9_3=float4(l9_2.xyw,l9_0.x);
}
else
{
l9_3=float4(l9_0.x,l9_2.yzx);
}
float4 l9_4=l9_3;
float l9_5=l9_4.x-fast::min(l9_4.w,l9_4.y);
float l9_6=abs(((l9_4.w-l9_4.y)/((6.0*l9_5)+1e-07))+l9_4.z);
float l9_7=l9_4.x;
float3 l9_8=float3(l9_6,l9_5,l9_7);
float3 l9_9=l9_8;
float l9_10=l9_9.z-(l9_9.y*0.5);
float l9_11=l9_9.y/((1.0-abs((2.0*l9_10)-1.0))+1e-07);
float3 l9_12=float3(l9_9.x,l9_11,l9_10);
float3 hslOrig=l9_12;
float3 res=float3(0.0);
res.x=target.x;
res.y=target.y;
res.z=hslOrig.z;
float3 param_1=res;
float l9_13=param_1.x;
float l9_14=abs((6.0*l9_13)-3.0)-1.0;
float l9_15=2.0-abs((6.0*l9_13)-2.0);
float l9_16=2.0-abs((6.0*l9_13)-4.0);
float3 l9_17=fast::clamp(float3(l9_14,l9_15,l9_16),float3(0.0),float3(1.0));
float3 l9_18=l9_17;
float l9_19=(1.0-abs((2.0*param_1.z)-1.0))*param_1.y;
l9_18=((l9_18-float3(0.5))*l9_19)+float3(param_1.z);
float3 l9_20=l9_18;
res=l9_20;
float3 resColor=mix(original,res,float3(weight));
return resColor;
}
else
{
float3 tmpColor=float3(0.0);
float param_2=yValue;
float param_3=intMap;
float param_4=target.x;
tmpColor.x=transformSingleColor(param_2,param_3,param_4);
float param_5=yValue;
float param_6=intMap;
float param_7=target.y;
tmpColor.y=transformSingleColor(param_5,param_6,param_7);
float param_8=yValue;
float param_9=intMap;
float param_10=target.z;
tmpColor.z=transformSingleColor(param_8,param_9,param_10);
tmpColor=fast::clamp(tmpColor,float3(0.0),float3(1.0));
float3 resColor_1=mix(original,tmpColor,float3(weight));
return resColor_1;
}
}
float3 definedBlend(thread const float3& a,thread const float3& b,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> intensityTexture,thread sampler intensityTextureSmpSC)
{
if ((int(BLEND_MODE_LIGHTEN_tmp)!=0))
{
return fast::max(a,b);
}
else
{
if ((int(BLEND_MODE_DARKEN_tmp)!=0))
{
return fast::min(a,b);
}
else
{
if ((int(BLEND_MODE_DIVIDE_tmp)!=0))
{
return b/a;
}
else
{
if ((int(BLEND_MODE_AVERAGE_tmp)!=0))
{
return (a+b)*0.5;
}
else
{
if ((int(BLEND_MODE_SUBTRACT_tmp)!=0))
{
return fast::max((a+b)-float3(1.0),float3(0.0));
}
else
{
if ((int(BLEND_MODE_DIFFERENCE_tmp)!=0))
{
return abs(a-b);
}
else
{
if ((int(BLEND_MODE_NEGATION_tmp)!=0))
{
return float3(1.0)-abs((float3(1.0)-a)-b);
}
else
{
if ((int(BLEND_MODE_EXCLUSION_tmp)!=0))
{
return (a+b)-((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_OVERLAY_tmp)!=0))
{
float l9_0;
if (a.x<0.5)
{
l9_0=(2.0*a.x)*b.x;
}
else
{
l9_0=1.0-((2.0*(1.0-a.x))*(1.0-b.x));
}
float l9_1=l9_0;
float l9_2;
if (a.y<0.5)
{
l9_2=(2.0*a.y)*b.y;
}
else
{
l9_2=1.0-((2.0*(1.0-a.y))*(1.0-b.y));
}
float l9_3=l9_2;
float l9_4;
if (a.z<0.5)
{
l9_4=(2.0*a.z)*b.z;
}
else
{
l9_4=1.0-((2.0*(1.0-a.z))*(1.0-b.z));
}
return float3(l9_1,l9_3,l9_4);
}
else
{
if ((int(BLEND_MODE_SOFT_LIGHT_tmp)!=0))
{
return (((float3(1.0)-(b*2.0))*a)*a)+((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_HARD_LIGHT_tmp)!=0))
{
float l9_5;
if (b.x<0.5)
{
l9_5=(2.0*b.x)*a.x;
}
else
{
l9_5=1.0-((2.0*(1.0-b.x))*(1.0-a.x));
}
float l9_6=l9_5;
float l9_7;
if (b.y<0.5)
{
l9_7=(2.0*b.y)*a.y;
}
else
{
l9_7=1.0-((2.0*(1.0-b.y))*(1.0-a.y));
}
float l9_8=l9_7;
float l9_9;
if (b.z<0.5)
{
l9_9=(2.0*b.z)*a.z;
}
else
{
l9_9=1.0-((2.0*(1.0-b.z))*(1.0-a.z));
}
return float3(l9_6,l9_8,l9_9);
}
else
{
if ((int(BLEND_MODE_COLOR_DODGE_tmp)!=0))
{
float l9_10;
if (b.x==1.0)
{
l9_10=b.x;
}
else
{
l9_10=fast::min(a.x/(1.0-b.x),1.0);
}
float l9_11=l9_10;
float l9_12;
if (b.y==1.0)
{
l9_12=b.y;
}
else
{
l9_12=fast::min(a.y/(1.0-b.y),1.0);
}
float l9_13=l9_12;
float l9_14;
if (b.z==1.0)
{
l9_14=b.z;
}
else
{
l9_14=fast::min(a.z/(1.0-b.z),1.0);
}
return float3(l9_11,l9_13,l9_14);
}
else
{
if ((int(BLEND_MODE_COLOR_BURN_tmp)!=0))
{
float l9_15;
if (b.x==0.0)
{
l9_15=b.x;
}
else
{
l9_15=fast::max(1.0-((1.0-a.x)/b.x),0.0);
}
float l9_16=l9_15;
float l9_17;
if (b.y==0.0)
{
l9_17=b.y;
}
else
{
l9_17=fast::max(1.0-((1.0-a.y)/b.y),0.0);
}
float l9_18=l9_17;
float l9_19;
if (b.z==0.0)
{
l9_19=b.z;
}
else
{
l9_19=fast::max(1.0-((1.0-a.z)/b.z),0.0);
}
return float3(l9_16,l9_18,l9_19);
}
else
{
if ((int(BLEND_MODE_LINEAR_LIGHT_tmp)!=0))
{
float l9_20;
if (b.x<0.5)
{
l9_20=fast::max((a.x+(2.0*b.x))-1.0,0.0);
}
else
{
l9_20=fast::min(a.x+(2.0*(b.x-0.5)),1.0);
}
float l9_21=l9_20;
float l9_22;
if (b.y<0.5)
{
l9_22=fast::max((a.y+(2.0*b.y))-1.0,0.0);
}
else
{
l9_22=fast::min(a.y+(2.0*(b.y-0.5)),1.0);
}
float l9_23=l9_22;
float l9_24;
if (b.z<0.5)
{
l9_24=fast::max((a.z+(2.0*b.z))-1.0,0.0);
}
else
{
l9_24=fast::min(a.z+(2.0*(b.z-0.5)),1.0);
}
return float3(l9_21,l9_23,l9_24);
}
else
{
if ((int(BLEND_MODE_VIVID_LIGHT_tmp)!=0))
{
float l9_25;
if (b.x<0.5)
{
float l9_26;
if ((2.0*b.x)==0.0)
{
l9_26=2.0*b.x;
}
else
{
l9_26=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_25=l9_26;
}
else
{
float l9_27;
if ((2.0*(b.x-0.5))==1.0)
{
l9_27=2.0*(b.x-0.5);
}
else
{
l9_27=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_25=l9_27;
}
float l9_28=l9_25;
float l9_29;
if (b.y<0.5)
{
float l9_30;
if ((2.0*b.y)==0.0)
{
l9_30=2.0*b.y;
}
else
{
l9_30=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_29=l9_30;
}
else
{
float l9_31;
if ((2.0*(b.y-0.5))==1.0)
{
l9_31=2.0*(b.y-0.5);
}
else
{
l9_31=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_29=l9_31;
}
float l9_32=l9_29;
float l9_33;
if (b.z<0.5)
{
float l9_34;
if ((2.0*b.z)==0.0)
{
l9_34=2.0*b.z;
}
else
{
l9_34=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_33=l9_34;
}
else
{
float l9_35;
if ((2.0*(b.z-0.5))==1.0)
{
l9_35=2.0*(b.z-0.5);
}
else
{
l9_35=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_33=l9_35;
}
return float3(l9_28,l9_32,l9_33);
}
else
{
if ((int(BLEND_MODE_PIN_LIGHT_tmp)!=0))
{
float l9_36;
if (b.x<0.5)
{
l9_36=fast::min(a.x,2.0*b.x);
}
else
{
l9_36=fast::max(a.x,2.0*(b.x-0.5));
}
float l9_37=l9_36;
float l9_38;
if (b.y<0.5)
{
l9_38=fast::min(a.y,2.0*b.y);
}
else
{
l9_38=fast::max(a.y,2.0*(b.y-0.5));
}
float l9_39=l9_38;
float l9_40;
if (b.z<0.5)
{
l9_40=fast::min(a.z,2.0*b.z);
}
else
{
l9_40=fast::max(a.z,2.0*(b.z-0.5));
}
return float3(l9_37,l9_39,l9_40);
}
else
{
if ((int(BLEND_MODE_HARD_MIX_tmp)!=0))
{
float l9_41;
if (b.x<0.5)
{
float l9_42;
if ((2.0*b.x)==0.0)
{
l9_42=2.0*b.x;
}
else
{
l9_42=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_41=l9_42;
}
else
{
float l9_43;
if ((2.0*(b.x-0.5))==1.0)
{
l9_43=2.0*(b.x-0.5);
}
else
{
l9_43=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_41=l9_43;
}
float l9_44=l9_41;
float l9_45;
if (b.y<0.5)
{
float l9_46;
if ((2.0*b.y)==0.0)
{
l9_46=2.0*b.y;
}
else
{
l9_46=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_45=l9_46;
}
else
{
float l9_47;
if ((2.0*(b.y-0.5))==1.0)
{
l9_47=2.0*(b.y-0.5);
}
else
{
l9_47=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_45=l9_47;
}
float l9_48=l9_45;
float l9_49;
if (b.z<0.5)
{
float l9_50;
if ((2.0*b.z)==0.0)
{
l9_50=2.0*b.z;
}
else
{
l9_50=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_49=l9_50;
}
else
{
float l9_51;
if ((2.0*(b.z-0.5))==1.0)
{
l9_51=2.0*(b.z-0.5);
}
else
{
l9_51=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_49=l9_51;
}
return float3((l9_44<0.5) ? 0.0 : 1.0,(l9_48<0.5) ? 0.0 : 1.0,(l9_49<0.5) ? 0.0 : 1.0);
}
else
{
if ((int(BLEND_MODE_HARD_REFLECT_tmp)!=0))
{
float l9_52;
if (b.x==1.0)
{
l9_52=b.x;
}
else
{
l9_52=fast::min((a.x*a.x)/(1.0-b.x),1.0);
}
float l9_53=l9_52;
float l9_54;
if (b.y==1.0)
{
l9_54=b.y;
}
else
{
l9_54=fast::min((a.y*a.y)/(1.0-b.y),1.0);
}
float l9_55=l9_54;
float l9_56;
if (b.z==1.0)
{
l9_56=b.z;
}
else
{
l9_56=fast::min((a.z*a.z)/(1.0-b.z),1.0);
}
return float3(l9_53,l9_55,l9_56);
}
else
{
if ((int(BLEND_MODE_HARD_GLOW_tmp)!=0))
{
float l9_57;
if (a.x==1.0)
{
l9_57=a.x;
}
else
{
l9_57=fast::min((b.x*b.x)/(1.0-a.x),1.0);
}
float l9_58=l9_57;
float l9_59;
if (a.y==1.0)
{
l9_59=a.y;
}
else
{
l9_59=fast::min((b.y*b.y)/(1.0-a.y),1.0);
}
float l9_60=l9_59;
float l9_61;
if (a.z==1.0)
{
l9_61=a.z;
}
else
{
l9_61=fast::min((b.z*b.z)/(1.0-a.z),1.0);
}
return float3(l9_58,l9_60,l9_61);
}
else
{
if ((int(BLEND_MODE_HARD_PHOENIX_tmp)!=0))
{
return (fast::min(a,b)-fast::max(a,b))+float3(1.0);
}
else
{
if ((int(BLEND_MODE_HUE_tmp)!=0))
{
float3 param=a;
float3 param_1=b;
float3 l9_62=param;
float3 l9_63=l9_62;
float4 l9_64;
if (l9_63.y<l9_63.z)
{
l9_64=float4(l9_63.zy,-1.0,0.66666669);
}
else
{
l9_64=float4(l9_63.yz,0.0,-0.33333334);
}
float4 l9_65=l9_64;
float4 l9_66;
if (l9_63.x<l9_65.x)
{
l9_66=float4(l9_65.xyw,l9_63.x);
}
else
{
l9_66=float4(l9_63.x,l9_65.yzx);
}
float4 l9_67=l9_66;
float l9_68=l9_67.x-fast::min(l9_67.w,l9_67.y);
float l9_69=abs(((l9_67.w-l9_67.y)/((6.0*l9_68)+1e-07))+l9_67.z);
float l9_70=l9_67.x;
float3 l9_71=float3(l9_69,l9_68,l9_70);
float3 l9_72=l9_71;
float l9_73=l9_72.z-(l9_72.y*0.5);
float l9_74=l9_72.y/((1.0-abs((2.0*l9_73)-1.0))+1e-07);
float3 l9_75=float3(l9_72.x,l9_74,l9_73);
float3 l9_76=l9_75;
float3 l9_77=param_1;
float3 l9_78=l9_77;
float4 l9_79;
if (l9_78.y<l9_78.z)
{
l9_79=float4(l9_78.zy,-1.0,0.66666669);
}
else
{
l9_79=float4(l9_78.yz,0.0,-0.33333334);
}
float4 l9_80=l9_79;
float4 l9_81;
if (l9_78.x<l9_80.x)
{
l9_81=float4(l9_80.xyw,l9_78.x);
}
else
{
l9_81=float4(l9_78.x,l9_80.yzx);
}
float4 l9_82=l9_81;
float l9_83=l9_82.x-fast::min(l9_82.w,l9_82.y);
float l9_84=abs(((l9_82.w-l9_82.y)/((6.0*l9_83)+1e-07))+l9_82.z);
float l9_85=l9_82.x;
float3 l9_86=float3(l9_84,l9_83,l9_85);
float3 l9_87=l9_86;
float l9_88=l9_87.z-(l9_87.y*0.5);
float l9_89=l9_87.y/((1.0-abs((2.0*l9_88)-1.0))+1e-07);
float3 l9_90=float3(l9_87.x,l9_89,l9_88);
float3 l9_91=float3(l9_90.x,l9_76.y,l9_76.z);
float l9_92=l9_91.x;
float l9_93=abs((6.0*l9_92)-3.0)-1.0;
float l9_94=2.0-abs((6.0*l9_92)-2.0);
float l9_95=2.0-abs((6.0*l9_92)-4.0);
float3 l9_96=fast::clamp(float3(l9_93,l9_94,l9_95),float3(0.0),float3(1.0));
float3 l9_97=l9_96;
float l9_98=(1.0-abs((2.0*l9_91.z)-1.0))*l9_91.y;
l9_97=((l9_97-float3(0.5))*l9_98)+float3(l9_91.z);
float3 l9_99=l9_97;
float3 l9_100=l9_99;
return l9_100;
}
else
{
if ((int(BLEND_MODE_SATURATION_tmp)!=0))
{
float3 param_2=a;
float3 param_3=b;
float3 l9_101=param_2;
float3 l9_102=l9_101;
float4 l9_103;
if (l9_102.y<l9_102.z)
{
l9_103=float4(l9_102.zy,-1.0,0.66666669);
}
else
{
l9_103=float4(l9_102.yz,0.0,-0.33333334);
}
float4 l9_104=l9_103;
float4 l9_105;
if (l9_102.x<l9_104.x)
{
l9_105=float4(l9_104.xyw,l9_102.x);
}
else
{
l9_105=float4(l9_102.x,l9_104.yzx);
}
float4 l9_106=l9_105;
float l9_107=l9_106.x-fast::min(l9_106.w,l9_106.y);
float l9_108=abs(((l9_106.w-l9_106.y)/((6.0*l9_107)+1e-07))+l9_106.z);
float l9_109=l9_106.x;
float3 l9_110=float3(l9_108,l9_107,l9_109);
float3 l9_111=l9_110;
float l9_112=l9_111.z-(l9_111.y*0.5);
float l9_113=l9_111.y/((1.0-abs((2.0*l9_112)-1.0))+1e-07);
float3 l9_114=float3(l9_111.x,l9_113,l9_112);
float3 l9_115=l9_114;
float l9_116=l9_115.x;
float3 l9_117=param_3;
float3 l9_118=l9_117;
float4 l9_119;
if (l9_118.y<l9_118.z)
{
l9_119=float4(l9_118.zy,-1.0,0.66666669);
}
else
{
l9_119=float4(l9_118.yz,0.0,-0.33333334);
}
float4 l9_120=l9_119;
float4 l9_121;
if (l9_118.x<l9_120.x)
{
l9_121=float4(l9_120.xyw,l9_118.x);
}
else
{
l9_121=float4(l9_118.x,l9_120.yzx);
}
float4 l9_122=l9_121;
float l9_123=l9_122.x-fast::min(l9_122.w,l9_122.y);
float l9_124=abs(((l9_122.w-l9_122.y)/((6.0*l9_123)+1e-07))+l9_122.z);
float l9_125=l9_122.x;
float3 l9_126=float3(l9_124,l9_123,l9_125);
float3 l9_127=l9_126;
float l9_128=l9_127.z-(l9_127.y*0.5);
float l9_129=l9_127.y/((1.0-abs((2.0*l9_128)-1.0))+1e-07);
float3 l9_130=float3(l9_127.x,l9_129,l9_128);
float3 l9_131=float3(l9_116,l9_130.y,l9_115.z);
float l9_132=l9_131.x;
float l9_133=abs((6.0*l9_132)-3.0)-1.0;
float l9_134=2.0-abs((6.0*l9_132)-2.0);
float l9_135=2.0-abs((6.0*l9_132)-4.0);
float3 l9_136=fast::clamp(float3(l9_133,l9_134,l9_135),float3(0.0),float3(1.0));
float3 l9_137=l9_136;
float l9_138=(1.0-abs((2.0*l9_131.z)-1.0))*l9_131.y;
l9_137=((l9_137-float3(0.5))*l9_138)+float3(l9_131.z);
float3 l9_139=l9_137;
float3 l9_140=l9_139;
return l9_140;
}
else
{
if ((int(BLEND_MODE_COLOR_tmp)!=0))
{
float3 param_4=a;
float3 param_5=b;
float3 l9_141=param_5;
float3 l9_142=l9_141;
float4 l9_143;
if (l9_142.y<l9_142.z)
{
l9_143=float4(l9_142.zy,-1.0,0.66666669);
}
else
{
l9_143=float4(l9_142.yz,0.0,-0.33333334);
}
float4 l9_144=l9_143;
float4 l9_145;
if (l9_142.x<l9_144.x)
{
l9_145=float4(l9_144.xyw,l9_142.x);
}
else
{
l9_145=float4(l9_142.x,l9_144.yzx);
}
float4 l9_146=l9_145;
float l9_147=l9_146.x-fast::min(l9_146.w,l9_146.y);
float l9_148=abs(((l9_146.w-l9_146.y)/((6.0*l9_147)+1e-07))+l9_146.z);
float l9_149=l9_146.x;
float3 l9_150=float3(l9_148,l9_147,l9_149);
float3 l9_151=l9_150;
float l9_152=l9_151.z-(l9_151.y*0.5);
float l9_153=l9_151.y/((1.0-abs((2.0*l9_152)-1.0))+1e-07);
float3 l9_154=float3(l9_151.x,l9_153,l9_152);
float3 l9_155=l9_154;
float l9_156=l9_155.x;
float l9_157=l9_155.y;
float3 l9_158=param_4;
float3 l9_159=l9_158;
float4 l9_160;
if (l9_159.y<l9_159.z)
{
l9_160=float4(l9_159.zy,-1.0,0.66666669);
}
else
{
l9_160=float4(l9_159.yz,0.0,-0.33333334);
}
float4 l9_161=l9_160;
float4 l9_162;
if (l9_159.x<l9_161.x)
{
l9_162=float4(l9_161.xyw,l9_159.x);
}
else
{
l9_162=float4(l9_159.x,l9_161.yzx);
}
float4 l9_163=l9_162;
float l9_164=l9_163.x-fast::min(l9_163.w,l9_163.y);
float l9_165=abs(((l9_163.w-l9_163.y)/((6.0*l9_164)+1e-07))+l9_163.z);
float l9_166=l9_163.x;
float3 l9_167=float3(l9_165,l9_164,l9_166);
float3 l9_168=l9_167;
float l9_169=l9_168.z-(l9_168.y*0.5);
float l9_170=l9_168.y/((1.0-abs((2.0*l9_169)-1.0))+1e-07);
float3 l9_171=float3(l9_168.x,l9_170,l9_169);
float3 l9_172=float3(l9_156,l9_157,l9_171.z);
float l9_173=l9_172.x;
float l9_174=abs((6.0*l9_173)-3.0)-1.0;
float l9_175=2.0-abs((6.0*l9_173)-2.0);
float l9_176=2.0-abs((6.0*l9_173)-4.0);
float3 l9_177=fast::clamp(float3(l9_174,l9_175,l9_176),float3(0.0),float3(1.0));
float3 l9_178=l9_177;
float l9_179=(1.0-abs((2.0*l9_172.z)-1.0))*l9_172.y;
l9_178=((l9_178-float3(0.5))*l9_179)+float3(l9_172.z);
float3 l9_180=l9_178;
float3 l9_181=l9_180;
return l9_181;
}
else
{
if ((int(BLEND_MODE_LUMINOSITY_tmp)!=0))
{
float3 param_6=a;
float3 param_7=b;
float3 l9_182=param_6;
float3 l9_183=l9_182;
float4 l9_184;
if (l9_183.y<l9_183.z)
{
l9_184=float4(l9_183.zy,-1.0,0.66666669);
}
else
{
l9_184=float4(l9_183.yz,0.0,-0.33333334);
}
float4 l9_185=l9_184;
float4 l9_186;
if (l9_183.x<l9_185.x)
{
l9_186=float4(l9_185.xyw,l9_183.x);
}
else
{
l9_186=float4(l9_183.x,l9_185.yzx);
}
float4 l9_187=l9_186;
float l9_188=l9_187.x-fast::min(l9_187.w,l9_187.y);
float l9_189=abs(((l9_187.w-l9_187.y)/((6.0*l9_188)+1e-07))+l9_187.z);
float l9_190=l9_187.x;
float3 l9_191=float3(l9_189,l9_188,l9_190);
float3 l9_192=l9_191;
float l9_193=l9_192.z-(l9_192.y*0.5);
float l9_194=l9_192.y/((1.0-abs((2.0*l9_193)-1.0))+1e-07);
float3 l9_195=float3(l9_192.x,l9_194,l9_193);
float3 l9_196=l9_195;
float l9_197=l9_196.x;
float l9_198=l9_196.y;
float3 l9_199=param_7;
float3 l9_200=l9_199;
float4 l9_201;
if (l9_200.y<l9_200.z)
{
l9_201=float4(l9_200.zy,-1.0,0.66666669);
}
else
{
l9_201=float4(l9_200.yz,0.0,-0.33333334);
}
float4 l9_202=l9_201;
float4 l9_203;
if (l9_200.x<l9_202.x)
{
l9_203=float4(l9_202.xyw,l9_200.x);
}
else
{
l9_203=float4(l9_200.x,l9_202.yzx);
}
float4 l9_204=l9_203;
float l9_205=l9_204.x-fast::min(l9_204.w,l9_204.y);
float l9_206=abs(((l9_204.w-l9_204.y)/((6.0*l9_205)+1e-07))+l9_204.z);
float l9_207=l9_204.x;
float3 l9_208=float3(l9_206,l9_205,l9_207);
float3 l9_209=l9_208;
float l9_210=l9_209.z-(l9_209.y*0.5);
float l9_211=l9_209.y/((1.0-abs((2.0*l9_210)-1.0))+1e-07);
float3 l9_212=float3(l9_209.x,l9_211,l9_210);
float3 l9_213=float3(l9_197,l9_198,l9_212.z);
float l9_214=l9_213.x;
float l9_215=abs((6.0*l9_214)-3.0)-1.0;
float l9_216=2.0-abs((6.0*l9_214)-2.0);
float l9_217=2.0-abs((6.0*l9_214)-4.0);
float3 l9_218=fast::clamp(float3(l9_215,l9_216,l9_217),float3(0.0),float3(1.0));
float3 l9_219=l9_218;
float l9_220=(1.0-abs((2.0*l9_213.z)-1.0))*l9_213.y;
l9_219=((l9_219-float3(0.5))*l9_220)+float3(l9_213.z);
float3 l9_221=l9_219;
float3 l9_222=l9_221;
return l9_222;
}
else
{
float3 param_8=a;
float3 param_9=b;
float3 l9_223=param_8;
float l9_224=((0.29899999*l9_223.x)+(0.58700001*l9_223.y))+(0.114*l9_223.z);
float l9_225=l9_224;
float l9_226=1.0;
float l9_227=pow(l9_225,1.0/UserUniforms.correctedIntensity);
int l9_228=0;
if ((int(intensityTextureHasSwappedViews_tmp)!=0))
{
int l9_229=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_229=0;
}
else
{
l9_229=varStereoViewID;
}
int l9_230=l9_229;
l9_228=1-l9_230;
}
else
{
int l9_231=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_231=0;
}
else
{
l9_231=varStereoViewID;
}
int l9_232=l9_231;
l9_228=l9_232;
}
int l9_233=l9_228;
int l9_234=intensityTextureLayout_tmp;
int l9_235=l9_233;
float2 l9_236=float2(l9_227,0.5);
bool l9_237=(int(SC_USE_UV_TRANSFORM_intensityTexture_tmp)!=0);
float3x3 l9_238=UserUniforms.intensityTextureTransform;
int2 l9_239=int2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp);
bool l9_240=(int(SC_USE_UV_MIN_MAX_intensityTexture_tmp)!=0);
float4 l9_241=UserUniforms.intensityTextureUvMinMax;
bool l9_242=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp)!=0);
float4 l9_243=UserUniforms.intensityTextureBorderColor;
float l9_244=0.0;
bool l9_245=l9_242&&(!l9_240);
float l9_246=1.0;
float l9_247=l9_236.x;
int l9_248=l9_239.x;
if (l9_248==1)
{
l9_247=fract(l9_247);
}
else
{
if (l9_248==2)
{
float l9_249=fract(l9_247);
float l9_250=l9_247-l9_249;
float l9_251=step(0.25,fract(l9_250*0.5));
l9_247=mix(l9_249,1.0-l9_249,fast::clamp(l9_251,0.0,1.0));
}
}
l9_236.x=l9_247;
float l9_252=l9_236.y;
int l9_253=l9_239.y;
if (l9_253==1)
{
l9_252=fract(l9_252);
}
else
{
if (l9_253==2)
{
float l9_254=fract(l9_252);
float l9_255=l9_252-l9_254;
float l9_256=step(0.25,fract(l9_255*0.5));
l9_252=mix(l9_254,1.0-l9_254,fast::clamp(l9_256,0.0,1.0));
}
}
l9_236.y=l9_252;
if (l9_240)
{
bool l9_257=l9_242;
bool l9_258;
if (l9_257)
{
l9_258=l9_239.x==3;
}
else
{
l9_258=l9_257;
}
float l9_259=l9_236.x;
float l9_260=l9_241.x;
float l9_261=l9_241.z;
bool l9_262=l9_258;
float l9_263=l9_246;
float l9_264=fast::clamp(l9_259,l9_260,l9_261);
float l9_265=step(abs(l9_259-l9_264),9.9999997e-06);
l9_263*=(l9_265+((1.0-float(l9_262))*(1.0-l9_265)));
l9_259=l9_264;
l9_236.x=l9_259;
l9_246=l9_263;
bool l9_266=l9_242;
bool l9_267;
if (l9_266)
{
l9_267=l9_239.y==3;
}
else
{
l9_267=l9_266;
}
float l9_268=l9_236.y;
float l9_269=l9_241.y;
float l9_270=l9_241.w;
bool l9_271=l9_267;
float l9_272=l9_246;
float l9_273=fast::clamp(l9_268,l9_269,l9_270);
float l9_274=step(abs(l9_268-l9_273),9.9999997e-06);
l9_272*=(l9_274+((1.0-float(l9_271))*(1.0-l9_274)));
l9_268=l9_273;
l9_236.y=l9_268;
l9_246=l9_272;
}
float2 l9_275=l9_236;
bool l9_276=l9_237;
float3x3 l9_277=l9_238;
if (l9_276)
{
l9_275=float2((l9_277*float3(l9_275,1.0)).xy);
}
float2 l9_278=l9_275;
float2 l9_279=l9_278;
float2 l9_280=l9_279;
l9_236=l9_280;
float l9_281=l9_236.x;
int l9_282=l9_239.x;
bool l9_283=l9_245;
float l9_284=l9_246;
if ((l9_282==0)||(l9_282==3))
{
float l9_285=l9_281;
float l9_286=0.0;
float l9_287=1.0;
bool l9_288=l9_283;
float l9_289=l9_284;
float l9_290=fast::clamp(l9_285,l9_286,l9_287);
float l9_291=step(abs(l9_285-l9_290),9.9999997e-06);
l9_289*=(l9_291+((1.0-float(l9_288))*(1.0-l9_291)));
l9_285=l9_290;
l9_281=l9_285;
l9_284=l9_289;
}
l9_236.x=l9_281;
l9_246=l9_284;
float l9_292=l9_236.y;
int l9_293=l9_239.y;
bool l9_294=l9_245;
float l9_295=l9_246;
if ((l9_293==0)||(l9_293==3))
{
float l9_296=l9_292;
float l9_297=0.0;
float l9_298=1.0;
bool l9_299=l9_294;
float l9_300=l9_295;
float l9_301=fast::clamp(l9_296,l9_297,l9_298);
float l9_302=step(abs(l9_296-l9_301),9.9999997e-06);
l9_300*=(l9_302+((1.0-float(l9_299))*(1.0-l9_302)));
l9_296=l9_301;
l9_292=l9_296;
l9_295=l9_300;
}
l9_236.y=l9_292;
l9_246=l9_295;
float2 l9_303=l9_236;
int l9_304=l9_234;
int l9_305=l9_235;
float l9_306=l9_244;
float2 l9_307=l9_303;
int l9_308=l9_304;
int l9_309=l9_305;
float3 l9_310=float3(0.0);
if (l9_308==0)
{
l9_310=float3(l9_307,0.0);
}
else
{
if (l9_308==1)
{
l9_310=float3(l9_307.x,(l9_307.y*0.5)+(0.5-(float(l9_309)*0.5)),0.0);
}
else
{
l9_310=float3(l9_307,float(l9_309));
}
}
float3 l9_311=l9_310;
float3 l9_312=l9_311;
float2 l9_313=l9_312.xy;
float l9_314=l9_306;
float4 l9_315=intensityTexture.sample(intensityTextureSmpSC,l9_313,bias(l9_314));
float4 l9_316=l9_315;
float4 l9_317=l9_316;
if (l9_242)
{
l9_317=mix(l9_243,l9_317,float4(l9_246));
}
float4 l9_318=l9_317;
float3 l9_319=l9_318.xyz;
float3 l9_320=l9_319;
float l9_321=16.0;
float l9_322=((((l9_320.x*256.0)+l9_320.y)+(l9_320.z/256.0))/257.00391)*l9_321;
float l9_323=l9_322;
if ((int(BLEND_MODE_FORGRAY_tmp)!=0))
{
l9_323=fast::max(l9_323,1.0);
}
if ((int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
l9_323=fast::min(l9_323,1.0);
}
float l9_324=l9_225;
float3 l9_325=param_8;
float3 l9_326=param_9;
float l9_327=l9_226;
float l9_328=l9_323;
float3 l9_329=transformColor(l9_324,l9_325,l9_326,l9_327,l9_328);
return l9_329;
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
float4 outputMotionVectorsIfNeeded(thread const float3& surfacePosWorldSpace,thread const float4& finalColor,thread int& varStereoViewID,constant userUniformsObj& UserUniforms)
{
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
float3 param=surfacePosWorldSpace;
int l9_0=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_0=0;
}
else
{
l9_0=varStereoViewID;
}
int l9_1=l9_0;
float4 l9_2=UserUniforms.sc_ViewProjectionMatrixArray[l9_1]*float4(param,1.0);
float2 l9_3=l9_2.xy/float2(l9_2.w);
l9_2=float4(l9_3.x,l9_3.y,l9_2.z,l9_2.w);
int l9_4=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4=0;
}
else
{
l9_4=varStereoViewID;
}
int l9_5=l9_4;
float4 l9_6=((UserUniforms.sc_PrevFrameViewProjectionMatrixArray[l9_5]*UserUniforms.sc_PrevFrameModelMatrix)*UserUniforms.sc_ModelMatrixInverse)*float4(param,1.0);
float2 l9_7=l9_6.xy/float2(l9_6.w);
l9_6=float4(l9_7.x,l9_7.y,l9_6.z,l9_6.w);
float2 l9_8=(l9_2.xy-l9_6.xy)*0.5;
float2 l9_9=l9_8;
float l9_10=(l9_9.x*5.0)+0.5;
float l9_11=floor(l9_10*65535.0);
float l9_12=floor(l9_11*0.00390625);
float2 l9_13=float2(l9_12/255.0,(l9_11-(l9_12*256.0))/255.0);
float l9_14=(l9_9.y*5.0)+0.5;
float l9_15=floor(l9_14*65535.0);
float l9_16=floor(l9_15*0.00390625);
float2 l9_17=float2(l9_16/255.0,(l9_15-(l9_16*256.0))/255.0);
float4 l9_18=float4(l9_13,l9_17);
float4 l9_19=l9_18;
return l9_19;
}
else
{
return finalColor;
}
}
fragment main_frag_out main_frag(main_frag_in in [[stage_in]],constant sc_Set2& sc_set2 [[buffer(2)]],float4 gl_FragCoord [[position]])
{
main_frag_out out={};
if ((int(sc_DepthOnly_tmp)!=0))
{
return out;
}
if ((sc_StereoRenderingMode_tmp==1)&&(sc_StereoRendering_IsClipDistanceEnabled_tmp==0))
{
if (in.varClipDistance<0.0)
{
discard_fragment();
}
}
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=in.PreviewVertexColor;
PreviewInfo.Saved=((in.PreviewVertexSaved*1.0)!=0.0) ? true : false;
float4 FinalColor=float4(1.0);
float l9_0;
if ((*sc_set2.UserUniforms).overrideTimeEnabled==1)
{
l9_0=(*sc_set2.UserUniforms).overrideTimeElapsed;
}
else
{
l9_0=(*sc_set2.UserUniforms).sc_Time.x;
}
ssGlobals Globals;
Globals.gTimeElapsed=l9_0;
float l9_1;
if ((*sc_set2.UserUniforms).overrideTimeEnabled==1)
{
l9_1=(*sc_set2.UserUniforms).overrideTimeDelta;
}
else
{
l9_1=(*sc_set2.UserUniforms).sc_Time.y;
}
Globals.gTimeDelta=l9_1;
bool l9_2=(*sc_set2.UserUniforms).isProxyMode!=0;
if (l9_2)
{
float4 l9_3=gl_FragCoord;
int2 l9_4=int2(l9_3.xy);
RayHitPayload l9_5=GetHitData(l9_4,(*sc_set2.UserUniforms),sc_set2.z_rayDirections,sc_set2.z_rayDirectionsSmpSC,sc_set2.z_hitIdAndBarycentric,sc_set2.z_hitIdAndBarycentricSmp,(*sc_set2.layoutVertices),(*sc_set2.layoutVerticesPN),(*sc_set2.layoutIndices));
RayHitPayload rhp=l9_5;
bool l9_6=(*sc_set2.UserUniforms).noEarlyZ!=0;
if (l9_6)
{
if (rhp.id.x!=uint((*sc_set2.UserUniforms).instance_id))
{
return out;
}
}
int l9_7=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7=0;
}
else
{
l9_7=in.varStereoViewID;
}
int l9_8=l9_7;
float4 emitterPositionCS=(*sc_set2.UserUniforms).sc_ViewProjectionMatrixArray[l9_8]*float4(rhp.positionWS,1.0);
Globals.gScreenCoord=((emitterPositionCS.xy/float2(emitterPositionCS.w))*0.5)+float2(0.5);
Globals.Surface_UVCoord0=rhp.uv0;
}
else
{
float4 l9_9=gl_FragCoord;
float2 l9_10=(l9_9.xy*(*sc_set2.UserUniforms).sc_WindowToViewportTransform.xy)+(*sc_set2.UserUniforms).sc_WindowToViewportTransform.zw;
float2 l9_11=l9_10;
float2 l9_12=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_13=1;
int l9_14=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_14=0;
}
else
{
l9_14=in.varStereoViewID;
}
int l9_15=l9_14;
int l9_16=l9_15;
float3 l9_17=float3(l9_11,0.0);
int l9_18=l9_13;
int l9_19=l9_16;
if (l9_18==1)
{
l9_17.y=((2.0*l9_17.y)+float(l9_19))-1.0;
}
float2 l9_20=l9_17.xy;
l9_12=l9_20;
}
else
{
l9_12=l9_11;
}
float2 l9_21=l9_12;
float2 l9_22=l9_21;
float2 l9_23=l9_22;
Globals.gScreenCoord=l9_23;
Globals.Surface_UVCoord0=in.varPackedTex.xy;
}
float4 Output_N10=float4(0.0);
float4 param=(*sc_set2.UserUniforms).edgeColor;
Output_N10=param;
float4 Value_N20=float4(0.0);
Value_N20=Output_N10;
float3 Result_N19=float3(0.0);
float3 param_1=float3(0.0);
float3 param_2=(*sc_set2.UserUniforms).Port_Default_N019;
float3 param_3;
if ((int(Tweak_N1_tmp)!=0))
{
float4 l9_24=float4(0.0);
float4 l9_25=(*sc_set2.UserUniforms).fillColor;
l9_24=l9_25;
float4 l9_26=float4(0.0);
l9_26=l9_24;
param_1=l9_26.xyz;
param_3=param_1;
}
else
{
param_3=param_2;
}
Result_N19=param_3;
float2 ScreenCoord_N6=float2(0.0);
ScreenCoord_N6=Globals.gScreenCoord;
float Output_N8=0.0;
float param_4=(*sc_set2.UserUniforms).noiseFrequency;
Output_N8=param_4;
float Value_N13=0.0;
Value_N13=Output_N8;
float2 Output_N3=float2(0.0);
Output_N3=float2(Value_N13)*(*sc_set2.UserUniforms).Port_Input1_N003;
float Time_N9=0.0;
Time_N9=Globals.gTimeElapsed*(*sc_set2.UserUniforms).Port_Multiplier_N009;
float Noise_N0=0.0;
float2 param_5=ScreenCoord_N6;
float2 param_6=Output_N3;
float param_7=Time_N9;
float param_8;
if (SC_DEVICE_CLASS_tmp>=2)
{
param_5.x=floor(param_5.x*10000.0)*9.9999997e-05;
param_5.y=floor(param_5.y*10000.0)*9.9999997e-05;
float2 l9_27=floor(param_5*param_6);
float2 l9_28=fract(param_5*param_6);
float3 l9_29=float3(8.0,0.0,0.0);
int l9_30=-1;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_30<=1)
{
int l9_31=-1;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_31<=1)
{
float2 l9_32=float2(float(l9_31),float(l9_30));
float2 l9_33=l9_32+l9_27;
float l9_34=abs(param_7)+1000.0;
float2 l9_35=VoronoiHash2D(l9_33,l9_34);
float2 l9_36=l9_35;
float l9_37=distance(l9_32+l9_36,l9_28);
if (l9_37<l9_29.x)
{
l9_29=float3(l9_37,l9_36.x,l9_36.y);
param_8=l9_29.x;
param_8=floor(param_8*10000.0)*9.9999997e-05;
}
l9_31++;
continue;
}
else
{
break;
}
}
l9_30++;
continue;
}
else
{
break;
}
}
}
else
{
param_8=0.5;
}
Noise_N0=param_8;
float Output_N12=0.0;
Output_N12=1.0-Noise_N0;
float ValueOut_N2=0.0;
float param_9=Output_N12;
float param_11=(*sc_set2.UserUniforms).Port_RangeMinA_N002;
float param_12=(*sc_set2.UserUniforms).Port_RangeMaxA_N002;
float param_13=(*sc_set2.UserUniforms).Port_RangeMinB_N002;
float param_14=(*sc_set2.UserUniforms).Port_RangeMaxB_N002;
float param_10=(((param_9-param_11)/(param_12-param_11))*(param_14-param_13))+param_13;
float l9_38;
if (param_14>param_13)
{
l9_38=fast::clamp(param_10,param_13,param_14);
}
else
{
l9_38=fast::clamp(param_10,param_14,param_13);
}
param_10=l9_38;
ValueOut_N2=param_10;
float3 Output_N16=float3(0.0);
Output_N16=mix(Value_N20.xyz,Result_N19,float3(ValueOut_N2));
float3 Export_N21=float3(0.0);
Export_N21=Output_N16;
float Result_N37=0.0;
float param_15=0.0;
float param_16=(*sc_set2.UserUniforms).Port_Default_N037;
ssGlobals param_18=Globals;
float param_17;
if ((int(Tweak_N40_tmp)!=0))
{
float l9_39=0.0;
float l9_40=0.0;
float l9_41=(*sc_set2.UserUniforms).Port_Value1_N023;
float l9_42=0.0;
ssGlobals l9_43=param_18;
float l9_44=0.0;
float l9_45=(*sc_set2.UserUniforms).opaticy;
l9_44=l9_45;
float l9_46=0.0;
l9_46=l9_44;
float4 l9_47=float4(0.0);
int l9_48=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_49=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_49=0;
}
else
{
l9_49=in.varStereoViewID;
}
int l9_50=l9_49;
l9_48=1-l9_50;
}
else
{
int l9_51=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_51=0;
}
else
{
l9_51=in.varStereoViewID;
}
int l9_52=l9_51;
l9_48=l9_52;
}
int l9_53=l9_48;
int l9_54=baseTexLayout_tmp;
int l9_55=l9_53;
float2 l9_56=l9_43.Surface_UVCoord0;
bool l9_57=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_58=(*sc_set2.UserUniforms).baseTexTransform;
int2 l9_59=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_60=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_61=(*sc_set2.UserUniforms).baseTexUvMinMax;
bool l9_62=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_63=(*sc_set2.UserUniforms).baseTexBorderColor;
float l9_64=0.0;
bool l9_65=l9_62&&(!l9_60);
float l9_66=1.0;
float l9_67=l9_56.x;
int l9_68=l9_59.x;
if (l9_68==1)
{
l9_67=fract(l9_67);
}
else
{
if (l9_68==2)
{
float l9_69=fract(l9_67);
float l9_70=l9_67-l9_69;
float l9_71=step(0.25,fract(l9_70*0.5));
l9_67=mix(l9_69,1.0-l9_69,fast::clamp(l9_71,0.0,1.0));
}
}
l9_56.x=l9_67;
float l9_72=l9_56.y;
int l9_73=l9_59.y;
if (l9_73==1)
{
l9_72=fract(l9_72);
}
else
{
if (l9_73==2)
{
float l9_74=fract(l9_72);
float l9_75=l9_72-l9_74;
float l9_76=step(0.25,fract(l9_75*0.5));
l9_72=mix(l9_74,1.0-l9_74,fast::clamp(l9_76,0.0,1.0));
}
}
l9_56.y=l9_72;
if (l9_60)
{
bool l9_77=l9_62;
bool l9_78;
if (l9_77)
{
l9_78=l9_59.x==3;
}
else
{
l9_78=l9_77;
}
float l9_79=l9_56.x;
float l9_80=l9_61.x;
float l9_81=l9_61.z;
bool l9_82=l9_78;
float l9_83=l9_66;
float l9_84=fast::clamp(l9_79,l9_80,l9_81);
float l9_85=step(abs(l9_79-l9_84),9.9999997e-06);
l9_83*=(l9_85+((1.0-float(l9_82))*(1.0-l9_85)));
l9_79=l9_84;
l9_56.x=l9_79;
l9_66=l9_83;
bool l9_86=l9_62;
bool l9_87;
if (l9_86)
{
l9_87=l9_59.y==3;
}
else
{
l9_87=l9_86;
}
float l9_88=l9_56.y;
float l9_89=l9_61.y;
float l9_90=l9_61.w;
bool l9_91=l9_87;
float l9_92=l9_66;
float l9_93=fast::clamp(l9_88,l9_89,l9_90);
float l9_94=step(abs(l9_88-l9_93),9.9999997e-06);
l9_92*=(l9_94+((1.0-float(l9_91))*(1.0-l9_94)));
l9_88=l9_93;
l9_56.y=l9_88;
l9_66=l9_92;
}
float2 l9_95=l9_56;
bool l9_96=l9_57;
float3x3 l9_97=l9_58;
if (l9_96)
{
l9_95=float2((l9_97*float3(l9_95,1.0)).xy);
}
float2 l9_98=l9_95;
float2 l9_99=l9_98;
float2 l9_100=l9_99;
l9_56=l9_100;
float l9_101=l9_56.x;
int l9_102=l9_59.x;
bool l9_103=l9_65;
float l9_104=l9_66;
if ((l9_102==0)||(l9_102==3))
{
float l9_105=l9_101;
float l9_106=0.0;
float l9_107=1.0;
bool l9_108=l9_103;
float l9_109=l9_104;
float l9_110=fast::clamp(l9_105,l9_106,l9_107);
float l9_111=step(abs(l9_105-l9_110),9.9999997e-06);
l9_109*=(l9_111+((1.0-float(l9_108))*(1.0-l9_111)));
l9_105=l9_110;
l9_101=l9_105;
l9_104=l9_109;
}
l9_56.x=l9_101;
l9_66=l9_104;
float l9_112=l9_56.y;
int l9_113=l9_59.y;
bool l9_114=l9_65;
float l9_115=l9_66;
if ((l9_113==0)||(l9_113==3))
{
float l9_116=l9_112;
float l9_117=0.0;
float l9_118=1.0;
bool l9_119=l9_114;
float l9_120=l9_115;
float l9_121=fast::clamp(l9_116,l9_117,l9_118);
float l9_122=step(abs(l9_116-l9_121),9.9999997e-06);
l9_120*=(l9_122+((1.0-float(l9_119))*(1.0-l9_122)));
l9_116=l9_121;
l9_112=l9_116;
l9_115=l9_120;
}
l9_56.y=l9_112;
l9_66=l9_115;
float2 l9_123=l9_56;
int l9_124=l9_54;
int l9_125=l9_55;
float l9_126=l9_64;
float2 l9_127=l9_123;
int l9_128=l9_124;
int l9_129=l9_125;
float3 l9_130=float3(0.0);
if (l9_128==0)
{
l9_130=float3(l9_127,0.0);
}
else
{
if (l9_128==1)
{
l9_130=float3(l9_127.x,(l9_127.y*0.5)+(0.5-(float(l9_129)*0.5)),0.0);
}
else
{
l9_130=float3(l9_127,float(l9_129));
}
}
float3 l9_131=l9_130;
float3 l9_132=l9_131;
float2 l9_133=l9_132.xy;
float l9_134=l9_126;
float4 l9_135=sc_set2.baseTex.sample(sc_set2.baseTexSmpSC,l9_133,bias(l9_134));
float4 l9_136=l9_135;
float4 l9_137=l9_136;
if (l9_62)
{
l9_137=mix(l9_63,l9_137,float4(l9_66));
}
float4 l9_138=l9_137;
l9_47=l9_138;
float4 l9_139=float4(0.0);
l9_139=l9_47;
float l9_140=0.0;
float4 l9_141=l9_139;
float l9_142=l9_141.x;
l9_140=l9_142;
float l9_143=0.0;
l9_143=l9_46*l9_140;
float l9_144=0.0;
l9_144=float(l9_143<=(*sc_set2.UserUniforms).Port_Input1_N022);
l9_40=l9_144;
float l9_145;
if ((l9_40*1.0)!=0.0)
{
l9_145=l9_41;
}
else
{
float l9_146=0.0;
float l9_147=(*sc_set2.UserUniforms).opaticy;
l9_146=l9_147;
float l9_148=0.0;
l9_148=l9_146;
float4 l9_149=float4(0.0);
int l9_150=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_151=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_151=0;
}
else
{
l9_151=in.varStereoViewID;
}
int l9_152=l9_151;
l9_150=1-l9_152;
}
else
{
int l9_153=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_153=0;
}
else
{
l9_153=in.varStereoViewID;
}
int l9_154=l9_153;
l9_150=l9_154;
}
int l9_155=l9_150;
int l9_156=baseTexLayout_tmp;
int l9_157=l9_155;
float2 l9_158=l9_43.Surface_UVCoord0;
bool l9_159=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_160=(*sc_set2.UserUniforms).baseTexTransform;
int2 l9_161=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_162=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_163=(*sc_set2.UserUniforms).baseTexUvMinMax;
bool l9_164=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_165=(*sc_set2.UserUniforms).baseTexBorderColor;
float l9_166=0.0;
bool l9_167=l9_164&&(!l9_162);
float l9_168=1.0;
float l9_169=l9_158.x;
int l9_170=l9_161.x;
if (l9_170==1)
{
l9_169=fract(l9_169);
}
else
{
if (l9_170==2)
{
float l9_171=fract(l9_169);
float l9_172=l9_169-l9_171;
float l9_173=step(0.25,fract(l9_172*0.5));
l9_169=mix(l9_171,1.0-l9_171,fast::clamp(l9_173,0.0,1.0));
}
}
l9_158.x=l9_169;
float l9_174=l9_158.y;
int l9_175=l9_161.y;
if (l9_175==1)
{
l9_174=fract(l9_174);
}
else
{
if (l9_175==2)
{
float l9_176=fract(l9_174);
float l9_177=l9_174-l9_176;
float l9_178=step(0.25,fract(l9_177*0.5));
l9_174=mix(l9_176,1.0-l9_176,fast::clamp(l9_178,0.0,1.0));
}
}
l9_158.y=l9_174;
if (l9_162)
{
bool l9_179=l9_164;
bool l9_180;
if (l9_179)
{
l9_180=l9_161.x==3;
}
else
{
l9_180=l9_179;
}
float l9_181=l9_158.x;
float l9_182=l9_163.x;
float l9_183=l9_163.z;
bool l9_184=l9_180;
float l9_185=l9_168;
float l9_186=fast::clamp(l9_181,l9_182,l9_183);
float l9_187=step(abs(l9_181-l9_186),9.9999997e-06);
l9_185*=(l9_187+((1.0-float(l9_184))*(1.0-l9_187)));
l9_181=l9_186;
l9_158.x=l9_181;
l9_168=l9_185;
bool l9_188=l9_164;
bool l9_189;
if (l9_188)
{
l9_189=l9_161.y==3;
}
else
{
l9_189=l9_188;
}
float l9_190=l9_158.y;
float l9_191=l9_163.y;
float l9_192=l9_163.w;
bool l9_193=l9_189;
float l9_194=l9_168;
float l9_195=fast::clamp(l9_190,l9_191,l9_192);
float l9_196=step(abs(l9_190-l9_195),9.9999997e-06);
l9_194*=(l9_196+((1.0-float(l9_193))*(1.0-l9_196)));
l9_190=l9_195;
l9_158.y=l9_190;
l9_168=l9_194;
}
float2 l9_197=l9_158;
bool l9_198=l9_159;
float3x3 l9_199=l9_160;
if (l9_198)
{
l9_197=float2((l9_199*float3(l9_197,1.0)).xy);
}
float2 l9_200=l9_197;
float2 l9_201=l9_200;
float2 l9_202=l9_201;
l9_158=l9_202;
float l9_203=l9_158.x;
int l9_204=l9_161.x;
bool l9_205=l9_167;
float l9_206=l9_168;
if ((l9_204==0)||(l9_204==3))
{
float l9_207=l9_203;
float l9_208=0.0;
float l9_209=1.0;
bool l9_210=l9_205;
float l9_211=l9_206;
float l9_212=fast::clamp(l9_207,l9_208,l9_209);
float l9_213=step(abs(l9_207-l9_212),9.9999997e-06);
l9_211*=(l9_213+((1.0-float(l9_210))*(1.0-l9_213)));
l9_207=l9_212;
l9_203=l9_207;
l9_206=l9_211;
}
l9_158.x=l9_203;
l9_168=l9_206;
float l9_214=l9_158.y;
int l9_215=l9_161.y;
bool l9_216=l9_167;
float l9_217=l9_168;
if ((l9_215==0)||(l9_215==3))
{
float l9_218=l9_214;
float l9_219=0.0;
float l9_220=1.0;
bool l9_221=l9_216;
float l9_222=l9_217;
float l9_223=fast::clamp(l9_218,l9_219,l9_220);
float l9_224=step(abs(l9_218-l9_223),9.9999997e-06);
l9_222*=(l9_224+((1.0-float(l9_221))*(1.0-l9_224)));
l9_218=l9_223;
l9_214=l9_218;
l9_217=l9_222;
}
l9_158.y=l9_214;
l9_168=l9_217;
float2 l9_225=l9_158;
int l9_226=l9_156;
int l9_227=l9_157;
float l9_228=l9_166;
float2 l9_229=l9_225;
int l9_230=l9_226;
int l9_231=l9_227;
float3 l9_232=float3(0.0);
if (l9_230==0)
{
l9_232=float3(l9_229,0.0);
}
else
{
if (l9_230==1)
{
l9_232=float3(l9_229.x,(l9_229.y*0.5)+(0.5-(float(l9_231)*0.5)),0.0);
}
else
{
l9_232=float3(l9_229,float(l9_231));
}
}
float3 l9_233=l9_232;
float3 l9_234=l9_233;
float2 l9_235=l9_234.xy;
float l9_236=l9_228;
float4 l9_237=sc_set2.baseTex.sample(sc_set2.baseTexSmpSC,l9_235,bias(l9_236));
float4 l9_238=l9_237;
float4 l9_239=l9_238;
if (l9_164)
{
l9_239=mix(l9_165,l9_239,float4(l9_168));
}
float4 l9_240=l9_239;
l9_149=l9_240;
float4 l9_241=float4(0.0);
l9_241=l9_149;
float l9_242=0.0;
float4 l9_243=l9_241;
float l9_244=l9_243.x;
l9_242=l9_244;
float l9_245=0.0;
l9_245=l9_148*l9_242;
l9_42=l9_245;
l9_145=l9_42;
}
l9_39=l9_145;
param_15=l9_39;
param_17=param_15;
}
else
{
param_17=param_16;
}
Result_N37=param_17;
float Result_N39=0.0;
float param_19=0.0;
float param_20=(*sc_set2.UserUniforms).Port_Default_N039;
ssGlobals param_22=Globals;
float param_21;
if ((int(Tweak_N41_tmp)!=0))
{
float l9_246=0.0;
float l9_247=0.0;
float l9_248=(*sc_set2.UserUniforms).Port_Value1_N030;
float l9_249=0.0;
ssGlobals l9_250=param_22;
float l9_251=0.0;
float l9_252=(*sc_set2.UserUniforms).opaticy;
l9_251=l9_252;
float l9_253=0.0;
l9_253=l9_251;
float4 l9_254=float4(0.0);
int l9_255=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_256=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_256=0;
}
else
{
l9_256=in.varStereoViewID;
}
int l9_257=l9_256;
l9_255=1-l9_257;
}
else
{
int l9_258=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_258=0;
}
else
{
l9_258=in.varStereoViewID;
}
int l9_259=l9_258;
l9_255=l9_259;
}
int l9_260=l9_255;
int l9_261=baseTexLayout_tmp;
int l9_262=l9_260;
float2 l9_263=l9_250.Surface_UVCoord0;
bool l9_264=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_265=(*sc_set2.UserUniforms).baseTexTransform;
int2 l9_266=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_267=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_268=(*sc_set2.UserUniforms).baseTexUvMinMax;
bool l9_269=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_270=(*sc_set2.UserUniforms).baseTexBorderColor;
float l9_271=0.0;
bool l9_272=l9_269&&(!l9_267);
float l9_273=1.0;
float l9_274=l9_263.x;
int l9_275=l9_266.x;
if (l9_275==1)
{
l9_274=fract(l9_274);
}
else
{
if (l9_275==2)
{
float l9_276=fract(l9_274);
float l9_277=l9_274-l9_276;
float l9_278=step(0.25,fract(l9_277*0.5));
l9_274=mix(l9_276,1.0-l9_276,fast::clamp(l9_278,0.0,1.0));
}
}
l9_263.x=l9_274;
float l9_279=l9_263.y;
int l9_280=l9_266.y;
if (l9_280==1)
{
l9_279=fract(l9_279);
}
else
{
if (l9_280==2)
{
float l9_281=fract(l9_279);
float l9_282=l9_279-l9_281;
float l9_283=step(0.25,fract(l9_282*0.5));
l9_279=mix(l9_281,1.0-l9_281,fast::clamp(l9_283,0.0,1.0));
}
}
l9_263.y=l9_279;
if (l9_267)
{
bool l9_284=l9_269;
bool l9_285;
if (l9_284)
{
l9_285=l9_266.x==3;
}
else
{
l9_285=l9_284;
}
float l9_286=l9_263.x;
float l9_287=l9_268.x;
float l9_288=l9_268.z;
bool l9_289=l9_285;
float l9_290=l9_273;
float l9_291=fast::clamp(l9_286,l9_287,l9_288);
float l9_292=step(abs(l9_286-l9_291),9.9999997e-06);
l9_290*=(l9_292+((1.0-float(l9_289))*(1.0-l9_292)));
l9_286=l9_291;
l9_263.x=l9_286;
l9_273=l9_290;
bool l9_293=l9_269;
bool l9_294;
if (l9_293)
{
l9_294=l9_266.y==3;
}
else
{
l9_294=l9_293;
}
float l9_295=l9_263.y;
float l9_296=l9_268.y;
float l9_297=l9_268.w;
bool l9_298=l9_294;
float l9_299=l9_273;
float l9_300=fast::clamp(l9_295,l9_296,l9_297);
float l9_301=step(abs(l9_295-l9_300),9.9999997e-06);
l9_299*=(l9_301+((1.0-float(l9_298))*(1.0-l9_301)));
l9_295=l9_300;
l9_263.y=l9_295;
l9_273=l9_299;
}
float2 l9_302=l9_263;
bool l9_303=l9_264;
float3x3 l9_304=l9_265;
if (l9_303)
{
l9_302=float2((l9_304*float3(l9_302,1.0)).xy);
}
float2 l9_305=l9_302;
float2 l9_306=l9_305;
float2 l9_307=l9_306;
l9_263=l9_307;
float l9_308=l9_263.x;
int l9_309=l9_266.x;
bool l9_310=l9_272;
float l9_311=l9_273;
if ((l9_309==0)||(l9_309==3))
{
float l9_312=l9_308;
float l9_313=0.0;
float l9_314=1.0;
bool l9_315=l9_310;
float l9_316=l9_311;
float l9_317=fast::clamp(l9_312,l9_313,l9_314);
float l9_318=step(abs(l9_312-l9_317),9.9999997e-06);
l9_316*=(l9_318+((1.0-float(l9_315))*(1.0-l9_318)));
l9_312=l9_317;
l9_308=l9_312;
l9_311=l9_316;
}
l9_263.x=l9_308;
l9_273=l9_311;
float l9_319=l9_263.y;
int l9_320=l9_266.y;
bool l9_321=l9_272;
float l9_322=l9_273;
if ((l9_320==0)||(l9_320==3))
{
float l9_323=l9_319;
float l9_324=0.0;
float l9_325=1.0;
bool l9_326=l9_321;
float l9_327=l9_322;
float l9_328=fast::clamp(l9_323,l9_324,l9_325);
float l9_329=step(abs(l9_323-l9_328),9.9999997e-06);
l9_327*=(l9_329+((1.0-float(l9_326))*(1.0-l9_329)));
l9_323=l9_328;
l9_319=l9_323;
l9_322=l9_327;
}
l9_263.y=l9_319;
l9_273=l9_322;
float2 l9_330=l9_263;
int l9_331=l9_261;
int l9_332=l9_262;
float l9_333=l9_271;
float2 l9_334=l9_330;
int l9_335=l9_331;
int l9_336=l9_332;
float3 l9_337=float3(0.0);
if (l9_335==0)
{
l9_337=float3(l9_334,0.0);
}
else
{
if (l9_335==1)
{
l9_337=float3(l9_334.x,(l9_334.y*0.5)+(0.5-(float(l9_336)*0.5)),0.0);
}
else
{
l9_337=float3(l9_334,float(l9_336));
}
}
float3 l9_338=l9_337;
float3 l9_339=l9_338;
float2 l9_340=l9_339.xy;
float l9_341=l9_333;
float4 l9_342=sc_set2.baseTex.sample(sc_set2.baseTexSmpSC,l9_340,bias(l9_341));
float4 l9_343=l9_342;
float4 l9_344=l9_343;
if (l9_269)
{
l9_344=mix(l9_270,l9_344,float4(l9_273));
}
float4 l9_345=l9_344;
l9_254=l9_345;
float4 l9_346=float4(0.0);
l9_346=l9_254;
float l9_347=0.0;
float4 l9_348=l9_346;
float l9_349=l9_348.y;
l9_347=l9_349;
float l9_350=0.0;
l9_350=l9_253*l9_347;
float l9_351=0.0;
l9_351=float(l9_350<=(*sc_set2.UserUniforms).Port_Input1_N025);
l9_247=l9_351;
float l9_352;
if ((l9_247*1.0)!=0.0)
{
l9_352=l9_248;
}
else
{
float l9_353=0.0;
float l9_354=(*sc_set2.UserUniforms).opaticy;
l9_353=l9_354;
float l9_355=0.0;
l9_355=l9_353;
float4 l9_356=float4(0.0);
int l9_357=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_358=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_358=0;
}
else
{
l9_358=in.varStereoViewID;
}
int l9_359=l9_358;
l9_357=1-l9_359;
}
else
{
int l9_360=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_360=0;
}
else
{
l9_360=in.varStereoViewID;
}
int l9_361=l9_360;
l9_357=l9_361;
}
int l9_362=l9_357;
int l9_363=baseTexLayout_tmp;
int l9_364=l9_362;
float2 l9_365=l9_250.Surface_UVCoord0;
bool l9_366=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_367=(*sc_set2.UserUniforms).baseTexTransform;
int2 l9_368=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_369=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_370=(*sc_set2.UserUniforms).baseTexUvMinMax;
bool l9_371=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_372=(*sc_set2.UserUniforms).baseTexBorderColor;
float l9_373=0.0;
bool l9_374=l9_371&&(!l9_369);
float l9_375=1.0;
float l9_376=l9_365.x;
int l9_377=l9_368.x;
if (l9_377==1)
{
l9_376=fract(l9_376);
}
else
{
if (l9_377==2)
{
float l9_378=fract(l9_376);
float l9_379=l9_376-l9_378;
float l9_380=step(0.25,fract(l9_379*0.5));
l9_376=mix(l9_378,1.0-l9_378,fast::clamp(l9_380,0.0,1.0));
}
}
l9_365.x=l9_376;
float l9_381=l9_365.y;
int l9_382=l9_368.y;
if (l9_382==1)
{
l9_381=fract(l9_381);
}
else
{
if (l9_382==2)
{
float l9_383=fract(l9_381);
float l9_384=l9_381-l9_383;
float l9_385=step(0.25,fract(l9_384*0.5));
l9_381=mix(l9_383,1.0-l9_383,fast::clamp(l9_385,0.0,1.0));
}
}
l9_365.y=l9_381;
if (l9_369)
{
bool l9_386=l9_371;
bool l9_387;
if (l9_386)
{
l9_387=l9_368.x==3;
}
else
{
l9_387=l9_386;
}
float l9_388=l9_365.x;
float l9_389=l9_370.x;
float l9_390=l9_370.z;
bool l9_391=l9_387;
float l9_392=l9_375;
float l9_393=fast::clamp(l9_388,l9_389,l9_390);
float l9_394=step(abs(l9_388-l9_393),9.9999997e-06);
l9_392*=(l9_394+((1.0-float(l9_391))*(1.0-l9_394)));
l9_388=l9_393;
l9_365.x=l9_388;
l9_375=l9_392;
bool l9_395=l9_371;
bool l9_396;
if (l9_395)
{
l9_396=l9_368.y==3;
}
else
{
l9_396=l9_395;
}
float l9_397=l9_365.y;
float l9_398=l9_370.y;
float l9_399=l9_370.w;
bool l9_400=l9_396;
float l9_401=l9_375;
float l9_402=fast::clamp(l9_397,l9_398,l9_399);
float l9_403=step(abs(l9_397-l9_402),9.9999997e-06);
l9_401*=(l9_403+((1.0-float(l9_400))*(1.0-l9_403)));
l9_397=l9_402;
l9_365.y=l9_397;
l9_375=l9_401;
}
float2 l9_404=l9_365;
bool l9_405=l9_366;
float3x3 l9_406=l9_367;
if (l9_405)
{
l9_404=float2((l9_406*float3(l9_404,1.0)).xy);
}
float2 l9_407=l9_404;
float2 l9_408=l9_407;
float2 l9_409=l9_408;
l9_365=l9_409;
float l9_410=l9_365.x;
int l9_411=l9_368.x;
bool l9_412=l9_374;
float l9_413=l9_375;
if ((l9_411==0)||(l9_411==3))
{
float l9_414=l9_410;
float l9_415=0.0;
float l9_416=1.0;
bool l9_417=l9_412;
float l9_418=l9_413;
float l9_419=fast::clamp(l9_414,l9_415,l9_416);
float l9_420=step(abs(l9_414-l9_419),9.9999997e-06);
l9_418*=(l9_420+((1.0-float(l9_417))*(1.0-l9_420)));
l9_414=l9_419;
l9_410=l9_414;
l9_413=l9_418;
}
l9_365.x=l9_410;
l9_375=l9_413;
float l9_421=l9_365.y;
int l9_422=l9_368.y;
bool l9_423=l9_374;
float l9_424=l9_375;
if ((l9_422==0)||(l9_422==3))
{
float l9_425=l9_421;
float l9_426=0.0;
float l9_427=1.0;
bool l9_428=l9_423;
float l9_429=l9_424;
float l9_430=fast::clamp(l9_425,l9_426,l9_427);
float l9_431=step(abs(l9_425-l9_430),9.9999997e-06);
l9_429*=(l9_431+((1.0-float(l9_428))*(1.0-l9_431)));
l9_425=l9_430;
l9_421=l9_425;
l9_424=l9_429;
}
l9_365.y=l9_421;
l9_375=l9_424;
float2 l9_432=l9_365;
int l9_433=l9_363;
int l9_434=l9_364;
float l9_435=l9_373;
float2 l9_436=l9_432;
int l9_437=l9_433;
int l9_438=l9_434;
float3 l9_439=float3(0.0);
if (l9_437==0)
{
l9_439=float3(l9_436,0.0);
}
else
{
if (l9_437==1)
{
l9_439=float3(l9_436.x,(l9_436.y*0.5)+(0.5-(float(l9_438)*0.5)),0.0);
}
else
{
l9_439=float3(l9_436,float(l9_438));
}
}
float3 l9_440=l9_439;
float3 l9_441=l9_440;
float2 l9_442=l9_441.xy;
float l9_443=l9_435;
float4 l9_444=sc_set2.baseTex.sample(sc_set2.baseTexSmpSC,l9_442,bias(l9_443));
float4 l9_445=l9_444;
float4 l9_446=l9_445;
if (l9_371)
{
l9_446=mix(l9_372,l9_446,float4(l9_375));
}
float4 l9_447=l9_446;
l9_356=l9_447;
float4 l9_448=float4(0.0);
l9_448=l9_356;
float l9_449=0.0;
float4 l9_450=l9_448;
float l9_451=l9_450.y;
l9_449=l9_451;
float l9_452=0.0;
l9_452=l9_355*l9_449;
l9_249=l9_452;
l9_352=l9_249;
}
l9_246=l9_352;
param_19=l9_246;
param_21=param_19;
}
else
{
param_21=param_20;
}
Result_N39=param_21;
float Result_N52=0.0;
float param_23=0.0;
float param_24=(*sc_set2.UserUniforms).Port_Default_N052;
ssGlobals param_26=Globals;
float param_25;
if ((int(Tweak_N42_tmp)!=0))
{
float l9_453=0.0;
float l9_454=0.0;
float l9_455=(*sc_set2.UserUniforms).Port_Value1_N035;
float l9_456=0.0;
ssGlobals l9_457=param_26;
float l9_458=0.0;
float l9_459=(*sc_set2.UserUniforms).opaticy;
l9_458=l9_459;
float l9_460=0.0;
l9_460=l9_458;
float4 l9_461=float4(0.0);
int l9_462=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_463=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_463=0;
}
else
{
l9_463=in.varStereoViewID;
}
int l9_464=l9_463;
l9_462=1-l9_464;
}
else
{
int l9_465=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_465=0;
}
else
{
l9_465=in.varStereoViewID;
}
int l9_466=l9_465;
l9_462=l9_466;
}
int l9_467=l9_462;
int l9_468=baseTexLayout_tmp;
int l9_469=l9_467;
float2 l9_470=l9_457.Surface_UVCoord0;
bool l9_471=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_472=(*sc_set2.UserUniforms).baseTexTransform;
int2 l9_473=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_474=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_475=(*sc_set2.UserUniforms).baseTexUvMinMax;
bool l9_476=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_477=(*sc_set2.UserUniforms).baseTexBorderColor;
float l9_478=0.0;
bool l9_479=l9_476&&(!l9_474);
float l9_480=1.0;
float l9_481=l9_470.x;
int l9_482=l9_473.x;
if (l9_482==1)
{
l9_481=fract(l9_481);
}
else
{
if (l9_482==2)
{
float l9_483=fract(l9_481);
float l9_484=l9_481-l9_483;
float l9_485=step(0.25,fract(l9_484*0.5));
l9_481=mix(l9_483,1.0-l9_483,fast::clamp(l9_485,0.0,1.0));
}
}
l9_470.x=l9_481;
float l9_486=l9_470.y;
int l9_487=l9_473.y;
if (l9_487==1)
{
l9_486=fract(l9_486);
}
else
{
if (l9_487==2)
{
float l9_488=fract(l9_486);
float l9_489=l9_486-l9_488;
float l9_490=step(0.25,fract(l9_489*0.5));
l9_486=mix(l9_488,1.0-l9_488,fast::clamp(l9_490,0.0,1.0));
}
}
l9_470.y=l9_486;
if (l9_474)
{
bool l9_491=l9_476;
bool l9_492;
if (l9_491)
{
l9_492=l9_473.x==3;
}
else
{
l9_492=l9_491;
}
float l9_493=l9_470.x;
float l9_494=l9_475.x;
float l9_495=l9_475.z;
bool l9_496=l9_492;
float l9_497=l9_480;
float l9_498=fast::clamp(l9_493,l9_494,l9_495);
float l9_499=step(abs(l9_493-l9_498),9.9999997e-06);
l9_497*=(l9_499+((1.0-float(l9_496))*(1.0-l9_499)));
l9_493=l9_498;
l9_470.x=l9_493;
l9_480=l9_497;
bool l9_500=l9_476;
bool l9_501;
if (l9_500)
{
l9_501=l9_473.y==3;
}
else
{
l9_501=l9_500;
}
float l9_502=l9_470.y;
float l9_503=l9_475.y;
float l9_504=l9_475.w;
bool l9_505=l9_501;
float l9_506=l9_480;
float l9_507=fast::clamp(l9_502,l9_503,l9_504);
float l9_508=step(abs(l9_502-l9_507),9.9999997e-06);
l9_506*=(l9_508+((1.0-float(l9_505))*(1.0-l9_508)));
l9_502=l9_507;
l9_470.y=l9_502;
l9_480=l9_506;
}
float2 l9_509=l9_470;
bool l9_510=l9_471;
float3x3 l9_511=l9_472;
if (l9_510)
{
l9_509=float2((l9_511*float3(l9_509,1.0)).xy);
}
float2 l9_512=l9_509;
float2 l9_513=l9_512;
float2 l9_514=l9_513;
l9_470=l9_514;
float l9_515=l9_470.x;
int l9_516=l9_473.x;
bool l9_517=l9_479;
float l9_518=l9_480;
if ((l9_516==0)||(l9_516==3))
{
float l9_519=l9_515;
float l9_520=0.0;
float l9_521=1.0;
bool l9_522=l9_517;
float l9_523=l9_518;
float l9_524=fast::clamp(l9_519,l9_520,l9_521);
float l9_525=step(abs(l9_519-l9_524),9.9999997e-06);
l9_523*=(l9_525+((1.0-float(l9_522))*(1.0-l9_525)));
l9_519=l9_524;
l9_515=l9_519;
l9_518=l9_523;
}
l9_470.x=l9_515;
l9_480=l9_518;
float l9_526=l9_470.y;
int l9_527=l9_473.y;
bool l9_528=l9_479;
float l9_529=l9_480;
if ((l9_527==0)||(l9_527==3))
{
float l9_530=l9_526;
float l9_531=0.0;
float l9_532=1.0;
bool l9_533=l9_528;
float l9_534=l9_529;
float l9_535=fast::clamp(l9_530,l9_531,l9_532);
float l9_536=step(abs(l9_530-l9_535),9.9999997e-06);
l9_534*=(l9_536+((1.0-float(l9_533))*(1.0-l9_536)));
l9_530=l9_535;
l9_526=l9_530;
l9_529=l9_534;
}
l9_470.y=l9_526;
l9_480=l9_529;
float2 l9_537=l9_470;
int l9_538=l9_468;
int l9_539=l9_469;
float l9_540=l9_478;
float2 l9_541=l9_537;
int l9_542=l9_538;
int l9_543=l9_539;
float3 l9_544=float3(0.0);
if (l9_542==0)
{
l9_544=float3(l9_541,0.0);
}
else
{
if (l9_542==1)
{
l9_544=float3(l9_541.x,(l9_541.y*0.5)+(0.5-(float(l9_543)*0.5)),0.0);
}
else
{
l9_544=float3(l9_541,float(l9_543));
}
}
float3 l9_545=l9_544;
float3 l9_546=l9_545;
float2 l9_547=l9_546.xy;
float l9_548=l9_540;
float4 l9_549=sc_set2.baseTex.sample(sc_set2.baseTexSmpSC,l9_547,bias(l9_548));
float4 l9_550=l9_549;
float4 l9_551=l9_550;
if (l9_476)
{
l9_551=mix(l9_477,l9_551,float4(l9_480));
}
float4 l9_552=l9_551;
l9_461=l9_552;
float4 l9_553=float4(0.0);
l9_553=l9_461;
float l9_554=0.0;
float4 l9_555=l9_553;
float l9_556=l9_555.z;
l9_554=l9_556;
float l9_557=0.0;
l9_557=l9_460*l9_554;
float l9_558=0.0;
l9_558=float(l9_557<=(*sc_set2.UserUniforms).Port_Input1_N033);
l9_454=l9_558;
float l9_559;
if ((l9_454*1.0)!=0.0)
{
l9_559=l9_455;
}
else
{
float l9_560=0.0;
float l9_561=(*sc_set2.UserUniforms).opaticy;
l9_560=l9_561;
float l9_562=0.0;
l9_562=l9_560;
float4 l9_563=float4(0.0);
int l9_564=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_565=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_565=0;
}
else
{
l9_565=in.varStereoViewID;
}
int l9_566=l9_565;
l9_564=1-l9_566;
}
else
{
int l9_567=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_567=0;
}
else
{
l9_567=in.varStereoViewID;
}
int l9_568=l9_567;
l9_564=l9_568;
}
int l9_569=l9_564;
int l9_570=baseTexLayout_tmp;
int l9_571=l9_569;
float2 l9_572=l9_457.Surface_UVCoord0;
bool l9_573=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_574=(*sc_set2.UserUniforms).baseTexTransform;
int2 l9_575=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_576=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_577=(*sc_set2.UserUniforms).baseTexUvMinMax;
bool l9_578=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_579=(*sc_set2.UserUniforms).baseTexBorderColor;
float l9_580=0.0;
bool l9_581=l9_578&&(!l9_576);
float l9_582=1.0;
float l9_583=l9_572.x;
int l9_584=l9_575.x;
if (l9_584==1)
{
l9_583=fract(l9_583);
}
else
{
if (l9_584==2)
{
float l9_585=fract(l9_583);
float l9_586=l9_583-l9_585;
float l9_587=step(0.25,fract(l9_586*0.5));
l9_583=mix(l9_585,1.0-l9_585,fast::clamp(l9_587,0.0,1.0));
}
}
l9_572.x=l9_583;
float l9_588=l9_572.y;
int l9_589=l9_575.y;
if (l9_589==1)
{
l9_588=fract(l9_588);
}
else
{
if (l9_589==2)
{
float l9_590=fract(l9_588);
float l9_591=l9_588-l9_590;
float l9_592=step(0.25,fract(l9_591*0.5));
l9_588=mix(l9_590,1.0-l9_590,fast::clamp(l9_592,0.0,1.0));
}
}
l9_572.y=l9_588;
if (l9_576)
{
bool l9_593=l9_578;
bool l9_594;
if (l9_593)
{
l9_594=l9_575.x==3;
}
else
{
l9_594=l9_593;
}
float l9_595=l9_572.x;
float l9_596=l9_577.x;
float l9_597=l9_577.z;
bool l9_598=l9_594;
float l9_599=l9_582;
float l9_600=fast::clamp(l9_595,l9_596,l9_597);
float l9_601=step(abs(l9_595-l9_600),9.9999997e-06);
l9_599*=(l9_601+((1.0-float(l9_598))*(1.0-l9_601)));
l9_595=l9_600;
l9_572.x=l9_595;
l9_582=l9_599;
bool l9_602=l9_578;
bool l9_603;
if (l9_602)
{
l9_603=l9_575.y==3;
}
else
{
l9_603=l9_602;
}
float l9_604=l9_572.y;
float l9_605=l9_577.y;
float l9_606=l9_577.w;
bool l9_607=l9_603;
float l9_608=l9_582;
float l9_609=fast::clamp(l9_604,l9_605,l9_606);
float l9_610=step(abs(l9_604-l9_609),9.9999997e-06);
l9_608*=(l9_610+((1.0-float(l9_607))*(1.0-l9_610)));
l9_604=l9_609;
l9_572.y=l9_604;
l9_582=l9_608;
}
float2 l9_611=l9_572;
bool l9_612=l9_573;
float3x3 l9_613=l9_574;
if (l9_612)
{
l9_611=float2((l9_613*float3(l9_611,1.0)).xy);
}
float2 l9_614=l9_611;
float2 l9_615=l9_614;
float2 l9_616=l9_615;
l9_572=l9_616;
float l9_617=l9_572.x;
int l9_618=l9_575.x;
bool l9_619=l9_581;
float l9_620=l9_582;
if ((l9_618==0)||(l9_618==3))
{
float l9_621=l9_617;
float l9_622=0.0;
float l9_623=1.0;
bool l9_624=l9_619;
float l9_625=l9_620;
float l9_626=fast::clamp(l9_621,l9_622,l9_623);
float l9_627=step(abs(l9_621-l9_626),9.9999997e-06);
l9_625*=(l9_627+((1.0-float(l9_624))*(1.0-l9_627)));
l9_621=l9_626;
l9_617=l9_621;
l9_620=l9_625;
}
l9_572.x=l9_617;
l9_582=l9_620;
float l9_628=l9_572.y;
int l9_629=l9_575.y;
bool l9_630=l9_581;
float l9_631=l9_582;
if ((l9_629==0)||(l9_629==3))
{
float l9_632=l9_628;
float l9_633=0.0;
float l9_634=1.0;
bool l9_635=l9_630;
float l9_636=l9_631;
float l9_637=fast::clamp(l9_632,l9_633,l9_634);
float l9_638=step(abs(l9_632-l9_637),9.9999997e-06);
l9_636*=(l9_638+((1.0-float(l9_635))*(1.0-l9_638)));
l9_632=l9_637;
l9_628=l9_632;
l9_631=l9_636;
}
l9_572.y=l9_628;
l9_582=l9_631;
float2 l9_639=l9_572;
int l9_640=l9_570;
int l9_641=l9_571;
float l9_642=l9_580;
float2 l9_643=l9_639;
int l9_644=l9_640;
int l9_645=l9_641;
float3 l9_646=float3(0.0);
if (l9_644==0)
{
l9_646=float3(l9_643,0.0);
}
else
{
if (l9_644==1)
{
l9_646=float3(l9_643.x,(l9_643.y*0.5)+(0.5-(float(l9_645)*0.5)),0.0);
}
else
{
l9_646=float3(l9_643,float(l9_645));
}
}
float3 l9_647=l9_646;
float3 l9_648=l9_647;
float2 l9_649=l9_648.xy;
float l9_650=l9_642;
float4 l9_651=sc_set2.baseTex.sample(sc_set2.baseTexSmpSC,l9_649,bias(l9_650));
float4 l9_652=l9_651;
float4 l9_653=l9_652;
if (l9_578)
{
l9_653=mix(l9_579,l9_653,float4(l9_582));
}
float4 l9_654=l9_653;
l9_563=l9_654;
float4 l9_655=float4(0.0);
l9_655=l9_563;
float l9_656=0.0;
float4 l9_657=l9_655;
float l9_658=l9_657.z;
l9_656=l9_658;
float l9_659=0.0;
l9_659=l9_562*l9_656;
l9_456=l9_659;
l9_559=l9_456;
}
l9_453=l9_559;
param_23=l9_453;
param_25=param_23;
}
else
{
param_25=param_24;
}
Result_N52=param_25;
float Output_N65=0.0;
Output_N65=(Result_N37+Result_N39)+Result_N52;
float Export_N38=0.0;
Export_N38=Output_N65;
float4 Value_N60=float4(0.0);
Value_N60=float4(Export_N21.x,Export_N21.y,Export_N21.z,Value_N60.w);
Value_N60.w=Export_N38;
FinalColor=Value_N60;
float param_27=FinalColor.w;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (param_27<(*sc_set2.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_660=gl_FragCoord;
float2 l9_661=floor(mod(l9_660.xy,float2(4.0)));
float l9_662=(mod(dot(l9_661,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (param_27<l9_662)
{
discard_fragment();
}
}
bool l9_663=(*sc_set2.UserUniforms).isProxyMode!=0;
if (l9_663)
{
float4 param_28=FinalColor;
if ((int(sc_ProxyAlphaOne_tmp)!=0))
{
param_28.w=1.0;
}
float4 l9_664=fast::max(param_28,float4(0.0));
float4 param_29=l9_664;
out.FragColor0=param_29;
return out;
}
float4 param_30=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_665=param_30;
float4 l9_666=l9_665;
float l9_667=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_667=l9_666.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_667=fast::clamp(l9_666.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_667=fast::clamp(dot(l9_666.xyz,float3(l9_666.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_667=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_667=(1.0-dot(l9_666.xyz,float3(0.33333001)))*l9_666.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_667=(1.0-fast::clamp(dot(l9_666.xyz,float3(1.0)),0.0,1.0))*l9_666.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_667=fast::clamp(dot(l9_666.xyz,float3(1.0)),0.0,1.0)*l9_666.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_667=fast::clamp(dot(l9_666.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_667=fast::clamp(dot(l9_666.xyz,float3(1.0)),0.0,1.0)*l9_666.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_667=dot(l9_666.xyz,float3(0.33333001))*l9_666.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_667=1.0-fast::clamp(dot(l9_666.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_667=fast::clamp(dot(l9_666.xyz,float3(1.0)),0.0,1.0);
}
}
}
}
}
}
}
}
}
}
}
}
float l9_668=l9_667;
float l9_669=l9_668;
float l9_670=(*sc_set2.UserUniforms).sc_ShadowDensity*l9_669;
float3 l9_671=mix((*sc_set2.UserUniforms).sc_ShadowColor.xyz,(*sc_set2.UserUniforms).sc_ShadowColor.xyz*l9_665.xyz,float3((*sc_set2.UserUniforms).sc_ShadowColor.w));
float4 l9_672=float4(l9_671.x,l9_671.y,l9_671.z,l9_670);
param_30=l9_672;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_30=float4(param_30.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_673=param_30;
float4 l9_674=float4(0.0);
float4 l9_675=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_676=out.FragColor0;
float4 l9_677=l9_676;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_677.x+=(*sc_set2.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_678=l9_677;
l9_675=l9_678;
}
else
{
float4 l9_679=gl_FragCoord;
float2 l9_680=(l9_679.xy*(*sc_set2.UserUniforms).sc_WindowToViewportTransform.xy)+(*sc_set2.UserUniforms).sc_WindowToViewportTransform.zw;
float2 l9_681=l9_680;
float2 l9_682=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_683=1;
int l9_684=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_684=0;
}
else
{
l9_684=in.varStereoViewID;
}
int l9_685=l9_684;
int l9_686=l9_685;
float3 l9_687=float3(l9_681,0.0);
int l9_688=l9_683;
int l9_689=l9_686;
if (l9_688==1)
{
l9_687.y=((2.0*l9_687.y)+float(l9_689))-1.0;
}
float2 l9_690=l9_687.xy;
l9_682=l9_690;
}
else
{
l9_682=l9_681;
}
float2 l9_691=l9_682;
float2 l9_692=l9_691;
float2 l9_693=l9_692;
int l9_694=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_695=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_695=0;
}
else
{
l9_695=in.varStereoViewID;
}
int l9_696=l9_695;
l9_694=1-l9_696;
}
else
{
int l9_697=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_697=0;
}
else
{
l9_697=in.varStereoViewID;
}
int l9_698=l9_697;
l9_694=l9_698;
}
int l9_699=l9_694;
float2 l9_700=l9_693;
int l9_701=l9_699;
float2 l9_702=l9_700;
int l9_703=l9_701;
float l9_704=0.0;
float4 l9_705=float4(0.0);
float2 l9_706=l9_702;
int l9_707=sc_ScreenTextureLayout_tmp;
int l9_708=l9_703;
float l9_709=l9_704;
float2 l9_710=l9_706;
int l9_711=l9_707;
int l9_712=l9_708;
float3 l9_713=float3(0.0);
if (l9_711==0)
{
l9_713=float3(l9_710,0.0);
}
else
{
if (l9_711==1)
{
l9_713=float3(l9_710.x,(l9_710.y*0.5)+(0.5-(float(l9_712)*0.5)),0.0);
}
else
{
l9_713=float3(l9_710,float(l9_712));
}
}
float3 l9_714=l9_713;
float3 l9_715=l9_714;
float2 l9_716=l9_715.xy;
float l9_717=l9_709;
float4 l9_718=sc_set2.sc_ScreenTexture.sample(sc_set2.sc_ScreenTextureSmpSC,l9_716,bias(l9_717));
float4 l9_719=l9_718;
l9_705=l9_719;
float4 l9_720=l9_705;
float4 l9_721=l9_720;
float4 l9_722=l9_721;
l9_675=l9_722;
}
float4 l9_723=l9_675;
float4 l9_724=l9_723;
float3 l9_725=l9_724.xyz;
float3 l9_726=l9_725;
float3 l9_727=l9_673.xyz;
float3 l9_728=definedBlend(l9_726,l9_727,in.varStereoViewID,(*sc_set2.UserUniforms),sc_set2.intensityTexture,sc_set2.intensityTextureSmpSC);
l9_674=float4(l9_728.x,l9_728.y,l9_728.z,l9_674.w);
float3 l9_729=mix(l9_725,l9_674.xyz,float3(l9_673.w));
l9_674=float4(l9_729.x,l9_729.y,l9_729.z,l9_674.w);
l9_674.w=1.0;
float4 l9_730=l9_674;
param_30=l9_730;
}
else
{
float4 l9_731=param_30;
float4 l9_732=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_732=float4(mix(float3(1.0),l9_731.xyz,float3(l9_731.w)),l9_731.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_733=l9_731.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_733=fast::clamp(l9_733,0.0,1.0);
}
l9_732=float4(l9_731.xyz*l9_733,l9_733);
}
else
{
l9_732=l9_731;
}
}
float4 l9_734=l9_732;
param_30=l9_734;
}
}
}
float4 l9_735=param_30;
FinalColor=l9_735;
if ((*sc_set2.UserUniforms).PreviewEnabled==1)
{
if (PreviewInfo.Saved)
{
FinalColor=float4(PreviewInfo.Color);
}
else
{
FinalColor=float4(0.0);
}
}
float4 l9_736=float4(0.0);
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_736=float4((*sc_set2.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_736=float4(0.0);
}
float4 l9_737=l9_736;
float4 Cost=l9_737;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float3 param_31=in.varPos;
float4 param_32=FinalColor;
FinalColor=outputMotionVectorsIfNeeded(param_31,param_32,in.varStereoViewID,(*sc_set2.UserUniforms));
float4 param_33=FinalColor;
float4 l9_738=param_33;
out.FragColor0=l9_738;
return out;
}
} // FRAGMENT SHADER
