package kr.pandorabox.aniwalk.chat;

import java.util.List;
import java.util.Map;

//imports as static

import static org.springframework.data.mongodb.core.aggregation.Aggregation.match;
import static org.springframework.data.mongodb.core.aggregation.Aggregation.sort;
import static org.springframework.data.mongodb.core.aggregation.Aggregation.newAggregation;

import org.springframework.data.mongodb.core.aggregation.Aggregation;
import org.springframework.data.mongodb.core.aggregation.AggregationResults;
import org.springframework.data.domain.Sort;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class ChatDAOImpl implements ChatDAO{
	@Autowired
	MongoTemplate mongoTemplate;
	///워커///
	@Override
	public List<ChatDTO> walkerChatList(Map<String, Object> walkerChatList) {
		Query query = new Query(new Criteria().andOperator(
				Criteria.where("walker_id").is(walkerChatList.get("walker_id"))
				));
		//query.with(new Sort(Sort.Direction.DESC,"walker_id"));
		query.with(new Sort(Sort.Direction.DESC,"mem_nickname")
				.and(new Sort(Sort.Direction.DESC,"_id")));
		List<ChatDTO> docs = mongoTemplate.find(query, ChatDTO.class,"chat");
		return docs;
	}
	
	@Override
	public List<ChatDTO> walkerChatFind(Map<String, Object> searchCondition) {
		Query query = new Query(new Criteria().andOperator(
				Criteria.where("mem_nickname").is(searchCondition.get("mem_nickname")),
				Criteria.where("walker_id").is(searchCondition.get("walker_id"))));
		List<ChatDTO> docs = mongoTemplate.find(query, ChatDTO.class,"chat");
		return docs;
	}
	
	
	///오너////
	@Override
	public void chatInsert(Map<String, Object> chat) {
		mongoTemplate.insert(chat,"chat");
	}
	
	@Override
	public List<ChatDTO> chatFind(Map<String, Object> searchCondition) {
		Query query = new Query(new Criteria().andOperator(
				Criteria.where("mem_nickname").is(searchCondition.get("mem_nickname")),
				Criteria.where("walker_id").is(searchCondition.get("walker_id"))));
		List<ChatDTO> docs = mongoTemplate.find(query, ChatDTO.class,"chat");
		return docs;
	}
	@Override
	public List<ChatDTO> chatList(Map<String, Object> chatList) {
		
		//Aggregation agg = newAggregation(
		//		match(Criteria.where("mem_nickname").is(chatList.get("mem_nickname"))),
				//sort(Sort.Direction.DESC, "walker_id"),
		//		sort(Sort.Direction.DESC, "chat_date")
		//	);
		//List<ChatDTO> result = mongoTemplate.aggregate(agg,"chat",ChatDTO.class).getMappedResults();
		
		Query query = new Query(new Criteria().andOperator(
				Criteria.where("mem_nickname").is(chatList.get("mem_nickname"))
				));
		//query.with(new Sort(Sort.Direction.DESC,"walker_id"));
		query.with(new Sort(Sort.Direction.DESC,"walker_id")
				.and(new Sort(Sort.Direction.DESC,"_id")));
		List<ChatDTO> docs = mongoTemplate.find(query, ChatDTO.class,"chat");
		return docs;
	}
}
