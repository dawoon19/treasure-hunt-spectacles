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
//sampler sampler Tweak_N5SmpSC 2:23
//sampler sampler baseTexSmpSC 2:24
//sampler sampler intensityTextureSmpSC 2:25
//sampler sampler sc_ScreenTextureSmpSC 2:30
//sampler sampler z_hitIdAndBarycentricSmp 2:33
//sampler sampler z_rayDirectionsSmpSC 2:34
//texture texture2D Tweak_N5 2:4:2:23
//texture texture2D baseTex 2:5:2:24
//texture texture2D intensityTexture 2:6:2:25
//texture texture2D sc_ScreenTexture 2:18:2:30
//texture utexture2D z_hitIdAndBarycentric 2:21:2:33
//texture texture2D z_rayDirections 2:22:2:34
//ubo float sc_BonesUBO 2:3:96 {
//sc_Bone_t sc_Bones 0:[]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 2:35:4448 {
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
//float4 baseTexSize 4080
//float4 baseTexDims 4096
//float4 baseTexView 4112
//float3x3 baseTexTransform 4128
//float4 baseTexUvMinMax 4176
//float4 baseTexBorderColor 4192
//float tiling 4208
//float Tweak_N0 4212
//float Tweak_N3 4216
//float4 Tweak_N5Size 4224
//float4 Tweak_N5Dims 4240
//float4 Tweak_N5View 4256
//float3x3 Tweak_N5Transform 4272
//float4 Tweak_N5UvMinMax 4320
//float4 Tweak_N5BorderColor 4336
//float2 Port_Center_N001 4352
//float Port_Speed_N025 4360
//float Port_Import_N029 4364
//float Port_Import_N028 4368
//float4 Port_Import_N027 4384
//float Port_Input1_N014 4400
//float Port_Value1_N013 4404
//float Port_Default_N037 4408
//float Port_Import_N031 4412
//float Port_Input1_N015 4416
//float Port_Value1_N016 4420
//float Port_Default_N039 4424
//float Port_Import_N032 4428
//float Port_Input1_N018 4432
//float Port_Value1_N019 4436
//float Port_Default_N052 4440
//float depthRef 4444
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
//spec_const bool SC_USE_CLAMP_TO_BORDER_Tweak_N5 1031
//spec_const bool SC_USE_CLAMP_TO_BORDER_baseTex 1032
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 1033
//spec_const bool SC_USE_UV_MIN_MAX_Tweak_N5 1034
//spec_const bool SC_USE_UV_MIN_MAX_baseTex 1035
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 1036
//spec_const bool SC_USE_UV_TRANSFORM_Tweak_N5 1037
//spec_const bool SC_USE_UV_TRANSFORM_baseTex 1038
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 1039
//spec_const bool Tweak_N33 1040
//spec_const bool Tweak_N34 1041
//spec_const bool Tweak_N5HasSwappedViews 1042
//spec_const bool Tweak_N9 1043
//spec_const bool UseViewSpaceDepthVariant 1044
//spec_const bool baseTexHasSwappedViews 1045
//spec_const bool intensityTextureHasSwappedViews 1046
//spec_const bool sc_BlendMode_AddWithAlphaFactor 1047
//spec_const bool sc_BlendMode_Add 1048
//spec_const bool sc_BlendMode_AlphaTest 1049
//spec_const bool sc_BlendMode_AlphaToCoverage 1050
//spec_const bool sc_BlendMode_ColoredGlass 1051
//spec_const bool sc_BlendMode_Custom 1052
//spec_const bool sc_BlendMode_Max 1053
//spec_const bool sc_BlendMode_Min 1054
//spec_const bool sc_BlendMode_MultiplyOriginal 1055
//spec_const bool sc_BlendMode_Multiply 1056
//spec_const bool sc_BlendMode_Normal 1057
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 1058
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 1059
//spec_const bool sc_BlendMode_PremultipliedAlpha 1060
//spec_const bool sc_BlendMode_Screen 1061
//spec_const bool sc_DepthOnly 1062
//spec_const bool sc_FramebufferFetch 1063
//spec_const bool sc_MotionVectorsPass 1064
//spec_const bool sc_OITCompositingPass 1065
//spec_const bool sc_OITDepthBoundsPass 1066
//spec_const bool sc_OITDepthGatherPass 1067
//spec_const bool sc_ProjectiveShadowsCaster 1068
//spec_const bool sc_ProjectiveShadowsReceiver 1069
//spec_const bool sc_ProxyAlphaOne 1070
//spec_const bool sc_RenderAlphaToColor 1071
//spec_const bool sc_ScreenTextureHasSwappedViews 1072
//spec_const bool sc_ShaderComplexityAnalyzer 1073
//spec_const bool sc_UseFramebufferFetchMarker 1074
//spec_const bool sc_VertexBlendingUseNormals 1075
//spec_const bool sc_VertexBlending 1076
//spec_const int SC_SOFTWARE_WRAP_MODE_U_Tweak_N5 1077
//spec_const int SC_SOFTWARE_WRAP_MODE_U_baseTex 1078
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 1079
//spec_const int SC_SOFTWARE_WRAP_MODE_V_Tweak_N5 1080
//spec_const int SC_SOFTWARE_WRAP_MODE_V_baseTex 1081
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 1082
//spec_const int Tweak_N5Layout 1083
//spec_const int baseTexLayout 1084
//spec_const int intensityTextureLayout 1085
//spec_const int sc_DepthBufferMode 1086
//spec_const int sc_RenderingSpace 1087
//spec_const int sc_ScreenTextureLayout 1088
//spec_const int sc_SkinBonesCount 1089
//spec_const int sc_StereoRenderingMode 1090
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 1091
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
constant bool SC_USE_CLAMP_TO_BORDER_Tweak_N5 [[function_constant(1031)]];
constant bool SC_USE_CLAMP_TO_BORDER_Tweak_N5_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_Tweak_N5) ? SC_USE_CLAMP_TO_BORDER_Tweak_N5 : false;
constant bool SC_USE_CLAMP_TO_BORDER_baseTex [[function_constant(1032)]];
constant bool SC_USE_CLAMP_TO_BORDER_baseTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_baseTex) ? SC_USE_CLAMP_TO_BORDER_baseTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(1033)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_Tweak_N5 [[function_constant(1034)]];
constant bool SC_USE_UV_MIN_MAX_Tweak_N5_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_Tweak_N5) ? SC_USE_UV_MIN_MAX_Tweak_N5 : false;
constant bool SC_USE_UV_MIN_MAX_baseTex [[function_constant(1035)]];
constant bool SC_USE_UV_MIN_MAX_baseTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_baseTex) ? SC_USE_UV_MIN_MAX_baseTex : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(1036)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_Tweak_N5 [[function_constant(1037)]];
constant bool SC_USE_UV_TRANSFORM_Tweak_N5_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_Tweak_N5) ? SC_USE_UV_TRANSFORM_Tweak_N5 : false;
constant bool SC_USE_UV_TRANSFORM_baseTex [[function_constant(1038)]];
constant bool SC_USE_UV_TRANSFORM_baseTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_baseTex) ? SC_USE_UV_TRANSFORM_baseTex : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(1039)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool Tweak_N33 [[function_constant(1040)]];
constant bool Tweak_N33_tmp = is_function_constant_defined(Tweak_N33) ? Tweak_N33 : false;
constant bool Tweak_N34 [[function_constant(1041)]];
constant bool Tweak_N34_tmp = is_function_constant_defined(Tweak_N34) ? Tweak_N34 : false;
constant bool Tweak_N5HasSwappedViews [[function_constant(1042)]];
constant bool Tweak_N5HasSwappedViews_tmp = is_function_constant_defined(Tweak_N5HasSwappedViews) ? Tweak_N5HasSwappedViews : false;
constant bool Tweak_N9 [[function_constant(1043)]];
constant bool Tweak_N9_tmp = is_function_constant_defined(Tweak_N9) ? Tweak_N9 : false;
constant bool UseViewSpaceDepthVariant [[function_constant(1044)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool baseTexHasSwappedViews [[function_constant(1045)]];
constant bool baseTexHasSwappedViews_tmp = is_function_constant_defined(baseTexHasSwappedViews) ? baseTexHasSwappedViews : false;
constant bool intensityTextureHasSwappedViews [[function_constant(1046)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(1047)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(1048)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(1049)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(1050)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(1051)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(1052)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(1053)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(1054)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(1055)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(1056)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(1057)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(1058)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(1059)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(1060)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(1061)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(1062)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_FramebufferFetch [[function_constant(1063)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_MotionVectorsPass [[function_constant(1064)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(1065)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(1066)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(1067)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(1068)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(1069)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_ProxyAlphaOne [[function_constant(1070)]];
constant bool sc_ProxyAlphaOne_tmp = is_function_constant_defined(sc_ProxyAlphaOne) ? sc_ProxyAlphaOne : false;
constant bool sc_RenderAlphaToColor [[function_constant(1071)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(1072)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(1073)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(1074)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(1075)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(1076)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant int SC_SOFTWARE_WRAP_MODE_U_Tweak_N5 [[function_constant(1077)]];
constant int SC_SOFTWARE_WRAP_MODE_U_Tweak_N5_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_Tweak_N5) ? SC_SOFTWARE_WRAP_MODE_U_Tweak_N5 : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_baseTex [[function_constant(1078)]];
constant int SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_baseTex) ? SC_SOFTWARE_WRAP_MODE_U_baseTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(1079)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_Tweak_N5 [[function_constant(1080)]];
constant int SC_SOFTWARE_WRAP_MODE_V_Tweak_N5_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_Tweak_N5) ? SC_SOFTWARE_WRAP_MODE_V_Tweak_N5 : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_baseTex [[function_constant(1081)]];
constant int SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_baseTex) ? SC_SOFTWARE_WRAP_MODE_V_baseTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(1082)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int Tweak_N5Layout [[function_constant(1083)]];
constant int Tweak_N5Layout_tmp = is_function_constant_defined(Tweak_N5Layout) ? Tweak_N5Layout : 0;
constant int baseTexLayout [[function_constant(1084)]];
constant int baseTexLayout_tmp = is_function_constant_defined(baseTexLayout) ? baseTexLayout : 0;
constant int intensityTextureLayout [[function_constant(1085)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int sc_DepthBufferMode [[function_constant(1086)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_RenderingSpace [[function_constant(1087)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(1088)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_SkinBonesCount [[function_constant(1089)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(1090)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(1091)]];
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
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float tiling;
float Tweak_N0;
float Tweak_N3;
float4 Tweak_N5Size;
float4 Tweak_N5Dims;
float4 Tweak_N5View;
float3x3 Tweak_N5Transform;
float4 Tweak_N5UvMinMax;
float4 Tweak_N5BorderColor;
float2 Port_Center_N001;
float Port_Speed_N025;
float Port_Import_N029;
float Port_Import_N028;
float4 Port_Import_N027;
float Port_Input1_N014;
float Port_Value1_N013;
float Port_Default_N037;
float Port_Import_N031;
float Port_Input1_N015;
float Port_Value1_N016;
float Port_Default_N039;
float Port_Import_N032;
float Port_Input1_N018;
float Port_Value1_N019;
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
texture2d<float> Tweak_N5 [[id(4)]];
texture2d<float> baseTex [[id(5)]];
texture2d<float> intensityTexture [[id(6)]];
texture2d<float> sc_ScreenTexture [[id(18)]];
texture2d<uint> z_hitIdAndBarycentric [[id(21)]];
texture2d<float> z_rayDirections [[id(22)]];
sampler Tweak_N5SmpSC [[id(23)]];
sampler baseTexSmpSC [[id(24)]];
sampler intensityTextureSmpSC [[id(25)]];
sampler sc_ScreenTextureSmpSC [[id(30)]];
sampler z_hitIdAndBarycentricSmp [[id(33)]];
sampler z_rayDirectionsSmpSC [[id(34)]];
constant userUniformsObj* UserUniforms [[id(35)]];
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
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float tiling;
float Tweak_N0;
float Tweak_N3;
float4 Tweak_N5Size;
float4 Tweak_N5Dims;
float4 Tweak_N5View;
float3x3 Tweak_N5Transform;
float4 Tweak_N5UvMinMax;
float4 Tweak_N5BorderColor;
float2 Port_Center_N001;
float Port_Speed_N025;
float Port_Import_N029;
float Port_Import_N028;
float4 Port_Import_N027;
float Port_Input1_N014;
float Port_Value1_N013;
float Port_Default_N037;
float Port_Import_N031;
float Port_Input1_N015;
float Port_Value1_N016;
float Port_Default_N039;
float Port_Import_N032;
float Port_Input1_N018;
float Port_Value1_N019;
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
texture2d<float> Tweak_N5 [[id(4)]];
texture2d<float> baseTex [[id(5)]];
texture2d<float> intensityTexture [[id(6)]];
texture2d<float> sc_ScreenTexture [[id(18)]];
texture2d<uint> z_hitIdAndBarycentric [[id(21)]];
texture2d<float> z_rayDirections [[id(22)]];
sampler Tweak_N5SmpSC [[id(23)]];
sampler baseTexSmpSC [[id(24)]];
sampler intensityTextureSmpSC [[id(25)]];
sampler sc_ScreenTextureSmpSC [[id(30)]];
sampler z_hitIdAndBarycentricSmp [[id(33)]];
sampler z_rayDirectionsSmpSC [[id(34)]];
constant userUniformsObj* UserUniforms [[id(35)]];
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
float2 ScreenCoord_N17=float2(0.0);
ScreenCoord_N17=Globals.gScreenCoord;
float Output_N2=0.0;
float param=(*sc_set2.UserUniforms).tiling;
Output_N2=param;
float Camera_Aspect_N23=0.0;
Camera_Aspect_N23=(*sc_set2.UserUniforms).sc_Camera.aspect;
float Output_N20=0.0;
Output_N20=Output_N2/Camera_Aspect_N23;
float4 Output1_N21=float4(0.0);
Output1_N21=float4(Output_N2,Output_N20,Output_N2,Output_N2);
float2 CoordsOut_N1=float2(0.0);
CoordsOut_N1=((ScreenCoord_N17-(*sc_set2.UserUniforms).Port_Center_N001)*Output1_N21.xy)+(*sc_set2.UserUniforms).Port_Center_N001;
float Output_N0=0.0;
float param_1=(*sc_set2.UserUniforms).Tweak_N0;
Output_N0=param_1;
float Output_N3=0.0;
float param_2=(*sc_set2.UserUniforms).Tweak_N3;
Output_N3=param_2;
float4 Output1_N8=float4(0.0);
Output1_N8=float4(Output_N0,Output_N3,Output_N0,Output_N0);
float2 CoordsOut_N25=float2(0.0);
CoordsOut_N25=CoordsOut_N1+(Output1_N8.xy*(Globals.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N025));
float4 Output_N7=float4(0.0);
int l9_24=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_25=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_25=0;
}
else
{
l9_25=in.varStereoViewID;
}
int l9_26=l9_25;
l9_24=1-l9_26;
}
else
{
int l9_27=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_27=0;
}
else
{
l9_27=in.varStereoViewID;
}
int l9_28=l9_27;
l9_24=l9_28;
}
int l9_29=l9_24;
int param_3=baseTexLayout_tmp;
int param_4=l9_29;
float2 param_5=CoordsOut_N25;
bool param_6=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 param_7=(*sc_set2.UserUniforms).baseTexTransform;
int2 param_8=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool param_9=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 param_10=(*sc_set2.UserUniforms).baseTexUvMinMax;
bool param_11=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 param_12=(*sc_set2.UserUniforms).baseTexBorderColor;
float param_13=0.0;
bool l9_30=param_11&&(!param_9);
float l9_31=1.0;
float l9_32=param_5.x;
int l9_33=param_8.x;
if (l9_33==1)
{
l9_32=fract(l9_32);
}
else
{
if (l9_33==2)
{
float l9_34=fract(l9_32);
float l9_35=l9_32-l9_34;
float l9_36=step(0.25,fract(l9_35*0.5));
l9_32=mix(l9_34,1.0-l9_34,fast::clamp(l9_36,0.0,1.0));
}
}
param_5.x=l9_32;
float l9_37=param_5.y;
int l9_38=param_8.y;
if (l9_38==1)
{
l9_37=fract(l9_37);
}
else
{
if (l9_38==2)
{
float l9_39=fract(l9_37);
float l9_40=l9_37-l9_39;
float l9_41=step(0.25,fract(l9_40*0.5));
l9_37=mix(l9_39,1.0-l9_39,fast::clamp(l9_41,0.0,1.0));
}
}
param_5.y=l9_37;
if (param_9)
{
bool l9_42=param_11;
bool l9_43;
if (l9_42)
{
l9_43=param_8.x==3;
}
else
{
l9_43=l9_42;
}
float l9_44=param_5.x;
float l9_45=param_10.x;
float l9_46=param_10.z;
bool l9_47=l9_43;
float l9_48=l9_31;
float l9_49=fast::clamp(l9_44,l9_45,l9_46);
float l9_50=step(abs(l9_44-l9_49),9.9999997e-06);
l9_48*=(l9_50+((1.0-float(l9_47))*(1.0-l9_50)));
l9_44=l9_49;
param_5.x=l9_44;
l9_31=l9_48;
bool l9_51=param_11;
bool l9_52;
if (l9_51)
{
l9_52=param_8.y==3;
}
else
{
l9_52=l9_51;
}
float l9_53=param_5.y;
float l9_54=param_10.y;
float l9_55=param_10.w;
bool l9_56=l9_52;
float l9_57=l9_31;
float l9_58=fast::clamp(l9_53,l9_54,l9_55);
float l9_59=step(abs(l9_53-l9_58),9.9999997e-06);
l9_57*=(l9_59+((1.0-float(l9_56))*(1.0-l9_59)));
l9_53=l9_58;
param_5.y=l9_53;
l9_31=l9_57;
}
float2 l9_60=param_5;
bool l9_61=param_6;
float3x3 l9_62=param_7;
if (l9_61)
{
l9_60=float2((l9_62*float3(l9_60,1.0)).xy);
}
float2 l9_63=l9_60;
float2 l9_64=l9_63;
float2 l9_65=l9_64;
param_5=l9_65;
float l9_66=param_5.x;
int l9_67=param_8.x;
bool l9_68=l9_30;
float l9_69=l9_31;
if ((l9_67==0)||(l9_67==3))
{
float l9_70=l9_66;
float l9_71=0.0;
float l9_72=1.0;
bool l9_73=l9_68;
float l9_74=l9_69;
float l9_75=fast::clamp(l9_70,l9_71,l9_72);
float l9_76=step(abs(l9_70-l9_75),9.9999997e-06);
l9_74*=(l9_76+((1.0-float(l9_73))*(1.0-l9_76)));
l9_70=l9_75;
l9_66=l9_70;
l9_69=l9_74;
}
param_5.x=l9_66;
l9_31=l9_69;
float l9_77=param_5.y;
int l9_78=param_8.y;
bool l9_79=l9_30;
float l9_80=l9_31;
if ((l9_78==0)||(l9_78==3))
{
float l9_81=l9_77;
float l9_82=0.0;
float l9_83=1.0;
bool l9_84=l9_79;
float l9_85=l9_80;
float l9_86=fast::clamp(l9_81,l9_82,l9_83);
float l9_87=step(abs(l9_81-l9_86),9.9999997e-06);
l9_85*=(l9_87+((1.0-float(l9_84))*(1.0-l9_87)));
l9_81=l9_86;
l9_77=l9_81;
l9_80=l9_85;
}
param_5.y=l9_77;
l9_31=l9_80;
float2 l9_88=param_5;
int l9_89=param_3;
int l9_90=param_4;
float l9_91=param_13;
float2 l9_92=l9_88;
int l9_93=l9_89;
int l9_94=l9_90;
float3 l9_95=float3(0.0);
if (l9_93==0)
{
l9_95=float3(l9_92,0.0);
}
else
{
if (l9_93==1)
{
l9_95=float3(l9_92.x,(l9_92.y*0.5)+(0.5-(float(l9_94)*0.5)),0.0);
}
else
{
l9_95=float3(l9_92,float(l9_94));
}
}
float3 l9_96=l9_95;
float3 l9_97=l9_96;
float2 l9_98=l9_97.xy;
float l9_99=l9_91;
float4 l9_100=sc_set2.baseTex.sample(sc_set2.baseTexSmpSC,l9_98,bias(l9_99));
float4 l9_101=l9_100;
float4 l9_102=l9_101;
if (param_11)
{
l9_102=mix(param_12,l9_102,float4(l9_31));
}
float4 l9_103=l9_102;
Output_N7=l9_103;
float Result_N37=0.0;
float param_14=0.0;
float param_15=(*sc_set2.UserUniforms).Port_Default_N037;
ssGlobals param_17=Globals;
float param_16;
if ((int(Tweak_N9_tmp)!=0))
{
float l9_104=0.0;
float l9_105=0.0;
float l9_106=(*sc_set2.UserUniforms).Port_Value1_N013;
float l9_107=0.0;
ssGlobals l9_108=param_17;
float2 l9_109=float2(0.0);
l9_109=l9_108.gScreenCoord;
float l9_110=0.0;
float l9_111=(*sc_set2.UserUniforms).tiling;
l9_110=l9_111;
float l9_112=0.0;
l9_112=(*sc_set2.UserUniforms).sc_Camera.aspect;
float l9_113=0.0;
l9_113=l9_110/l9_112;
float4 l9_114=float4(0.0);
l9_114=float4(l9_110,l9_113,l9_110,l9_110);
float2 l9_115=float2(0.0);
l9_115=((l9_109-(*sc_set2.UserUniforms).Port_Center_N001)*l9_114.xy)+(*sc_set2.UserUniforms).Port_Center_N001;
float l9_116=0.0;
float l9_117=(*sc_set2.UserUniforms).Tweak_N0;
l9_116=l9_117;
float l9_118=0.0;
float l9_119=(*sc_set2.UserUniforms).Tweak_N3;
l9_118=l9_119;
float4 l9_120=float4(0.0);
l9_120=float4(l9_116,l9_118,l9_116,l9_116);
float2 l9_121=float2(0.0);
l9_121=l9_115+(l9_120.xy*(l9_108.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N025));
float4 l9_122=float4(0.0);
int l9_123=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_124=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_124=0;
}
else
{
l9_124=in.varStereoViewID;
}
int l9_125=l9_124;
l9_123=1-l9_125;
}
else
{
int l9_126=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_126=0;
}
else
{
l9_126=in.varStereoViewID;
}
int l9_127=l9_126;
l9_123=l9_127;
}
int l9_128=l9_123;
int l9_129=baseTexLayout_tmp;
int l9_130=l9_128;
float2 l9_131=l9_121;
bool l9_132=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_133=(*sc_set2.UserUniforms).baseTexTransform;
int2 l9_134=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_135=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_136=(*sc_set2.UserUniforms).baseTexUvMinMax;
bool l9_137=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_138=(*sc_set2.UserUniforms).baseTexBorderColor;
float l9_139=0.0;
bool l9_140=l9_137&&(!l9_135);
float l9_141=1.0;
float l9_142=l9_131.x;
int l9_143=l9_134.x;
if (l9_143==1)
{
l9_142=fract(l9_142);
}
else
{
if (l9_143==2)
{
float l9_144=fract(l9_142);
float l9_145=l9_142-l9_144;
float l9_146=step(0.25,fract(l9_145*0.5));
l9_142=mix(l9_144,1.0-l9_144,fast::clamp(l9_146,0.0,1.0));
}
}
l9_131.x=l9_142;
float l9_147=l9_131.y;
int l9_148=l9_134.y;
if (l9_148==1)
{
l9_147=fract(l9_147);
}
else
{
if (l9_148==2)
{
float l9_149=fract(l9_147);
float l9_150=l9_147-l9_149;
float l9_151=step(0.25,fract(l9_150*0.5));
l9_147=mix(l9_149,1.0-l9_149,fast::clamp(l9_151,0.0,1.0));
}
}
l9_131.y=l9_147;
if (l9_135)
{
bool l9_152=l9_137;
bool l9_153;
if (l9_152)
{
l9_153=l9_134.x==3;
}
else
{
l9_153=l9_152;
}
float l9_154=l9_131.x;
float l9_155=l9_136.x;
float l9_156=l9_136.z;
bool l9_157=l9_153;
float l9_158=l9_141;
float l9_159=fast::clamp(l9_154,l9_155,l9_156);
float l9_160=step(abs(l9_154-l9_159),9.9999997e-06);
l9_158*=(l9_160+((1.0-float(l9_157))*(1.0-l9_160)));
l9_154=l9_159;
l9_131.x=l9_154;
l9_141=l9_158;
bool l9_161=l9_137;
bool l9_162;
if (l9_161)
{
l9_162=l9_134.y==3;
}
else
{
l9_162=l9_161;
}
float l9_163=l9_131.y;
float l9_164=l9_136.y;
float l9_165=l9_136.w;
bool l9_166=l9_162;
float l9_167=l9_141;
float l9_168=fast::clamp(l9_163,l9_164,l9_165);
float l9_169=step(abs(l9_163-l9_168),9.9999997e-06);
l9_167*=(l9_169+((1.0-float(l9_166))*(1.0-l9_169)));
l9_163=l9_168;
l9_131.y=l9_163;
l9_141=l9_167;
}
float2 l9_170=l9_131;
bool l9_171=l9_132;
float3x3 l9_172=l9_133;
if (l9_171)
{
l9_170=float2((l9_172*float3(l9_170,1.0)).xy);
}
float2 l9_173=l9_170;
float2 l9_174=l9_173;
float2 l9_175=l9_174;
l9_131=l9_175;
float l9_176=l9_131.x;
int l9_177=l9_134.x;
bool l9_178=l9_140;
float l9_179=l9_141;
if ((l9_177==0)||(l9_177==3))
{
float l9_180=l9_176;
float l9_181=0.0;
float l9_182=1.0;
bool l9_183=l9_178;
float l9_184=l9_179;
float l9_185=fast::clamp(l9_180,l9_181,l9_182);
float l9_186=step(abs(l9_180-l9_185),9.9999997e-06);
l9_184*=(l9_186+((1.0-float(l9_183))*(1.0-l9_186)));
l9_180=l9_185;
l9_176=l9_180;
l9_179=l9_184;
}
l9_131.x=l9_176;
l9_141=l9_179;
float l9_187=l9_131.y;
int l9_188=l9_134.y;
bool l9_189=l9_140;
float l9_190=l9_141;
if ((l9_188==0)||(l9_188==3))
{
float l9_191=l9_187;
float l9_192=0.0;
float l9_193=1.0;
bool l9_194=l9_189;
float l9_195=l9_190;
float l9_196=fast::clamp(l9_191,l9_192,l9_193);
float l9_197=step(abs(l9_191-l9_196),9.9999997e-06);
l9_195*=(l9_197+((1.0-float(l9_194))*(1.0-l9_197)));
l9_191=l9_196;
l9_187=l9_191;
l9_190=l9_195;
}
l9_131.y=l9_187;
l9_141=l9_190;
float2 l9_198=l9_131;
int l9_199=l9_129;
int l9_200=l9_130;
float l9_201=l9_139;
float2 l9_202=l9_198;
int l9_203=l9_199;
int l9_204=l9_200;
float3 l9_205=float3(0.0);
if (l9_203==0)
{
l9_205=float3(l9_202,0.0);
}
else
{
if (l9_203==1)
{
l9_205=float3(l9_202.x,(l9_202.y*0.5)+(0.5-(float(l9_204)*0.5)),0.0);
}
else
{
l9_205=float3(l9_202,float(l9_204));
}
}
float3 l9_206=l9_205;
float3 l9_207=l9_206;
float2 l9_208=l9_207.xy;
float l9_209=l9_201;
float4 l9_210=sc_set2.baseTex.sample(sc_set2.baseTexSmpSC,l9_208,bias(l9_209));
float4 l9_211=l9_210;
float4 l9_212=l9_211;
if (l9_137)
{
l9_212=mix(l9_138,l9_212,float4(l9_141));
}
float4 l9_213=l9_212;
l9_122=l9_213;
float l9_214=0.0;
l9_214=l9_122.w;
float l9_215=0.0;
l9_215=l9_214;
float4 l9_216=float4(0.0);
int l9_217=0;
if ((int(Tweak_N5HasSwappedViews_tmp)!=0))
{
int l9_218=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_218=0;
}
else
{
l9_218=in.varStereoViewID;
}
int l9_219=l9_218;
l9_217=1-l9_219;
}
else
{
int l9_220=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_220=0;
}
else
{
l9_220=in.varStereoViewID;
}
int l9_221=l9_220;
l9_217=l9_221;
}
int l9_222=l9_217;
int l9_223=Tweak_N5Layout_tmp;
int l9_224=l9_222;
float2 l9_225=l9_108.Surface_UVCoord0;
bool l9_226=(int(SC_USE_UV_TRANSFORM_Tweak_N5_tmp)!=0);
float3x3 l9_227=(*sc_set2.UserUniforms).Tweak_N5Transform;
int2 l9_228=int2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N5_tmp,SC_SOFTWARE_WRAP_MODE_V_Tweak_N5_tmp);
bool l9_229=(int(SC_USE_UV_MIN_MAX_Tweak_N5_tmp)!=0);
float4 l9_230=(*sc_set2.UserUniforms).Tweak_N5UvMinMax;
bool l9_231=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N5_tmp)!=0);
float4 l9_232=(*sc_set2.UserUniforms).Tweak_N5BorderColor;
float l9_233=0.0;
bool l9_234=l9_231&&(!l9_229);
float l9_235=1.0;
float l9_236=l9_225.x;
int l9_237=l9_228.x;
if (l9_237==1)
{
l9_236=fract(l9_236);
}
else
{
if (l9_237==2)
{
float l9_238=fract(l9_236);
float l9_239=l9_236-l9_238;
float l9_240=step(0.25,fract(l9_239*0.5));
l9_236=mix(l9_238,1.0-l9_238,fast::clamp(l9_240,0.0,1.0));
}
}
l9_225.x=l9_236;
float l9_241=l9_225.y;
int l9_242=l9_228.y;
if (l9_242==1)
{
l9_241=fract(l9_241);
}
else
{
if (l9_242==2)
{
float l9_243=fract(l9_241);
float l9_244=l9_241-l9_243;
float l9_245=step(0.25,fract(l9_244*0.5));
l9_241=mix(l9_243,1.0-l9_243,fast::clamp(l9_245,0.0,1.0));
}
}
l9_225.y=l9_241;
if (l9_229)
{
bool l9_246=l9_231;
bool l9_247;
if (l9_246)
{
l9_247=l9_228.x==3;
}
else
{
l9_247=l9_246;
}
float l9_248=l9_225.x;
float l9_249=l9_230.x;
float l9_250=l9_230.z;
bool l9_251=l9_247;
float l9_252=l9_235;
float l9_253=fast::clamp(l9_248,l9_249,l9_250);
float l9_254=step(abs(l9_248-l9_253),9.9999997e-06);
l9_252*=(l9_254+((1.0-float(l9_251))*(1.0-l9_254)));
l9_248=l9_253;
l9_225.x=l9_248;
l9_235=l9_252;
bool l9_255=l9_231;
bool l9_256;
if (l9_255)
{
l9_256=l9_228.y==3;
}
else
{
l9_256=l9_255;
}
float l9_257=l9_225.y;
float l9_258=l9_230.y;
float l9_259=l9_230.w;
bool l9_260=l9_256;
float l9_261=l9_235;
float l9_262=fast::clamp(l9_257,l9_258,l9_259);
float l9_263=step(abs(l9_257-l9_262),9.9999997e-06);
l9_261*=(l9_263+((1.0-float(l9_260))*(1.0-l9_263)));
l9_257=l9_262;
l9_225.y=l9_257;
l9_235=l9_261;
}
float2 l9_264=l9_225;
bool l9_265=l9_226;
float3x3 l9_266=l9_227;
if (l9_265)
{
l9_264=float2((l9_266*float3(l9_264,1.0)).xy);
}
float2 l9_267=l9_264;
float2 l9_268=l9_267;
float2 l9_269=l9_268;
l9_225=l9_269;
float l9_270=l9_225.x;
int l9_271=l9_228.x;
bool l9_272=l9_234;
float l9_273=l9_235;
if ((l9_271==0)||(l9_271==3))
{
float l9_274=l9_270;
float l9_275=0.0;
float l9_276=1.0;
bool l9_277=l9_272;
float l9_278=l9_273;
float l9_279=fast::clamp(l9_274,l9_275,l9_276);
float l9_280=step(abs(l9_274-l9_279),9.9999997e-06);
l9_278*=(l9_280+((1.0-float(l9_277))*(1.0-l9_280)));
l9_274=l9_279;
l9_270=l9_274;
l9_273=l9_278;
}
l9_225.x=l9_270;
l9_235=l9_273;
float l9_281=l9_225.y;
int l9_282=l9_228.y;
bool l9_283=l9_234;
float l9_284=l9_235;
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
l9_225.y=l9_281;
l9_235=l9_284;
float2 l9_292=l9_225;
int l9_293=l9_223;
int l9_294=l9_224;
float l9_295=l9_233;
float2 l9_296=l9_292;
int l9_297=l9_293;
int l9_298=l9_294;
float3 l9_299=float3(0.0);
if (l9_297==0)
{
l9_299=float3(l9_296,0.0);
}
else
{
if (l9_297==1)
{
l9_299=float3(l9_296.x,(l9_296.y*0.5)+(0.5-(float(l9_298)*0.5)),0.0);
}
else
{
l9_299=float3(l9_296,float(l9_298));
}
}
float3 l9_300=l9_299;
float3 l9_301=l9_300;
float2 l9_302=l9_301.xy;
float l9_303=l9_295;
float4 l9_304=sc_set2.Tweak_N5.sample(sc_set2.Tweak_N5SmpSC,l9_302,bias(l9_303));
float4 l9_305=l9_304;
float4 l9_306=l9_305;
if (l9_231)
{
l9_306=mix(l9_232,l9_306,float4(l9_235));
}
float4 l9_307=l9_306;
l9_216=l9_307;
float4 l9_308=float4(0.0);
l9_308=l9_216;
float l9_309=0.0;
float4 l9_310=l9_308;
float l9_311=l9_310.x;
l9_309=l9_311;
float l9_312=0.0;
l9_312=l9_215*l9_309;
float l9_313=0.0;
l9_313=float(l9_312<=(*sc_set2.UserUniforms).Port_Input1_N014);
l9_105=l9_313;
float l9_314;
if ((l9_105*1.0)!=0.0)
{
l9_314=l9_106;
}
else
{
float2 l9_315=float2(0.0);
l9_315=l9_108.gScreenCoord;
float l9_316=0.0;
float l9_317=(*sc_set2.UserUniforms).tiling;
l9_316=l9_317;
float l9_318=0.0;
l9_318=(*sc_set2.UserUniforms).sc_Camera.aspect;
float l9_319=0.0;
l9_319=l9_316/l9_318;
float4 l9_320=float4(0.0);
l9_320=float4(l9_316,l9_319,l9_316,l9_316);
float2 l9_321=float2(0.0);
l9_321=((l9_315-(*sc_set2.UserUniforms).Port_Center_N001)*l9_320.xy)+(*sc_set2.UserUniforms).Port_Center_N001;
float l9_322=0.0;
float l9_323=(*sc_set2.UserUniforms).Tweak_N0;
l9_322=l9_323;
float l9_324=0.0;
float l9_325=(*sc_set2.UserUniforms).Tweak_N3;
l9_324=l9_325;
float4 l9_326=float4(0.0);
l9_326=float4(l9_322,l9_324,l9_322,l9_322);
float2 l9_327=float2(0.0);
l9_327=l9_321+(l9_326.xy*(l9_108.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N025));
float4 l9_328=float4(0.0);
int l9_329=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_330=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_330=0;
}
else
{
l9_330=in.varStereoViewID;
}
int l9_331=l9_330;
l9_329=1-l9_331;
}
else
{
int l9_332=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_332=0;
}
else
{
l9_332=in.varStereoViewID;
}
int l9_333=l9_332;
l9_329=l9_333;
}
int l9_334=l9_329;
int l9_335=baseTexLayout_tmp;
int l9_336=l9_334;
float2 l9_337=l9_327;
bool l9_338=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_339=(*sc_set2.UserUniforms).baseTexTransform;
int2 l9_340=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_341=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_342=(*sc_set2.UserUniforms).baseTexUvMinMax;
bool l9_343=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_344=(*sc_set2.UserUniforms).baseTexBorderColor;
float l9_345=0.0;
bool l9_346=l9_343&&(!l9_341);
float l9_347=1.0;
float l9_348=l9_337.x;
int l9_349=l9_340.x;
if (l9_349==1)
{
l9_348=fract(l9_348);
}
else
{
if (l9_349==2)
{
float l9_350=fract(l9_348);
float l9_351=l9_348-l9_350;
float l9_352=step(0.25,fract(l9_351*0.5));
l9_348=mix(l9_350,1.0-l9_350,fast::clamp(l9_352,0.0,1.0));
}
}
l9_337.x=l9_348;
float l9_353=l9_337.y;
int l9_354=l9_340.y;
if (l9_354==1)
{
l9_353=fract(l9_353);
}
else
{
if (l9_354==2)
{
float l9_355=fract(l9_353);
float l9_356=l9_353-l9_355;
float l9_357=step(0.25,fract(l9_356*0.5));
l9_353=mix(l9_355,1.0-l9_355,fast::clamp(l9_357,0.0,1.0));
}
}
l9_337.y=l9_353;
if (l9_341)
{
bool l9_358=l9_343;
bool l9_359;
if (l9_358)
{
l9_359=l9_340.x==3;
}
else
{
l9_359=l9_358;
}
float l9_360=l9_337.x;
float l9_361=l9_342.x;
float l9_362=l9_342.z;
bool l9_363=l9_359;
float l9_364=l9_347;
float l9_365=fast::clamp(l9_360,l9_361,l9_362);
float l9_366=step(abs(l9_360-l9_365),9.9999997e-06);
l9_364*=(l9_366+((1.0-float(l9_363))*(1.0-l9_366)));
l9_360=l9_365;
l9_337.x=l9_360;
l9_347=l9_364;
bool l9_367=l9_343;
bool l9_368;
if (l9_367)
{
l9_368=l9_340.y==3;
}
else
{
l9_368=l9_367;
}
float l9_369=l9_337.y;
float l9_370=l9_342.y;
float l9_371=l9_342.w;
bool l9_372=l9_368;
float l9_373=l9_347;
float l9_374=fast::clamp(l9_369,l9_370,l9_371);
float l9_375=step(abs(l9_369-l9_374),9.9999997e-06);
l9_373*=(l9_375+((1.0-float(l9_372))*(1.0-l9_375)));
l9_369=l9_374;
l9_337.y=l9_369;
l9_347=l9_373;
}
float2 l9_376=l9_337;
bool l9_377=l9_338;
float3x3 l9_378=l9_339;
if (l9_377)
{
l9_376=float2((l9_378*float3(l9_376,1.0)).xy);
}
float2 l9_379=l9_376;
float2 l9_380=l9_379;
float2 l9_381=l9_380;
l9_337=l9_381;
float l9_382=l9_337.x;
int l9_383=l9_340.x;
bool l9_384=l9_346;
float l9_385=l9_347;
if ((l9_383==0)||(l9_383==3))
{
float l9_386=l9_382;
float l9_387=0.0;
float l9_388=1.0;
bool l9_389=l9_384;
float l9_390=l9_385;
float l9_391=fast::clamp(l9_386,l9_387,l9_388);
float l9_392=step(abs(l9_386-l9_391),9.9999997e-06);
l9_390*=(l9_392+((1.0-float(l9_389))*(1.0-l9_392)));
l9_386=l9_391;
l9_382=l9_386;
l9_385=l9_390;
}
l9_337.x=l9_382;
l9_347=l9_385;
float l9_393=l9_337.y;
int l9_394=l9_340.y;
bool l9_395=l9_346;
float l9_396=l9_347;
if ((l9_394==0)||(l9_394==3))
{
float l9_397=l9_393;
float l9_398=0.0;
float l9_399=1.0;
bool l9_400=l9_395;
float l9_401=l9_396;
float l9_402=fast::clamp(l9_397,l9_398,l9_399);
float l9_403=step(abs(l9_397-l9_402),9.9999997e-06);
l9_401*=(l9_403+((1.0-float(l9_400))*(1.0-l9_403)));
l9_397=l9_402;
l9_393=l9_397;
l9_396=l9_401;
}
l9_337.y=l9_393;
l9_347=l9_396;
float2 l9_404=l9_337;
int l9_405=l9_335;
int l9_406=l9_336;
float l9_407=l9_345;
float2 l9_408=l9_404;
int l9_409=l9_405;
int l9_410=l9_406;
float3 l9_411=float3(0.0);
if (l9_409==0)
{
l9_411=float3(l9_408,0.0);
}
else
{
if (l9_409==1)
{
l9_411=float3(l9_408.x,(l9_408.y*0.5)+(0.5-(float(l9_410)*0.5)),0.0);
}
else
{
l9_411=float3(l9_408,float(l9_410));
}
}
float3 l9_412=l9_411;
float3 l9_413=l9_412;
float2 l9_414=l9_413.xy;
float l9_415=l9_407;
float4 l9_416=sc_set2.baseTex.sample(sc_set2.baseTexSmpSC,l9_414,bias(l9_415));
float4 l9_417=l9_416;
float4 l9_418=l9_417;
if (l9_343)
{
l9_418=mix(l9_344,l9_418,float4(l9_347));
}
float4 l9_419=l9_418;
l9_328=l9_419;
float l9_420=0.0;
l9_420=l9_328.w;
float l9_421=0.0;
l9_421=l9_420;
float4 l9_422=float4(0.0);
int l9_423=0;
if ((int(Tweak_N5HasSwappedViews_tmp)!=0))
{
int l9_424=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_424=0;
}
else
{
l9_424=in.varStereoViewID;
}
int l9_425=l9_424;
l9_423=1-l9_425;
}
else
{
int l9_426=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_426=0;
}
else
{
l9_426=in.varStereoViewID;
}
int l9_427=l9_426;
l9_423=l9_427;
}
int l9_428=l9_423;
int l9_429=Tweak_N5Layout_tmp;
int l9_430=l9_428;
float2 l9_431=l9_108.Surface_UVCoord0;
bool l9_432=(int(SC_USE_UV_TRANSFORM_Tweak_N5_tmp)!=0);
float3x3 l9_433=(*sc_set2.UserUniforms).Tweak_N5Transform;
int2 l9_434=int2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N5_tmp,SC_SOFTWARE_WRAP_MODE_V_Tweak_N5_tmp);
bool l9_435=(int(SC_USE_UV_MIN_MAX_Tweak_N5_tmp)!=0);
float4 l9_436=(*sc_set2.UserUniforms).Tweak_N5UvMinMax;
bool l9_437=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N5_tmp)!=0);
float4 l9_438=(*sc_set2.UserUniforms).Tweak_N5BorderColor;
float l9_439=0.0;
bool l9_440=l9_437&&(!l9_435);
float l9_441=1.0;
float l9_442=l9_431.x;
int l9_443=l9_434.x;
if (l9_443==1)
{
l9_442=fract(l9_442);
}
else
{
if (l9_443==2)
{
float l9_444=fract(l9_442);
float l9_445=l9_442-l9_444;
float l9_446=step(0.25,fract(l9_445*0.5));
l9_442=mix(l9_444,1.0-l9_444,fast::clamp(l9_446,0.0,1.0));
}
}
l9_431.x=l9_442;
float l9_447=l9_431.y;
int l9_448=l9_434.y;
if (l9_448==1)
{
l9_447=fract(l9_447);
}
else
{
if (l9_448==2)
{
float l9_449=fract(l9_447);
float l9_450=l9_447-l9_449;
float l9_451=step(0.25,fract(l9_450*0.5));
l9_447=mix(l9_449,1.0-l9_449,fast::clamp(l9_451,0.0,1.0));
}
}
l9_431.y=l9_447;
if (l9_435)
{
bool l9_452=l9_437;
bool l9_453;
if (l9_452)
{
l9_453=l9_434.x==3;
}
else
{
l9_453=l9_452;
}
float l9_454=l9_431.x;
float l9_455=l9_436.x;
float l9_456=l9_436.z;
bool l9_457=l9_453;
float l9_458=l9_441;
float l9_459=fast::clamp(l9_454,l9_455,l9_456);
float l9_460=step(abs(l9_454-l9_459),9.9999997e-06);
l9_458*=(l9_460+((1.0-float(l9_457))*(1.0-l9_460)));
l9_454=l9_459;
l9_431.x=l9_454;
l9_441=l9_458;
bool l9_461=l9_437;
bool l9_462;
if (l9_461)
{
l9_462=l9_434.y==3;
}
else
{
l9_462=l9_461;
}
float l9_463=l9_431.y;
float l9_464=l9_436.y;
float l9_465=l9_436.w;
bool l9_466=l9_462;
float l9_467=l9_441;
float l9_468=fast::clamp(l9_463,l9_464,l9_465);
float l9_469=step(abs(l9_463-l9_468),9.9999997e-06);
l9_467*=(l9_469+((1.0-float(l9_466))*(1.0-l9_469)));
l9_463=l9_468;
l9_431.y=l9_463;
l9_441=l9_467;
}
float2 l9_470=l9_431;
bool l9_471=l9_432;
float3x3 l9_472=l9_433;
if (l9_471)
{
l9_470=float2((l9_472*float3(l9_470,1.0)).xy);
}
float2 l9_473=l9_470;
float2 l9_474=l9_473;
float2 l9_475=l9_474;
l9_431=l9_475;
float l9_476=l9_431.x;
int l9_477=l9_434.x;
bool l9_478=l9_440;
float l9_479=l9_441;
if ((l9_477==0)||(l9_477==3))
{
float l9_480=l9_476;
float l9_481=0.0;
float l9_482=1.0;
bool l9_483=l9_478;
float l9_484=l9_479;
float l9_485=fast::clamp(l9_480,l9_481,l9_482);
float l9_486=step(abs(l9_480-l9_485),9.9999997e-06);
l9_484*=(l9_486+((1.0-float(l9_483))*(1.0-l9_486)));
l9_480=l9_485;
l9_476=l9_480;
l9_479=l9_484;
}
l9_431.x=l9_476;
l9_441=l9_479;
float l9_487=l9_431.y;
int l9_488=l9_434.y;
bool l9_489=l9_440;
float l9_490=l9_441;
if ((l9_488==0)||(l9_488==3))
{
float l9_491=l9_487;
float l9_492=0.0;
float l9_493=1.0;
bool l9_494=l9_489;
float l9_495=l9_490;
float l9_496=fast::clamp(l9_491,l9_492,l9_493);
float l9_497=step(abs(l9_491-l9_496),9.9999997e-06);
l9_495*=(l9_497+((1.0-float(l9_494))*(1.0-l9_497)));
l9_491=l9_496;
l9_487=l9_491;
l9_490=l9_495;
}
l9_431.y=l9_487;
l9_441=l9_490;
float2 l9_498=l9_431;
int l9_499=l9_429;
int l9_500=l9_430;
float l9_501=l9_439;
float2 l9_502=l9_498;
int l9_503=l9_499;
int l9_504=l9_500;
float3 l9_505=float3(0.0);
if (l9_503==0)
{
l9_505=float3(l9_502,0.0);
}
else
{
if (l9_503==1)
{
l9_505=float3(l9_502.x,(l9_502.y*0.5)+(0.5-(float(l9_504)*0.5)),0.0);
}
else
{
l9_505=float3(l9_502,float(l9_504));
}
}
float3 l9_506=l9_505;
float3 l9_507=l9_506;
float2 l9_508=l9_507.xy;
float l9_509=l9_501;
float4 l9_510=sc_set2.Tweak_N5.sample(sc_set2.Tweak_N5SmpSC,l9_508,bias(l9_509));
float4 l9_511=l9_510;
float4 l9_512=l9_511;
if (l9_437)
{
l9_512=mix(l9_438,l9_512,float4(l9_441));
}
float4 l9_513=l9_512;
l9_422=l9_513;
float4 l9_514=float4(0.0);
l9_514=l9_422;
float l9_515=0.0;
float4 l9_516=l9_514;
float l9_517=l9_516.x;
l9_515=l9_517;
float l9_518=0.0;
l9_518=l9_421*l9_515;
l9_107=l9_518;
l9_314=l9_107;
}
l9_104=l9_314;
param_14=l9_104;
param_16=param_14;
}
else
{
param_16=param_15;
}
Result_N37=param_16;
float Result_N39=0.0;
float param_18=0.0;
float param_19=(*sc_set2.UserUniforms).Port_Default_N039;
ssGlobals param_21=Globals;
float param_20;
if ((int(Tweak_N33_tmp)!=0))
{
float l9_519=0.0;
float l9_520=0.0;
float l9_521=(*sc_set2.UserUniforms).Port_Value1_N016;
float l9_522=0.0;
ssGlobals l9_523=param_21;
float2 l9_524=float2(0.0);
l9_524=l9_523.gScreenCoord;
float l9_525=0.0;
float l9_526=(*sc_set2.UserUniforms).tiling;
l9_525=l9_526;
float l9_527=0.0;
l9_527=(*sc_set2.UserUniforms).sc_Camera.aspect;
float l9_528=0.0;
l9_528=l9_525/l9_527;
float4 l9_529=float4(0.0);
l9_529=float4(l9_525,l9_528,l9_525,l9_525);
float2 l9_530=float2(0.0);
l9_530=((l9_524-(*sc_set2.UserUniforms).Port_Center_N001)*l9_529.xy)+(*sc_set2.UserUniforms).Port_Center_N001;
float l9_531=0.0;
float l9_532=(*sc_set2.UserUniforms).Tweak_N0;
l9_531=l9_532;
float l9_533=0.0;
float l9_534=(*sc_set2.UserUniforms).Tweak_N3;
l9_533=l9_534;
float4 l9_535=float4(0.0);
l9_535=float4(l9_531,l9_533,l9_531,l9_531);
float2 l9_536=float2(0.0);
l9_536=l9_530+(l9_535.xy*(l9_523.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N025));
float4 l9_537=float4(0.0);
int l9_538=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_539=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_539=0;
}
else
{
l9_539=in.varStereoViewID;
}
int l9_540=l9_539;
l9_538=1-l9_540;
}
else
{
int l9_541=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_541=0;
}
else
{
l9_541=in.varStereoViewID;
}
int l9_542=l9_541;
l9_538=l9_542;
}
int l9_543=l9_538;
int l9_544=baseTexLayout_tmp;
int l9_545=l9_543;
float2 l9_546=l9_536;
bool l9_547=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_548=(*sc_set2.UserUniforms).baseTexTransform;
int2 l9_549=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_550=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_551=(*sc_set2.UserUniforms).baseTexUvMinMax;
bool l9_552=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_553=(*sc_set2.UserUniforms).baseTexBorderColor;
float l9_554=0.0;
bool l9_555=l9_552&&(!l9_550);
float l9_556=1.0;
float l9_557=l9_546.x;
int l9_558=l9_549.x;
if (l9_558==1)
{
l9_557=fract(l9_557);
}
else
{
if (l9_558==2)
{
float l9_559=fract(l9_557);
float l9_560=l9_557-l9_559;
float l9_561=step(0.25,fract(l9_560*0.5));
l9_557=mix(l9_559,1.0-l9_559,fast::clamp(l9_561,0.0,1.0));
}
}
l9_546.x=l9_557;
float l9_562=l9_546.y;
int l9_563=l9_549.y;
if (l9_563==1)
{
l9_562=fract(l9_562);
}
else
{
if (l9_563==2)
{
float l9_564=fract(l9_562);
float l9_565=l9_562-l9_564;
float l9_566=step(0.25,fract(l9_565*0.5));
l9_562=mix(l9_564,1.0-l9_564,fast::clamp(l9_566,0.0,1.0));
}
}
l9_546.y=l9_562;
if (l9_550)
{
bool l9_567=l9_552;
bool l9_568;
if (l9_567)
{
l9_568=l9_549.x==3;
}
else
{
l9_568=l9_567;
}
float l9_569=l9_546.x;
float l9_570=l9_551.x;
float l9_571=l9_551.z;
bool l9_572=l9_568;
float l9_573=l9_556;
float l9_574=fast::clamp(l9_569,l9_570,l9_571);
float l9_575=step(abs(l9_569-l9_574),9.9999997e-06);
l9_573*=(l9_575+((1.0-float(l9_572))*(1.0-l9_575)));
l9_569=l9_574;
l9_546.x=l9_569;
l9_556=l9_573;
bool l9_576=l9_552;
bool l9_577;
if (l9_576)
{
l9_577=l9_549.y==3;
}
else
{
l9_577=l9_576;
}
float l9_578=l9_546.y;
float l9_579=l9_551.y;
float l9_580=l9_551.w;
bool l9_581=l9_577;
float l9_582=l9_556;
float l9_583=fast::clamp(l9_578,l9_579,l9_580);
float l9_584=step(abs(l9_578-l9_583),9.9999997e-06);
l9_582*=(l9_584+((1.0-float(l9_581))*(1.0-l9_584)));
l9_578=l9_583;
l9_546.y=l9_578;
l9_556=l9_582;
}
float2 l9_585=l9_546;
bool l9_586=l9_547;
float3x3 l9_587=l9_548;
if (l9_586)
{
l9_585=float2((l9_587*float3(l9_585,1.0)).xy);
}
float2 l9_588=l9_585;
float2 l9_589=l9_588;
float2 l9_590=l9_589;
l9_546=l9_590;
float l9_591=l9_546.x;
int l9_592=l9_549.x;
bool l9_593=l9_555;
float l9_594=l9_556;
if ((l9_592==0)||(l9_592==3))
{
float l9_595=l9_591;
float l9_596=0.0;
float l9_597=1.0;
bool l9_598=l9_593;
float l9_599=l9_594;
float l9_600=fast::clamp(l9_595,l9_596,l9_597);
float l9_601=step(abs(l9_595-l9_600),9.9999997e-06);
l9_599*=(l9_601+((1.0-float(l9_598))*(1.0-l9_601)));
l9_595=l9_600;
l9_591=l9_595;
l9_594=l9_599;
}
l9_546.x=l9_591;
l9_556=l9_594;
float l9_602=l9_546.y;
int l9_603=l9_549.y;
bool l9_604=l9_555;
float l9_605=l9_556;
if ((l9_603==0)||(l9_603==3))
{
float l9_606=l9_602;
float l9_607=0.0;
float l9_608=1.0;
bool l9_609=l9_604;
float l9_610=l9_605;
float l9_611=fast::clamp(l9_606,l9_607,l9_608);
float l9_612=step(abs(l9_606-l9_611),9.9999997e-06);
l9_610*=(l9_612+((1.0-float(l9_609))*(1.0-l9_612)));
l9_606=l9_611;
l9_602=l9_606;
l9_605=l9_610;
}
l9_546.y=l9_602;
l9_556=l9_605;
float2 l9_613=l9_546;
int l9_614=l9_544;
int l9_615=l9_545;
float l9_616=l9_554;
float2 l9_617=l9_613;
int l9_618=l9_614;
int l9_619=l9_615;
float3 l9_620=float3(0.0);
if (l9_618==0)
{
l9_620=float3(l9_617,0.0);
}
else
{
if (l9_618==1)
{
l9_620=float3(l9_617.x,(l9_617.y*0.5)+(0.5-(float(l9_619)*0.5)),0.0);
}
else
{
l9_620=float3(l9_617,float(l9_619));
}
}
float3 l9_621=l9_620;
float3 l9_622=l9_621;
float2 l9_623=l9_622.xy;
float l9_624=l9_616;
float4 l9_625=sc_set2.baseTex.sample(sc_set2.baseTexSmpSC,l9_623,bias(l9_624));
float4 l9_626=l9_625;
float4 l9_627=l9_626;
if (l9_552)
{
l9_627=mix(l9_553,l9_627,float4(l9_556));
}
float4 l9_628=l9_627;
l9_537=l9_628;
float l9_629=0.0;
l9_629=l9_537.w;
float l9_630=0.0;
l9_630=l9_629;
float4 l9_631=float4(0.0);
int l9_632=0;
if ((int(Tweak_N5HasSwappedViews_tmp)!=0))
{
int l9_633=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_633=0;
}
else
{
l9_633=in.varStereoViewID;
}
int l9_634=l9_633;
l9_632=1-l9_634;
}
else
{
int l9_635=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_635=0;
}
else
{
l9_635=in.varStereoViewID;
}
int l9_636=l9_635;
l9_632=l9_636;
}
int l9_637=l9_632;
int l9_638=Tweak_N5Layout_tmp;
int l9_639=l9_637;
float2 l9_640=l9_523.Surface_UVCoord0;
bool l9_641=(int(SC_USE_UV_TRANSFORM_Tweak_N5_tmp)!=0);
float3x3 l9_642=(*sc_set2.UserUniforms).Tweak_N5Transform;
int2 l9_643=int2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N5_tmp,SC_SOFTWARE_WRAP_MODE_V_Tweak_N5_tmp);
bool l9_644=(int(SC_USE_UV_MIN_MAX_Tweak_N5_tmp)!=0);
float4 l9_645=(*sc_set2.UserUniforms).Tweak_N5UvMinMax;
bool l9_646=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N5_tmp)!=0);
float4 l9_647=(*sc_set2.UserUniforms).Tweak_N5BorderColor;
float l9_648=0.0;
bool l9_649=l9_646&&(!l9_644);
float l9_650=1.0;
float l9_651=l9_640.x;
int l9_652=l9_643.x;
if (l9_652==1)
{
l9_651=fract(l9_651);
}
else
{
if (l9_652==2)
{
float l9_653=fract(l9_651);
float l9_654=l9_651-l9_653;
float l9_655=step(0.25,fract(l9_654*0.5));
l9_651=mix(l9_653,1.0-l9_653,fast::clamp(l9_655,0.0,1.0));
}
}
l9_640.x=l9_651;
float l9_656=l9_640.y;
int l9_657=l9_643.y;
if (l9_657==1)
{
l9_656=fract(l9_656);
}
else
{
if (l9_657==2)
{
float l9_658=fract(l9_656);
float l9_659=l9_656-l9_658;
float l9_660=step(0.25,fract(l9_659*0.5));
l9_656=mix(l9_658,1.0-l9_658,fast::clamp(l9_660,0.0,1.0));
}
}
l9_640.y=l9_656;
if (l9_644)
{
bool l9_661=l9_646;
bool l9_662;
if (l9_661)
{
l9_662=l9_643.x==3;
}
else
{
l9_662=l9_661;
}
float l9_663=l9_640.x;
float l9_664=l9_645.x;
float l9_665=l9_645.z;
bool l9_666=l9_662;
float l9_667=l9_650;
float l9_668=fast::clamp(l9_663,l9_664,l9_665);
float l9_669=step(abs(l9_663-l9_668),9.9999997e-06);
l9_667*=(l9_669+((1.0-float(l9_666))*(1.0-l9_669)));
l9_663=l9_668;
l9_640.x=l9_663;
l9_650=l9_667;
bool l9_670=l9_646;
bool l9_671;
if (l9_670)
{
l9_671=l9_643.y==3;
}
else
{
l9_671=l9_670;
}
float l9_672=l9_640.y;
float l9_673=l9_645.y;
float l9_674=l9_645.w;
bool l9_675=l9_671;
float l9_676=l9_650;
float l9_677=fast::clamp(l9_672,l9_673,l9_674);
float l9_678=step(abs(l9_672-l9_677),9.9999997e-06);
l9_676*=(l9_678+((1.0-float(l9_675))*(1.0-l9_678)));
l9_672=l9_677;
l9_640.y=l9_672;
l9_650=l9_676;
}
float2 l9_679=l9_640;
bool l9_680=l9_641;
float3x3 l9_681=l9_642;
if (l9_680)
{
l9_679=float2((l9_681*float3(l9_679,1.0)).xy);
}
float2 l9_682=l9_679;
float2 l9_683=l9_682;
float2 l9_684=l9_683;
l9_640=l9_684;
float l9_685=l9_640.x;
int l9_686=l9_643.x;
bool l9_687=l9_649;
float l9_688=l9_650;
if ((l9_686==0)||(l9_686==3))
{
float l9_689=l9_685;
float l9_690=0.0;
float l9_691=1.0;
bool l9_692=l9_687;
float l9_693=l9_688;
float l9_694=fast::clamp(l9_689,l9_690,l9_691);
float l9_695=step(abs(l9_689-l9_694),9.9999997e-06);
l9_693*=(l9_695+((1.0-float(l9_692))*(1.0-l9_695)));
l9_689=l9_694;
l9_685=l9_689;
l9_688=l9_693;
}
l9_640.x=l9_685;
l9_650=l9_688;
float l9_696=l9_640.y;
int l9_697=l9_643.y;
bool l9_698=l9_649;
float l9_699=l9_650;
if ((l9_697==0)||(l9_697==3))
{
float l9_700=l9_696;
float l9_701=0.0;
float l9_702=1.0;
bool l9_703=l9_698;
float l9_704=l9_699;
float l9_705=fast::clamp(l9_700,l9_701,l9_702);
float l9_706=step(abs(l9_700-l9_705),9.9999997e-06);
l9_704*=(l9_706+((1.0-float(l9_703))*(1.0-l9_706)));
l9_700=l9_705;
l9_696=l9_700;
l9_699=l9_704;
}
l9_640.y=l9_696;
l9_650=l9_699;
float2 l9_707=l9_640;
int l9_708=l9_638;
int l9_709=l9_639;
float l9_710=l9_648;
float2 l9_711=l9_707;
int l9_712=l9_708;
int l9_713=l9_709;
float3 l9_714=float3(0.0);
if (l9_712==0)
{
l9_714=float3(l9_711,0.0);
}
else
{
if (l9_712==1)
{
l9_714=float3(l9_711.x,(l9_711.y*0.5)+(0.5-(float(l9_713)*0.5)),0.0);
}
else
{
l9_714=float3(l9_711,float(l9_713));
}
}
float3 l9_715=l9_714;
float3 l9_716=l9_715;
float2 l9_717=l9_716.xy;
float l9_718=l9_710;
float4 l9_719=sc_set2.Tweak_N5.sample(sc_set2.Tweak_N5SmpSC,l9_717,bias(l9_718));
float4 l9_720=l9_719;
float4 l9_721=l9_720;
if (l9_646)
{
l9_721=mix(l9_647,l9_721,float4(l9_650));
}
float4 l9_722=l9_721;
l9_631=l9_722;
float4 l9_723=float4(0.0);
l9_723=l9_631;
float l9_724=0.0;
float4 l9_725=l9_723;
float l9_726=l9_725.y;
l9_724=l9_726;
float l9_727=0.0;
l9_727=l9_630*l9_724;
float l9_728=0.0;
l9_728=float(l9_727<=(*sc_set2.UserUniforms).Port_Input1_N015);
l9_520=l9_728;
float l9_729;
if ((l9_520*1.0)!=0.0)
{
l9_729=l9_521;
}
else
{
float2 l9_730=float2(0.0);
l9_730=l9_523.gScreenCoord;
float l9_731=0.0;
float l9_732=(*sc_set2.UserUniforms).tiling;
l9_731=l9_732;
float l9_733=0.0;
l9_733=(*sc_set2.UserUniforms).sc_Camera.aspect;
float l9_734=0.0;
l9_734=l9_731/l9_733;
float4 l9_735=float4(0.0);
l9_735=float4(l9_731,l9_734,l9_731,l9_731);
float2 l9_736=float2(0.0);
l9_736=((l9_730-(*sc_set2.UserUniforms).Port_Center_N001)*l9_735.xy)+(*sc_set2.UserUniforms).Port_Center_N001;
float l9_737=0.0;
float l9_738=(*sc_set2.UserUniforms).Tweak_N0;
l9_737=l9_738;
float l9_739=0.0;
float l9_740=(*sc_set2.UserUniforms).Tweak_N3;
l9_739=l9_740;
float4 l9_741=float4(0.0);
l9_741=float4(l9_737,l9_739,l9_737,l9_737);
float2 l9_742=float2(0.0);
l9_742=l9_736+(l9_741.xy*(l9_523.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N025));
float4 l9_743=float4(0.0);
int l9_744=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_745=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_745=0;
}
else
{
l9_745=in.varStereoViewID;
}
int l9_746=l9_745;
l9_744=1-l9_746;
}
else
{
int l9_747=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_747=0;
}
else
{
l9_747=in.varStereoViewID;
}
int l9_748=l9_747;
l9_744=l9_748;
}
int l9_749=l9_744;
int l9_750=baseTexLayout_tmp;
int l9_751=l9_749;
float2 l9_752=l9_742;
bool l9_753=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_754=(*sc_set2.UserUniforms).baseTexTransform;
int2 l9_755=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_756=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_757=(*sc_set2.UserUniforms).baseTexUvMinMax;
bool l9_758=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_759=(*sc_set2.UserUniforms).baseTexBorderColor;
float l9_760=0.0;
bool l9_761=l9_758&&(!l9_756);
float l9_762=1.0;
float l9_763=l9_752.x;
int l9_764=l9_755.x;
if (l9_764==1)
{
l9_763=fract(l9_763);
}
else
{
if (l9_764==2)
{
float l9_765=fract(l9_763);
float l9_766=l9_763-l9_765;
float l9_767=step(0.25,fract(l9_766*0.5));
l9_763=mix(l9_765,1.0-l9_765,fast::clamp(l9_767,0.0,1.0));
}
}
l9_752.x=l9_763;
float l9_768=l9_752.y;
int l9_769=l9_755.y;
if (l9_769==1)
{
l9_768=fract(l9_768);
}
else
{
if (l9_769==2)
{
float l9_770=fract(l9_768);
float l9_771=l9_768-l9_770;
float l9_772=step(0.25,fract(l9_771*0.5));
l9_768=mix(l9_770,1.0-l9_770,fast::clamp(l9_772,0.0,1.0));
}
}
l9_752.y=l9_768;
if (l9_756)
{
bool l9_773=l9_758;
bool l9_774;
if (l9_773)
{
l9_774=l9_755.x==3;
}
else
{
l9_774=l9_773;
}
float l9_775=l9_752.x;
float l9_776=l9_757.x;
float l9_777=l9_757.z;
bool l9_778=l9_774;
float l9_779=l9_762;
float l9_780=fast::clamp(l9_775,l9_776,l9_777);
float l9_781=step(abs(l9_775-l9_780),9.9999997e-06);
l9_779*=(l9_781+((1.0-float(l9_778))*(1.0-l9_781)));
l9_775=l9_780;
l9_752.x=l9_775;
l9_762=l9_779;
bool l9_782=l9_758;
bool l9_783;
if (l9_782)
{
l9_783=l9_755.y==3;
}
else
{
l9_783=l9_782;
}
float l9_784=l9_752.y;
float l9_785=l9_757.y;
float l9_786=l9_757.w;
bool l9_787=l9_783;
float l9_788=l9_762;
float l9_789=fast::clamp(l9_784,l9_785,l9_786);
float l9_790=step(abs(l9_784-l9_789),9.9999997e-06);
l9_788*=(l9_790+((1.0-float(l9_787))*(1.0-l9_790)));
l9_784=l9_789;
l9_752.y=l9_784;
l9_762=l9_788;
}
float2 l9_791=l9_752;
bool l9_792=l9_753;
float3x3 l9_793=l9_754;
if (l9_792)
{
l9_791=float2((l9_793*float3(l9_791,1.0)).xy);
}
float2 l9_794=l9_791;
float2 l9_795=l9_794;
float2 l9_796=l9_795;
l9_752=l9_796;
float l9_797=l9_752.x;
int l9_798=l9_755.x;
bool l9_799=l9_761;
float l9_800=l9_762;
if ((l9_798==0)||(l9_798==3))
{
float l9_801=l9_797;
float l9_802=0.0;
float l9_803=1.0;
bool l9_804=l9_799;
float l9_805=l9_800;
float l9_806=fast::clamp(l9_801,l9_802,l9_803);
float l9_807=step(abs(l9_801-l9_806),9.9999997e-06);
l9_805*=(l9_807+((1.0-float(l9_804))*(1.0-l9_807)));
l9_801=l9_806;
l9_797=l9_801;
l9_800=l9_805;
}
l9_752.x=l9_797;
l9_762=l9_800;
float l9_808=l9_752.y;
int l9_809=l9_755.y;
bool l9_810=l9_761;
float l9_811=l9_762;
if ((l9_809==0)||(l9_809==3))
{
float l9_812=l9_808;
float l9_813=0.0;
float l9_814=1.0;
bool l9_815=l9_810;
float l9_816=l9_811;
float l9_817=fast::clamp(l9_812,l9_813,l9_814);
float l9_818=step(abs(l9_812-l9_817),9.9999997e-06);
l9_816*=(l9_818+((1.0-float(l9_815))*(1.0-l9_818)));
l9_812=l9_817;
l9_808=l9_812;
l9_811=l9_816;
}
l9_752.y=l9_808;
l9_762=l9_811;
float2 l9_819=l9_752;
int l9_820=l9_750;
int l9_821=l9_751;
float l9_822=l9_760;
float2 l9_823=l9_819;
int l9_824=l9_820;
int l9_825=l9_821;
float3 l9_826=float3(0.0);
if (l9_824==0)
{
l9_826=float3(l9_823,0.0);
}
else
{
if (l9_824==1)
{
l9_826=float3(l9_823.x,(l9_823.y*0.5)+(0.5-(float(l9_825)*0.5)),0.0);
}
else
{
l9_826=float3(l9_823,float(l9_825));
}
}
float3 l9_827=l9_826;
float3 l9_828=l9_827;
float2 l9_829=l9_828.xy;
float l9_830=l9_822;
float4 l9_831=sc_set2.baseTex.sample(sc_set2.baseTexSmpSC,l9_829,bias(l9_830));
float4 l9_832=l9_831;
float4 l9_833=l9_832;
if (l9_758)
{
l9_833=mix(l9_759,l9_833,float4(l9_762));
}
float4 l9_834=l9_833;
l9_743=l9_834;
float l9_835=0.0;
l9_835=l9_743.w;
float l9_836=0.0;
l9_836=l9_835;
float4 l9_837=float4(0.0);
int l9_838=0;
if ((int(Tweak_N5HasSwappedViews_tmp)!=0))
{
int l9_839=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_839=0;
}
else
{
l9_839=in.varStereoViewID;
}
int l9_840=l9_839;
l9_838=1-l9_840;
}
else
{
int l9_841=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_841=0;
}
else
{
l9_841=in.varStereoViewID;
}
int l9_842=l9_841;
l9_838=l9_842;
}
int l9_843=l9_838;
int l9_844=Tweak_N5Layout_tmp;
int l9_845=l9_843;
float2 l9_846=l9_523.Surface_UVCoord0;
bool l9_847=(int(SC_USE_UV_TRANSFORM_Tweak_N5_tmp)!=0);
float3x3 l9_848=(*sc_set2.UserUniforms).Tweak_N5Transform;
int2 l9_849=int2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N5_tmp,SC_SOFTWARE_WRAP_MODE_V_Tweak_N5_tmp);
bool l9_850=(int(SC_USE_UV_MIN_MAX_Tweak_N5_tmp)!=0);
float4 l9_851=(*sc_set2.UserUniforms).Tweak_N5UvMinMax;
bool l9_852=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N5_tmp)!=0);
float4 l9_853=(*sc_set2.UserUniforms).Tweak_N5BorderColor;
float l9_854=0.0;
bool l9_855=l9_852&&(!l9_850);
float l9_856=1.0;
float l9_857=l9_846.x;
int l9_858=l9_849.x;
if (l9_858==1)
{
l9_857=fract(l9_857);
}
else
{
if (l9_858==2)
{
float l9_859=fract(l9_857);
float l9_860=l9_857-l9_859;
float l9_861=step(0.25,fract(l9_860*0.5));
l9_857=mix(l9_859,1.0-l9_859,fast::clamp(l9_861,0.0,1.0));
}
}
l9_846.x=l9_857;
float l9_862=l9_846.y;
int l9_863=l9_849.y;
if (l9_863==1)
{
l9_862=fract(l9_862);
}
else
{
if (l9_863==2)
{
float l9_864=fract(l9_862);
float l9_865=l9_862-l9_864;
float l9_866=step(0.25,fract(l9_865*0.5));
l9_862=mix(l9_864,1.0-l9_864,fast::clamp(l9_866,0.0,1.0));
}
}
l9_846.y=l9_862;
if (l9_850)
{
bool l9_867=l9_852;
bool l9_868;
if (l9_867)
{
l9_868=l9_849.x==3;
}
else
{
l9_868=l9_867;
}
float l9_869=l9_846.x;
float l9_870=l9_851.x;
float l9_871=l9_851.z;
bool l9_872=l9_868;
float l9_873=l9_856;
float l9_874=fast::clamp(l9_869,l9_870,l9_871);
float l9_875=step(abs(l9_869-l9_874),9.9999997e-06);
l9_873*=(l9_875+((1.0-float(l9_872))*(1.0-l9_875)));
l9_869=l9_874;
l9_846.x=l9_869;
l9_856=l9_873;
bool l9_876=l9_852;
bool l9_877;
if (l9_876)
{
l9_877=l9_849.y==3;
}
else
{
l9_877=l9_876;
}
float l9_878=l9_846.y;
float l9_879=l9_851.y;
float l9_880=l9_851.w;
bool l9_881=l9_877;
float l9_882=l9_856;
float l9_883=fast::clamp(l9_878,l9_879,l9_880);
float l9_884=step(abs(l9_878-l9_883),9.9999997e-06);
l9_882*=(l9_884+((1.0-float(l9_881))*(1.0-l9_884)));
l9_878=l9_883;
l9_846.y=l9_878;
l9_856=l9_882;
}
float2 l9_885=l9_846;
bool l9_886=l9_847;
float3x3 l9_887=l9_848;
if (l9_886)
{
l9_885=float2((l9_887*float3(l9_885,1.0)).xy);
}
float2 l9_888=l9_885;
float2 l9_889=l9_888;
float2 l9_890=l9_889;
l9_846=l9_890;
float l9_891=l9_846.x;
int l9_892=l9_849.x;
bool l9_893=l9_855;
float l9_894=l9_856;
if ((l9_892==0)||(l9_892==3))
{
float l9_895=l9_891;
float l9_896=0.0;
float l9_897=1.0;
bool l9_898=l9_893;
float l9_899=l9_894;
float l9_900=fast::clamp(l9_895,l9_896,l9_897);
float l9_901=step(abs(l9_895-l9_900),9.9999997e-06);
l9_899*=(l9_901+((1.0-float(l9_898))*(1.0-l9_901)));
l9_895=l9_900;
l9_891=l9_895;
l9_894=l9_899;
}
l9_846.x=l9_891;
l9_856=l9_894;
float l9_902=l9_846.y;
int l9_903=l9_849.y;
bool l9_904=l9_855;
float l9_905=l9_856;
if ((l9_903==0)||(l9_903==3))
{
float l9_906=l9_902;
float l9_907=0.0;
float l9_908=1.0;
bool l9_909=l9_904;
float l9_910=l9_905;
float l9_911=fast::clamp(l9_906,l9_907,l9_908);
float l9_912=step(abs(l9_906-l9_911),9.9999997e-06);
l9_910*=(l9_912+((1.0-float(l9_909))*(1.0-l9_912)));
l9_906=l9_911;
l9_902=l9_906;
l9_905=l9_910;
}
l9_846.y=l9_902;
l9_856=l9_905;
float2 l9_913=l9_846;
int l9_914=l9_844;
int l9_915=l9_845;
float l9_916=l9_854;
float2 l9_917=l9_913;
int l9_918=l9_914;
int l9_919=l9_915;
float3 l9_920=float3(0.0);
if (l9_918==0)
{
l9_920=float3(l9_917,0.0);
}
else
{
if (l9_918==1)
{
l9_920=float3(l9_917.x,(l9_917.y*0.5)+(0.5-(float(l9_919)*0.5)),0.0);
}
else
{
l9_920=float3(l9_917,float(l9_919));
}
}
float3 l9_921=l9_920;
float3 l9_922=l9_921;
float2 l9_923=l9_922.xy;
float l9_924=l9_916;
float4 l9_925=sc_set2.Tweak_N5.sample(sc_set2.Tweak_N5SmpSC,l9_923,bias(l9_924));
float4 l9_926=l9_925;
float4 l9_927=l9_926;
if (l9_852)
{
l9_927=mix(l9_853,l9_927,float4(l9_856));
}
float4 l9_928=l9_927;
l9_837=l9_928;
float4 l9_929=float4(0.0);
l9_929=l9_837;
float l9_930=0.0;
float4 l9_931=l9_929;
float l9_932=l9_931.y;
l9_930=l9_932;
float l9_933=0.0;
l9_933=l9_836*l9_930;
l9_522=l9_933;
l9_729=l9_522;
}
l9_519=l9_729;
param_18=l9_519;
param_20=param_18;
}
else
{
param_20=param_19;
}
Result_N39=param_20;
float Result_N52=0.0;
float param_22=0.0;
float param_23=(*sc_set2.UserUniforms).Port_Default_N052;
ssGlobals param_25=Globals;
float param_24;
if ((int(Tweak_N34_tmp)!=0))
{
float l9_934=0.0;
float l9_935=0.0;
float l9_936=(*sc_set2.UserUniforms).Port_Value1_N019;
float l9_937=0.0;
ssGlobals l9_938=param_25;
float2 l9_939=float2(0.0);
l9_939=l9_938.gScreenCoord;
float l9_940=0.0;
float l9_941=(*sc_set2.UserUniforms).tiling;
l9_940=l9_941;
float l9_942=0.0;
l9_942=(*sc_set2.UserUniforms).sc_Camera.aspect;
float l9_943=0.0;
l9_943=l9_940/l9_942;
float4 l9_944=float4(0.0);
l9_944=float4(l9_940,l9_943,l9_940,l9_940);
float2 l9_945=float2(0.0);
l9_945=((l9_939-(*sc_set2.UserUniforms).Port_Center_N001)*l9_944.xy)+(*sc_set2.UserUniforms).Port_Center_N001;
float l9_946=0.0;
float l9_947=(*sc_set2.UserUniforms).Tweak_N0;
l9_946=l9_947;
float l9_948=0.0;
float l9_949=(*sc_set2.UserUniforms).Tweak_N3;
l9_948=l9_949;
float4 l9_950=float4(0.0);
l9_950=float4(l9_946,l9_948,l9_946,l9_946);
float2 l9_951=float2(0.0);
l9_951=l9_945+(l9_950.xy*(l9_938.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N025));
float4 l9_952=float4(0.0);
int l9_953=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_954=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_954=0;
}
else
{
l9_954=in.varStereoViewID;
}
int l9_955=l9_954;
l9_953=1-l9_955;
}
else
{
int l9_956=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_956=0;
}
else
{
l9_956=in.varStereoViewID;
}
int l9_957=l9_956;
l9_953=l9_957;
}
int l9_958=l9_953;
int l9_959=baseTexLayout_tmp;
int l9_960=l9_958;
float2 l9_961=l9_951;
bool l9_962=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_963=(*sc_set2.UserUniforms).baseTexTransform;
int2 l9_964=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_965=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_966=(*sc_set2.UserUniforms).baseTexUvMinMax;
bool l9_967=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_968=(*sc_set2.UserUniforms).baseTexBorderColor;
float l9_969=0.0;
bool l9_970=l9_967&&(!l9_965);
float l9_971=1.0;
float l9_972=l9_961.x;
int l9_973=l9_964.x;
if (l9_973==1)
{
l9_972=fract(l9_972);
}
else
{
if (l9_973==2)
{
float l9_974=fract(l9_972);
float l9_975=l9_972-l9_974;
float l9_976=step(0.25,fract(l9_975*0.5));
l9_972=mix(l9_974,1.0-l9_974,fast::clamp(l9_976,0.0,1.0));
}
}
l9_961.x=l9_972;
float l9_977=l9_961.y;
int l9_978=l9_964.y;
if (l9_978==1)
{
l9_977=fract(l9_977);
}
else
{
if (l9_978==2)
{
float l9_979=fract(l9_977);
float l9_980=l9_977-l9_979;
float l9_981=step(0.25,fract(l9_980*0.5));
l9_977=mix(l9_979,1.0-l9_979,fast::clamp(l9_981,0.0,1.0));
}
}
l9_961.y=l9_977;
if (l9_965)
{
bool l9_982=l9_967;
bool l9_983;
if (l9_982)
{
l9_983=l9_964.x==3;
}
else
{
l9_983=l9_982;
}
float l9_984=l9_961.x;
float l9_985=l9_966.x;
float l9_986=l9_966.z;
bool l9_987=l9_983;
float l9_988=l9_971;
float l9_989=fast::clamp(l9_984,l9_985,l9_986);
float l9_990=step(abs(l9_984-l9_989),9.9999997e-06);
l9_988*=(l9_990+((1.0-float(l9_987))*(1.0-l9_990)));
l9_984=l9_989;
l9_961.x=l9_984;
l9_971=l9_988;
bool l9_991=l9_967;
bool l9_992;
if (l9_991)
{
l9_992=l9_964.y==3;
}
else
{
l9_992=l9_991;
}
float l9_993=l9_961.y;
float l9_994=l9_966.y;
float l9_995=l9_966.w;
bool l9_996=l9_992;
float l9_997=l9_971;
float l9_998=fast::clamp(l9_993,l9_994,l9_995);
float l9_999=step(abs(l9_993-l9_998),9.9999997e-06);
l9_997*=(l9_999+((1.0-float(l9_996))*(1.0-l9_999)));
l9_993=l9_998;
l9_961.y=l9_993;
l9_971=l9_997;
}
float2 l9_1000=l9_961;
bool l9_1001=l9_962;
float3x3 l9_1002=l9_963;
if (l9_1001)
{
l9_1000=float2((l9_1002*float3(l9_1000,1.0)).xy);
}
float2 l9_1003=l9_1000;
float2 l9_1004=l9_1003;
float2 l9_1005=l9_1004;
l9_961=l9_1005;
float l9_1006=l9_961.x;
int l9_1007=l9_964.x;
bool l9_1008=l9_970;
float l9_1009=l9_971;
if ((l9_1007==0)||(l9_1007==3))
{
float l9_1010=l9_1006;
float l9_1011=0.0;
float l9_1012=1.0;
bool l9_1013=l9_1008;
float l9_1014=l9_1009;
float l9_1015=fast::clamp(l9_1010,l9_1011,l9_1012);
float l9_1016=step(abs(l9_1010-l9_1015),9.9999997e-06);
l9_1014*=(l9_1016+((1.0-float(l9_1013))*(1.0-l9_1016)));
l9_1010=l9_1015;
l9_1006=l9_1010;
l9_1009=l9_1014;
}
l9_961.x=l9_1006;
l9_971=l9_1009;
float l9_1017=l9_961.y;
int l9_1018=l9_964.y;
bool l9_1019=l9_970;
float l9_1020=l9_971;
if ((l9_1018==0)||(l9_1018==3))
{
float l9_1021=l9_1017;
float l9_1022=0.0;
float l9_1023=1.0;
bool l9_1024=l9_1019;
float l9_1025=l9_1020;
float l9_1026=fast::clamp(l9_1021,l9_1022,l9_1023);
float l9_1027=step(abs(l9_1021-l9_1026),9.9999997e-06);
l9_1025*=(l9_1027+((1.0-float(l9_1024))*(1.0-l9_1027)));
l9_1021=l9_1026;
l9_1017=l9_1021;
l9_1020=l9_1025;
}
l9_961.y=l9_1017;
l9_971=l9_1020;
float2 l9_1028=l9_961;
int l9_1029=l9_959;
int l9_1030=l9_960;
float l9_1031=l9_969;
float2 l9_1032=l9_1028;
int l9_1033=l9_1029;
int l9_1034=l9_1030;
float3 l9_1035=float3(0.0);
if (l9_1033==0)
{
l9_1035=float3(l9_1032,0.0);
}
else
{
if (l9_1033==1)
{
l9_1035=float3(l9_1032.x,(l9_1032.y*0.5)+(0.5-(float(l9_1034)*0.5)),0.0);
}
else
{
l9_1035=float3(l9_1032,float(l9_1034));
}
}
float3 l9_1036=l9_1035;
float3 l9_1037=l9_1036;
float2 l9_1038=l9_1037.xy;
float l9_1039=l9_1031;
float4 l9_1040=sc_set2.baseTex.sample(sc_set2.baseTexSmpSC,l9_1038,bias(l9_1039));
float4 l9_1041=l9_1040;
float4 l9_1042=l9_1041;
if (l9_967)
{
l9_1042=mix(l9_968,l9_1042,float4(l9_971));
}
float4 l9_1043=l9_1042;
l9_952=l9_1043;
float l9_1044=0.0;
l9_1044=l9_952.w;
float l9_1045=0.0;
l9_1045=l9_1044;
float4 l9_1046=float4(0.0);
int l9_1047=0;
if ((int(Tweak_N5HasSwappedViews_tmp)!=0))
{
int l9_1048=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1048=0;
}
else
{
l9_1048=in.varStereoViewID;
}
int l9_1049=l9_1048;
l9_1047=1-l9_1049;
}
else
{
int l9_1050=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1050=0;
}
else
{
l9_1050=in.varStereoViewID;
}
int l9_1051=l9_1050;
l9_1047=l9_1051;
}
int l9_1052=l9_1047;
int l9_1053=Tweak_N5Layout_tmp;
int l9_1054=l9_1052;
float2 l9_1055=l9_938.Surface_UVCoord0;
bool l9_1056=(int(SC_USE_UV_TRANSFORM_Tweak_N5_tmp)!=0);
float3x3 l9_1057=(*sc_set2.UserUniforms).Tweak_N5Transform;
int2 l9_1058=int2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N5_tmp,SC_SOFTWARE_WRAP_MODE_V_Tweak_N5_tmp);
bool l9_1059=(int(SC_USE_UV_MIN_MAX_Tweak_N5_tmp)!=0);
float4 l9_1060=(*sc_set2.UserUniforms).Tweak_N5UvMinMax;
bool l9_1061=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N5_tmp)!=0);
float4 l9_1062=(*sc_set2.UserUniforms).Tweak_N5BorderColor;
float l9_1063=0.0;
bool l9_1064=l9_1061&&(!l9_1059);
float l9_1065=1.0;
float l9_1066=l9_1055.x;
int l9_1067=l9_1058.x;
if (l9_1067==1)
{
l9_1066=fract(l9_1066);
}
else
{
if (l9_1067==2)
{
float l9_1068=fract(l9_1066);
float l9_1069=l9_1066-l9_1068;
float l9_1070=step(0.25,fract(l9_1069*0.5));
l9_1066=mix(l9_1068,1.0-l9_1068,fast::clamp(l9_1070,0.0,1.0));
}
}
l9_1055.x=l9_1066;
float l9_1071=l9_1055.y;
int l9_1072=l9_1058.y;
if (l9_1072==1)
{
l9_1071=fract(l9_1071);
}
else
{
if (l9_1072==2)
{
float l9_1073=fract(l9_1071);
float l9_1074=l9_1071-l9_1073;
float l9_1075=step(0.25,fract(l9_1074*0.5));
l9_1071=mix(l9_1073,1.0-l9_1073,fast::clamp(l9_1075,0.0,1.0));
}
}
l9_1055.y=l9_1071;
if (l9_1059)
{
bool l9_1076=l9_1061;
bool l9_1077;
if (l9_1076)
{
l9_1077=l9_1058.x==3;
}
else
{
l9_1077=l9_1076;
}
float l9_1078=l9_1055.x;
float l9_1079=l9_1060.x;
float l9_1080=l9_1060.z;
bool l9_1081=l9_1077;
float l9_1082=l9_1065;
float l9_1083=fast::clamp(l9_1078,l9_1079,l9_1080);
float l9_1084=step(abs(l9_1078-l9_1083),9.9999997e-06);
l9_1082*=(l9_1084+((1.0-float(l9_1081))*(1.0-l9_1084)));
l9_1078=l9_1083;
l9_1055.x=l9_1078;
l9_1065=l9_1082;
bool l9_1085=l9_1061;
bool l9_1086;
if (l9_1085)
{
l9_1086=l9_1058.y==3;
}
else
{
l9_1086=l9_1085;
}
float l9_1087=l9_1055.y;
float l9_1088=l9_1060.y;
float l9_1089=l9_1060.w;
bool l9_1090=l9_1086;
float l9_1091=l9_1065;
float l9_1092=fast::clamp(l9_1087,l9_1088,l9_1089);
float l9_1093=step(abs(l9_1087-l9_1092),9.9999997e-06);
l9_1091*=(l9_1093+((1.0-float(l9_1090))*(1.0-l9_1093)));
l9_1087=l9_1092;
l9_1055.y=l9_1087;
l9_1065=l9_1091;
}
float2 l9_1094=l9_1055;
bool l9_1095=l9_1056;
float3x3 l9_1096=l9_1057;
if (l9_1095)
{
l9_1094=float2((l9_1096*float3(l9_1094,1.0)).xy);
}
float2 l9_1097=l9_1094;
float2 l9_1098=l9_1097;
float2 l9_1099=l9_1098;
l9_1055=l9_1099;
float l9_1100=l9_1055.x;
int l9_1101=l9_1058.x;
bool l9_1102=l9_1064;
float l9_1103=l9_1065;
if ((l9_1101==0)||(l9_1101==3))
{
float l9_1104=l9_1100;
float l9_1105=0.0;
float l9_1106=1.0;
bool l9_1107=l9_1102;
float l9_1108=l9_1103;
float l9_1109=fast::clamp(l9_1104,l9_1105,l9_1106);
float l9_1110=step(abs(l9_1104-l9_1109),9.9999997e-06);
l9_1108*=(l9_1110+((1.0-float(l9_1107))*(1.0-l9_1110)));
l9_1104=l9_1109;
l9_1100=l9_1104;
l9_1103=l9_1108;
}
l9_1055.x=l9_1100;
l9_1065=l9_1103;
float l9_1111=l9_1055.y;
int l9_1112=l9_1058.y;
bool l9_1113=l9_1064;
float l9_1114=l9_1065;
if ((l9_1112==0)||(l9_1112==3))
{
float l9_1115=l9_1111;
float l9_1116=0.0;
float l9_1117=1.0;
bool l9_1118=l9_1113;
float l9_1119=l9_1114;
float l9_1120=fast::clamp(l9_1115,l9_1116,l9_1117);
float l9_1121=step(abs(l9_1115-l9_1120),9.9999997e-06);
l9_1119*=(l9_1121+((1.0-float(l9_1118))*(1.0-l9_1121)));
l9_1115=l9_1120;
l9_1111=l9_1115;
l9_1114=l9_1119;
}
l9_1055.y=l9_1111;
l9_1065=l9_1114;
float2 l9_1122=l9_1055;
int l9_1123=l9_1053;
int l9_1124=l9_1054;
float l9_1125=l9_1063;
float2 l9_1126=l9_1122;
int l9_1127=l9_1123;
int l9_1128=l9_1124;
float3 l9_1129=float3(0.0);
if (l9_1127==0)
{
l9_1129=float3(l9_1126,0.0);
}
else
{
if (l9_1127==1)
{
l9_1129=float3(l9_1126.x,(l9_1126.y*0.5)+(0.5-(float(l9_1128)*0.5)),0.0);
}
else
{
l9_1129=float3(l9_1126,float(l9_1128));
}
}
float3 l9_1130=l9_1129;
float3 l9_1131=l9_1130;
float2 l9_1132=l9_1131.xy;
float l9_1133=l9_1125;
float4 l9_1134=sc_set2.Tweak_N5.sample(sc_set2.Tweak_N5SmpSC,l9_1132,bias(l9_1133));
float4 l9_1135=l9_1134;
float4 l9_1136=l9_1135;
if (l9_1061)
{
l9_1136=mix(l9_1062,l9_1136,float4(l9_1065));
}
float4 l9_1137=l9_1136;
l9_1046=l9_1137;
float4 l9_1138=float4(0.0);
l9_1138=l9_1046;
float l9_1139=0.0;
float4 l9_1140=l9_1138;
float l9_1141=l9_1140.z;
l9_1139=l9_1141;
float l9_1142=0.0;
l9_1142=l9_1045*l9_1139;
float l9_1143=0.0;
l9_1143=float(l9_1142<=(*sc_set2.UserUniforms).Port_Input1_N018);
l9_935=l9_1143;
float l9_1144;
if ((l9_935*1.0)!=0.0)
{
l9_1144=l9_936;
}
else
{
float2 l9_1145=float2(0.0);
l9_1145=l9_938.gScreenCoord;
float l9_1146=0.0;
float l9_1147=(*sc_set2.UserUniforms).tiling;
l9_1146=l9_1147;
float l9_1148=0.0;
l9_1148=(*sc_set2.UserUniforms).sc_Camera.aspect;
float l9_1149=0.0;
l9_1149=l9_1146/l9_1148;
float4 l9_1150=float4(0.0);
l9_1150=float4(l9_1146,l9_1149,l9_1146,l9_1146);
float2 l9_1151=float2(0.0);
l9_1151=((l9_1145-(*sc_set2.UserUniforms).Port_Center_N001)*l9_1150.xy)+(*sc_set2.UserUniforms).Port_Center_N001;
float l9_1152=0.0;
float l9_1153=(*sc_set2.UserUniforms).Tweak_N0;
l9_1152=l9_1153;
float l9_1154=0.0;
float l9_1155=(*sc_set2.UserUniforms).Tweak_N3;
l9_1154=l9_1155;
float4 l9_1156=float4(0.0);
l9_1156=float4(l9_1152,l9_1154,l9_1152,l9_1152);
float2 l9_1157=float2(0.0);
l9_1157=l9_1151+(l9_1156.xy*(l9_938.gTimeElapsed*(*sc_set2.UserUniforms).Port_Speed_N025));
float4 l9_1158=float4(0.0);
int l9_1159=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_1160=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1160=0;
}
else
{
l9_1160=in.varStereoViewID;
}
int l9_1161=l9_1160;
l9_1159=1-l9_1161;
}
else
{
int l9_1162=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1162=0;
}
else
{
l9_1162=in.varStereoViewID;
}
int l9_1163=l9_1162;
l9_1159=l9_1163;
}
int l9_1164=l9_1159;
int l9_1165=baseTexLayout_tmp;
int l9_1166=l9_1164;
float2 l9_1167=l9_1157;
bool l9_1168=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_1169=(*sc_set2.UserUniforms).baseTexTransform;
int2 l9_1170=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_1171=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_1172=(*sc_set2.UserUniforms).baseTexUvMinMax;
bool l9_1173=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_1174=(*sc_set2.UserUniforms).baseTexBorderColor;
float l9_1175=0.0;
bool l9_1176=l9_1173&&(!l9_1171);
float l9_1177=1.0;
float l9_1178=l9_1167.x;
int l9_1179=l9_1170.x;
if (l9_1179==1)
{
l9_1178=fract(l9_1178);
}
else
{
if (l9_1179==2)
{
float l9_1180=fract(l9_1178);
float l9_1181=l9_1178-l9_1180;
float l9_1182=step(0.25,fract(l9_1181*0.5));
l9_1178=mix(l9_1180,1.0-l9_1180,fast::clamp(l9_1182,0.0,1.0));
}
}
l9_1167.x=l9_1178;
float l9_1183=l9_1167.y;
int l9_1184=l9_1170.y;
if (l9_1184==1)
{
l9_1183=fract(l9_1183);
}
else
{
if (l9_1184==2)
{
float l9_1185=fract(l9_1183);
float l9_1186=l9_1183-l9_1185;
float l9_1187=step(0.25,fract(l9_1186*0.5));
l9_1183=mix(l9_1185,1.0-l9_1185,fast::clamp(l9_1187,0.0,1.0));
}
}
l9_1167.y=l9_1183;
if (l9_1171)
{
bool l9_1188=l9_1173;
bool l9_1189;
if (l9_1188)
{
l9_1189=l9_1170.x==3;
}
else
{
l9_1189=l9_1188;
}
float l9_1190=l9_1167.x;
float l9_1191=l9_1172.x;
float l9_1192=l9_1172.z;
bool l9_1193=l9_1189;
float l9_1194=l9_1177;
float l9_1195=fast::clamp(l9_1190,l9_1191,l9_1192);
float l9_1196=step(abs(l9_1190-l9_1195),9.9999997e-06);
l9_1194*=(l9_1196+((1.0-float(l9_1193))*(1.0-l9_1196)));
l9_1190=l9_1195;
l9_1167.x=l9_1190;
l9_1177=l9_1194;
bool l9_1197=l9_1173;
bool l9_1198;
if (l9_1197)
{
l9_1198=l9_1170.y==3;
}
else
{
l9_1198=l9_1197;
}
float l9_1199=l9_1167.y;
float l9_1200=l9_1172.y;
float l9_1201=l9_1172.w;
bool l9_1202=l9_1198;
float l9_1203=l9_1177;
float l9_1204=fast::clamp(l9_1199,l9_1200,l9_1201);
float l9_1205=step(abs(l9_1199-l9_1204),9.9999997e-06);
l9_1203*=(l9_1205+((1.0-float(l9_1202))*(1.0-l9_1205)));
l9_1199=l9_1204;
l9_1167.y=l9_1199;
l9_1177=l9_1203;
}
float2 l9_1206=l9_1167;
bool l9_1207=l9_1168;
float3x3 l9_1208=l9_1169;
if (l9_1207)
{
l9_1206=float2((l9_1208*float3(l9_1206,1.0)).xy);
}
float2 l9_1209=l9_1206;
float2 l9_1210=l9_1209;
float2 l9_1211=l9_1210;
l9_1167=l9_1211;
float l9_1212=l9_1167.x;
int l9_1213=l9_1170.x;
bool l9_1214=l9_1176;
float l9_1215=l9_1177;
if ((l9_1213==0)||(l9_1213==3))
{
float l9_1216=l9_1212;
float l9_1217=0.0;
float l9_1218=1.0;
bool l9_1219=l9_1214;
float l9_1220=l9_1215;
float l9_1221=fast::clamp(l9_1216,l9_1217,l9_1218);
float l9_1222=step(abs(l9_1216-l9_1221),9.9999997e-06);
l9_1220*=(l9_1222+((1.0-float(l9_1219))*(1.0-l9_1222)));
l9_1216=l9_1221;
l9_1212=l9_1216;
l9_1215=l9_1220;
}
l9_1167.x=l9_1212;
l9_1177=l9_1215;
float l9_1223=l9_1167.y;
int l9_1224=l9_1170.y;
bool l9_1225=l9_1176;
float l9_1226=l9_1177;
if ((l9_1224==0)||(l9_1224==3))
{
float l9_1227=l9_1223;
float l9_1228=0.0;
float l9_1229=1.0;
bool l9_1230=l9_1225;
float l9_1231=l9_1226;
float l9_1232=fast::clamp(l9_1227,l9_1228,l9_1229);
float l9_1233=step(abs(l9_1227-l9_1232),9.9999997e-06);
l9_1231*=(l9_1233+((1.0-float(l9_1230))*(1.0-l9_1233)));
l9_1227=l9_1232;
l9_1223=l9_1227;
l9_1226=l9_1231;
}
l9_1167.y=l9_1223;
l9_1177=l9_1226;
float2 l9_1234=l9_1167;
int l9_1235=l9_1165;
int l9_1236=l9_1166;
float l9_1237=l9_1175;
float2 l9_1238=l9_1234;
int l9_1239=l9_1235;
int l9_1240=l9_1236;
float3 l9_1241=float3(0.0);
if (l9_1239==0)
{
l9_1241=float3(l9_1238,0.0);
}
else
{
if (l9_1239==1)
{
l9_1241=float3(l9_1238.x,(l9_1238.y*0.5)+(0.5-(float(l9_1240)*0.5)),0.0);
}
else
{
l9_1241=float3(l9_1238,float(l9_1240));
}
}
float3 l9_1242=l9_1241;
float3 l9_1243=l9_1242;
float2 l9_1244=l9_1243.xy;
float l9_1245=l9_1237;
float4 l9_1246=sc_set2.baseTex.sample(sc_set2.baseTexSmpSC,l9_1244,bias(l9_1245));
float4 l9_1247=l9_1246;
float4 l9_1248=l9_1247;
if (l9_1173)
{
l9_1248=mix(l9_1174,l9_1248,float4(l9_1177));
}
float4 l9_1249=l9_1248;
l9_1158=l9_1249;
float l9_1250=0.0;
l9_1250=l9_1158.w;
float l9_1251=0.0;
l9_1251=l9_1250;
float4 l9_1252=float4(0.0);
int l9_1253=0;
if ((int(Tweak_N5HasSwappedViews_tmp)!=0))
{
int l9_1254=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1254=0;
}
else
{
l9_1254=in.varStereoViewID;
}
int l9_1255=l9_1254;
l9_1253=1-l9_1255;
}
else
{
int l9_1256=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1256=0;
}
else
{
l9_1256=in.varStereoViewID;
}
int l9_1257=l9_1256;
l9_1253=l9_1257;
}
int l9_1258=l9_1253;
int l9_1259=Tweak_N5Layout_tmp;
int l9_1260=l9_1258;
float2 l9_1261=l9_938.Surface_UVCoord0;
bool l9_1262=(int(SC_USE_UV_TRANSFORM_Tweak_N5_tmp)!=0);
float3x3 l9_1263=(*sc_set2.UserUniforms).Tweak_N5Transform;
int2 l9_1264=int2(SC_SOFTWARE_WRAP_MODE_U_Tweak_N5_tmp,SC_SOFTWARE_WRAP_MODE_V_Tweak_N5_tmp);
bool l9_1265=(int(SC_USE_UV_MIN_MAX_Tweak_N5_tmp)!=0);
float4 l9_1266=(*sc_set2.UserUniforms).Tweak_N5UvMinMax;
bool l9_1267=(int(SC_USE_CLAMP_TO_BORDER_Tweak_N5_tmp)!=0);
float4 l9_1268=(*sc_set2.UserUniforms).Tweak_N5BorderColor;
float l9_1269=0.0;
bool l9_1270=l9_1267&&(!l9_1265);
float l9_1271=1.0;
float l9_1272=l9_1261.x;
int l9_1273=l9_1264.x;
if (l9_1273==1)
{
l9_1272=fract(l9_1272);
}
else
{
if (l9_1273==2)
{
float l9_1274=fract(l9_1272);
float l9_1275=l9_1272-l9_1274;
float l9_1276=step(0.25,fract(l9_1275*0.5));
l9_1272=mix(l9_1274,1.0-l9_1274,fast::clamp(l9_1276,0.0,1.0));
}
}
l9_1261.x=l9_1272;
float l9_1277=l9_1261.y;
int l9_1278=l9_1264.y;
if (l9_1278==1)
{
l9_1277=fract(l9_1277);
}
else
{
if (l9_1278==2)
{
float l9_1279=fract(l9_1277);
float l9_1280=l9_1277-l9_1279;
float l9_1281=step(0.25,fract(l9_1280*0.5));
l9_1277=mix(l9_1279,1.0-l9_1279,fast::clamp(l9_1281,0.0,1.0));
}
}
l9_1261.y=l9_1277;
if (l9_1265)
{
bool l9_1282=l9_1267;
bool l9_1283;
if (l9_1282)
{
l9_1283=l9_1264.x==3;
}
else
{
l9_1283=l9_1282;
}
float l9_1284=l9_1261.x;
float l9_1285=l9_1266.x;
float l9_1286=l9_1266.z;
bool l9_1287=l9_1283;
float l9_1288=l9_1271;
float l9_1289=fast::clamp(l9_1284,l9_1285,l9_1286);
float l9_1290=step(abs(l9_1284-l9_1289),9.9999997e-06);
l9_1288*=(l9_1290+((1.0-float(l9_1287))*(1.0-l9_1290)));
l9_1284=l9_1289;
l9_1261.x=l9_1284;
l9_1271=l9_1288;
bool l9_1291=l9_1267;
bool l9_1292;
if (l9_1291)
{
l9_1292=l9_1264.y==3;
}
else
{
l9_1292=l9_1291;
}
float l9_1293=l9_1261.y;
float l9_1294=l9_1266.y;
float l9_1295=l9_1266.w;
bool l9_1296=l9_1292;
float l9_1297=l9_1271;
float l9_1298=fast::clamp(l9_1293,l9_1294,l9_1295);
float l9_1299=step(abs(l9_1293-l9_1298),9.9999997e-06);
l9_1297*=(l9_1299+((1.0-float(l9_1296))*(1.0-l9_1299)));
l9_1293=l9_1298;
l9_1261.y=l9_1293;
l9_1271=l9_1297;
}
float2 l9_1300=l9_1261;
bool l9_1301=l9_1262;
float3x3 l9_1302=l9_1263;
if (l9_1301)
{
l9_1300=float2((l9_1302*float3(l9_1300,1.0)).xy);
}
float2 l9_1303=l9_1300;
float2 l9_1304=l9_1303;
float2 l9_1305=l9_1304;
l9_1261=l9_1305;
float l9_1306=l9_1261.x;
int l9_1307=l9_1264.x;
bool l9_1308=l9_1270;
float l9_1309=l9_1271;
if ((l9_1307==0)||(l9_1307==3))
{
float l9_1310=l9_1306;
float l9_1311=0.0;
float l9_1312=1.0;
bool l9_1313=l9_1308;
float l9_1314=l9_1309;
float l9_1315=fast::clamp(l9_1310,l9_1311,l9_1312);
float l9_1316=step(abs(l9_1310-l9_1315),9.9999997e-06);
l9_1314*=(l9_1316+((1.0-float(l9_1313))*(1.0-l9_1316)));
l9_1310=l9_1315;
l9_1306=l9_1310;
l9_1309=l9_1314;
}
l9_1261.x=l9_1306;
l9_1271=l9_1309;
float l9_1317=l9_1261.y;
int l9_1318=l9_1264.y;
bool l9_1319=l9_1270;
float l9_1320=l9_1271;
if ((l9_1318==0)||(l9_1318==3))
{
float l9_1321=l9_1317;
float l9_1322=0.0;
float l9_1323=1.0;
bool l9_1324=l9_1319;
float l9_1325=l9_1320;
float l9_1326=fast::clamp(l9_1321,l9_1322,l9_1323);
float l9_1327=step(abs(l9_1321-l9_1326),9.9999997e-06);
l9_1325*=(l9_1327+((1.0-float(l9_1324))*(1.0-l9_1327)));
l9_1321=l9_1326;
l9_1317=l9_1321;
l9_1320=l9_1325;
}
l9_1261.y=l9_1317;
l9_1271=l9_1320;
float2 l9_1328=l9_1261;
int l9_1329=l9_1259;
int l9_1330=l9_1260;
float l9_1331=l9_1269;
float2 l9_1332=l9_1328;
int l9_1333=l9_1329;
int l9_1334=l9_1330;
float3 l9_1335=float3(0.0);
if (l9_1333==0)
{
l9_1335=float3(l9_1332,0.0);
}
else
{
if (l9_1333==1)
{
l9_1335=float3(l9_1332.x,(l9_1332.y*0.5)+(0.5-(float(l9_1334)*0.5)),0.0);
}
else
{
l9_1335=float3(l9_1332,float(l9_1334));
}
}
float3 l9_1336=l9_1335;
float3 l9_1337=l9_1336;
float2 l9_1338=l9_1337.xy;
float l9_1339=l9_1331;
float4 l9_1340=sc_set2.Tweak_N5.sample(sc_set2.Tweak_N5SmpSC,l9_1338,bias(l9_1339));
float4 l9_1341=l9_1340;
float4 l9_1342=l9_1341;
if (l9_1267)
{
l9_1342=mix(l9_1268,l9_1342,float4(l9_1271));
}
float4 l9_1343=l9_1342;
l9_1252=l9_1343;
float4 l9_1344=float4(0.0);
l9_1344=l9_1252;
float l9_1345=0.0;
float4 l9_1346=l9_1344;
float l9_1347=l9_1346.z;
l9_1345=l9_1347;
float l9_1348=0.0;
l9_1348=l9_1251*l9_1345;
l9_937=l9_1348;
l9_1144=l9_937;
}
l9_934=l9_1144;
param_22=l9_934;
param_24=param_22;
}
else
{
param_24=param_23;
}
Result_N52=param_24;
float Output_N65=0.0;
Output_N65=(Result_N37+Result_N39)+Result_N52;
float Export_N30=0.0;
Export_N30=Output_N65;
float4 Output1_N11=float4(0.0);
Output1_N11=float4(Output_N7.xyz,Export_N30);
FinalColor=Output1_N11;
float param_26=FinalColor.w;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (param_26<(*sc_set2.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_1349=gl_FragCoord;
float2 l9_1350=floor(mod(l9_1349.xy,float2(4.0)));
float l9_1351=(mod(dot(l9_1350,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (param_26<l9_1351)
{
discard_fragment();
}
}
bool l9_1352=(*sc_set2.UserUniforms).isProxyMode!=0;
if (l9_1352)
{
float4 param_27=FinalColor;
if ((int(sc_ProxyAlphaOne_tmp)!=0))
{
param_27.w=1.0;
}
float4 l9_1353=fast::max(param_27,float4(0.0));
float4 param_28=l9_1353;
out.FragColor0=param_28;
return out;
}
float4 param_29=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_1354=param_29;
float4 l9_1355=l9_1354;
float l9_1356=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_1356=l9_1355.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_1356=fast::clamp(l9_1355.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_1356=fast::clamp(dot(l9_1355.xyz,float3(l9_1355.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_1356=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_1356=(1.0-dot(l9_1355.xyz,float3(0.33333001)))*l9_1355.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_1356=(1.0-fast::clamp(dot(l9_1355.xyz,float3(1.0)),0.0,1.0))*l9_1355.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_1356=fast::clamp(dot(l9_1355.xyz,float3(1.0)),0.0,1.0)*l9_1355.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_1356=fast::clamp(dot(l9_1355.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_1356=fast::clamp(dot(l9_1355.xyz,float3(1.0)),0.0,1.0)*l9_1355.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_1356=dot(l9_1355.xyz,float3(0.33333001))*l9_1355.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_1356=1.0-fast::clamp(dot(l9_1355.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_1356=fast::clamp(dot(l9_1355.xyz,float3(1.0)),0.0,1.0);
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
float l9_1357=l9_1356;
float l9_1358=l9_1357;
float l9_1359=(*sc_set2.UserUniforms).sc_ShadowDensity*l9_1358;
float3 l9_1360=mix((*sc_set2.UserUniforms).sc_ShadowColor.xyz,(*sc_set2.UserUniforms).sc_ShadowColor.xyz*l9_1354.xyz,float3((*sc_set2.UserUniforms).sc_ShadowColor.w));
float4 l9_1361=float4(l9_1360.x,l9_1360.y,l9_1360.z,l9_1359);
param_29=l9_1361;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_29=float4(param_29.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_1362=param_29;
float4 l9_1363=float4(0.0);
float4 l9_1364=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_1365=out.FragColor0;
float4 l9_1366=l9_1365;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_1366.x+=(*sc_set2.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_1367=l9_1366;
l9_1364=l9_1367;
}
else
{
float4 l9_1368=gl_FragCoord;
float2 l9_1369=(l9_1368.xy*(*sc_set2.UserUniforms).sc_WindowToViewportTransform.xy)+(*sc_set2.UserUniforms).sc_WindowToViewportTransform.zw;
float2 l9_1370=l9_1369;
float2 l9_1371=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_1372=1;
int l9_1373=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1373=0;
}
else
{
l9_1373=in.varStereoViewID;
}
int l9_1374=l9_1373;
int l9_1375=l9_1374;
float3 l9_1376=float3(l9_1370,0.0);
int l9_1377=l9_1372;
int l9_1378=l9_1375;
if (l9_1377==1)
{
l9_1376.y=((2.0*l9_1376.y)+float(l9_1378))-1.0;
}
float2 l9_1379=l9_1376.xy;
l9_1371=l9_1379;
}
else
{
l9_1371=l9_1370;
}
float2 l9_1380=l9_1371;
float2 l9_1381=l9_1380;
float2 l9_1382=l9_1381;
int l9_1383=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_1384=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1384=0;
}
else
{
l9_1384=in.varStereoViewID;
}
int l9_1385=l9_1384;
l9_1383=1-l9_1385;
}
else
{
int l9_1386=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1386=0;
}
else
{
l9_1386=in.varStereoViewID;
}
int l9_1387=l9_1386;
l9_1383=l9_1387;
}
int l9_1388=l9_1383;
float2 l9_1389=l9_1382;
int l9_1390=l9_1388;
float2 l9_1391=l9_1389;
int l9_1392=l9_1390;
float l9_1393=0.0;
float4 l9_1394=float4(0.0);
float2 l9_1395=l9_1391;
int l9_1396=sc_ScreenTextureLayout_tmp;
int l9_1397=l9_1392;
float l9_1398=l9_1393;
float2 l9_1399=l9_1395;
int l9_1400=l9_1396;
int l9_1401=l9_1397;
float3 l9_1402=float3(0.0);
if (l9_1400==0)
{
l9_1402=float3(l9_1399,0.0);
}
else
{
if (l9_1400==1)
{
l9_1402=float3(l9_1399.x,(l9_1399.y*0.5)+(0.5-(float(l9_1401)*0.5)),0.0);
}
else
{
l9_1402=float3(l9_1399,float(l9_1401));
}
}
float3 l9_1403=l9_1402;
float3 l9_1404=l9_1403;
float2 l9_1405=l9_1404.xy;
float l9_1406=l9_1398;
float4 l9_1407=sc_set2.sc_ScreenTexture.sample(sc_set2.sc_ScreenTextureSmpSC,l9_1405,bias(l9_1406));
float4 l9_1408=l9_1407;
l9_1394=l9_1408;
float4 l9_1409=l9_1394;
float4 l9_1410=l9_1409;
float4 l9_1411=l9_1410;
l9_1364=l9_1411;
}
float4 l9_1412=l9_1364;
float4 l9_1413=l9_1412;
float3 l9_1414=l9_1413.xyz;
float3 l9_1415=l9_1414;
float3 l9_1416=l9_1362.xyz;
float3 l9_1417=definedBlend(l9_1415,l9_1416,in.varStereoViewID,(*sc_set2.UserUniforms),sc_set2.intensityTexture,sc_set2.intensityTextureSmpSC);
l9_1363=float4(l9_1417.x,l9_1417.y,l9_1417.z,l9_1363.w);
float3 l9_1418=mix(l9_1414,l9_1363.xyz,float3(l9_1362.w));
l9_1363=float4(l9_1418.x,l9_1418.y,l9_1418.z,l9_1363.w);
l9_1363.w=1.0;
float4 l9_1419=l9_1363;
param_29=l9_1419;
}
else
{
float4 l9_1420=param_29;
float4 l9_1421=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_1421=float4(mix(float3(1.0),l9_1420.xyz,float3(l9_1420.w)),l9_1420.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_1422=l9_1420.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_1422=fast::clamp(l9_1422,0.0,1.0);
}
l9_1421=float4(l9_1420.xyz*l9_1422,l9_1422);
}
else
{
l9_1421=l9_1420;
}
}
float4 l9_1423=l9_1421;
param_29=l9_1423;
}
}
}
float4 l9_1424=param_29;
FinalColor=l9_1424;
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
float4 l9_1425=float4(0.0);
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_1425=float4((*sc_set2.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_1425=float4(0.0);
}
float4 l9_1426=l9_1425;
float4 Cost=l9_1426;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float3 param_30=in.varPos;
float4 param_31=FinalColor;
FinalColor=outputMotionVectorsIfNeeded(param_30,param_31,in.varStereoViewID,(*sc_set2.UserUniforms));
float4 param_32=FinalColor;
float4 l9_1427=param_32;
out.FragColor0=l9_1427;
return out;
}
} // FRAGMENT SHADER
