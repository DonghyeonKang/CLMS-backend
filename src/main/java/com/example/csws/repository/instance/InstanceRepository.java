package com.example.csws.repository.instance;

import com.example.csws.entity.instance.Instance;
import java.util.List;
import java.util.Optional;

public interface InstanceRepository {


    public Optional<Integer> findIdByUserIdAndLectureId(Long userid, Long lectureId);

    public Instance save(Instance instance);

    public Optional<Instance> findById(int instanceId);

    public Instance getReferenceById(int instanceId);

    public List<Instance> findAllByUserId(Long userId);

    public List<Instance> findAllByLectureId(Long lectureId);

    public void deleteById(int instanceId);
}
