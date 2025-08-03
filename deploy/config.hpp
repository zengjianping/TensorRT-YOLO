/**
 * @file config.hpp
 * @author laugh12321 (laugh12321@vip.qq.com)
 * @brief 定义图像预处理配置和推理选项配置的结构体
 * @date 2025-01-09
 *
 * @copyright Copyright (c) 2025 laugh12321. All Rights Reserved.
 *
 */

#pragma once

#include <cassert>
#include <optional>
#include <vector>
#include <vector_functions.hpp>

#include "deploy/core/macro.hpp"

namespace deploy {

/**
 * @brief 图像预处理配置结构体
 *
 */
struct ProcessConfig {
    bool   swap_rb      = false;                                                  // < 是否交换 R 和 B 通道
    float  border_value = 114.0f;                                                 // < 边界值，用于填充
    float3 alpha        = make_float3(1.0 / 255.0f, 1.0 / 255.0f, 1.0 / 255.0f);  // < 归一化系数
    float3 beta         = make_float3(0.0f, 0.0f, 0.0f);                          // < 偏移量
    bool   scale_coord  = false;                                                  // < 模型输出的归一化坐标，需要缩放到图像坐标

    void enableScaleCoord() {
        scale_coord = true;
    }

    /**
     * @brief 设置图像通道交换
     *
     * @param swap_rb
     */
    void enableSwapRB() {
        this->swap_rb = true;
    }

    /**
     * @brief 设置边界值
     *
     * @param border_value
     */
    void setBorderValue(float border_value) {
        this->border_value = border_value;
    }

    /**
     * @brief 设置归一化参数
     *
     * @param mean
     * @param std
     */
    void setNormalizeParams(const std::vector<float>& mean, const std::vector<float>& std) {
        assert(mean.size() == 3 && std.size() == 3 && "ProcessConfig: requires the size of mean and std to be 3.");

        alpha.x = 1.0 / 255.0f / std[0];
        alpha.y = 1.0 / 255.0f / std[1];
        alpha.z = 1.0 / 255.0f / std[2];
        beta.x  = -mean[0] / std[0];
        beta.y  = -mean[1] / std[1];
        beta.z  = -mean[2] / std[2];
    }
};

}  // namespace deploy
