package com.hrsystem.mapper;

import com.hrsystem.pojo.Position;
import java.util.List;

public interface PositionMapper {

    List<Position> getPositionsByCid(Integer cid);

    String getPositionNameById(Integer positionId);
}