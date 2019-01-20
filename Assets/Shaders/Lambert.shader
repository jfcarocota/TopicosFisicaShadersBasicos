﻿Shader "Custom/Lambert"
{
	Properties
	{
		_MainTex("Albedo", 2D) = "white" {}

	}

	SubShader
	{
		

		CGPROGRAM

		#pragma surface surf Lambert

		sampler2D _MainTex;

		struct Input
		{
			float2 uv_MainTex;
		};

		void surf(Input IN, inout SurfaceOutput o)
		{
			o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
		}

		ENDCG
	}

}
