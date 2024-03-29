package com.example.csws.service.instance;

import com.example.csws.common.shRunner.ParserResponseDto;
import com.example.csws.entity.instance.InstanceDto;

import java.util.List;

public interface InstanceService {
    public int findMyInstanceId(Long userId, Long lectureId);
    public String createInstance(InstanceDto instanceDto, String username);
    public InstanceDto findById(int instanceId);
    public List<InstanceDto> findAllByLectureId(Long lectureId);
    public String startInstance(int instanceId, String username);
    public String stopInstance(int instanceId, String username);
    public String restartInstance(int instanceId, String username);
    public String deleteInstance(int instanceId, String username);
    public String createKeyPair(String hostName, String keyPairName);
    public ParserResponseDto checkContainerResource(String hostName, String hostIp, String containerName);
    public ParserResponseDto checkServerResource(String hostName, String hostIp);
}
