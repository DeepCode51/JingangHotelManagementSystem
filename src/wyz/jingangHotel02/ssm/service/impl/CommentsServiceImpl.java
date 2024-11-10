package wyz.jingangHotel02.ssm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import wyz.jingangHotel02.ssm.autoMapper.CommentsMapper;
import wyz.jingangHotel02.ssm.autoPo.CommentsExample;
import wyz.jingangHotel02.ssm.autoPo.CommentsExample.Criteria;
import wyz.jingangHotel02.ssm.autoPo.CommentsWithBLOBs;

public class CommentsServiceImpl implements CommentsService{

	@Autowired
	private CommentsMapper commentsMapper;
	
	@Override
	public List<CommentsWithBLOBs> findTotalComments() {
		CommentsExample example = new CommentsExample();
		return commentsMapper.selectByExampleWithBLOBs(example);
	}

	@Override
	public int insertComment(CommentsWithBLOBs comment) {
		return commentsMapper.insertSelective(comment);
	}

	@Override
	public int countCommentsByStatus(String status) {
		CommentsExample example = new CommentsExample();
		if (status.equals("0")) {
			return commentsMapper.countByExample(example);
		}
		Criteria criteria = example.createCriteria();
		criteria.andStatusEqualTo(status);
		return commentsMapper.countByExample(example);
	}

	@Override
	public List<CommentsWithBLOBs> selectCommentsByStatus(String status,
			int begin, int pageSize) {
		CommentsExample example = new CommentsExample();
		example.setOrderByClause("id limit "+begin+","+pageSize);
		if (status.equals("0")) {
			return commentsMapper.selectByExampleWithBLOBs(example);
		}
		Criteria criteria = example.createCriteria();
		criteria.andStatusEqualTo(status);
		return commentsMapper.selectByExampleWithBLOBs(example);
	}

	@Override
	public void updateComment(CommentsWithBLOBs commentsWithBLOBs) {
		commentsMapper.updateByPrimaryKeySelective(commentsWithBLOBs);
	}

}
