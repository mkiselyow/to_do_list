# describe ProjectsController do
#   let(:project_params) { FactoryBot.attributes_for(:project).stringify_keys }
#   let(:project) { FactoryBot.build_stubbed(:project) }
#   let(:user) { FactoryBot.create(:user) }

#   describe 'POST #create' do
#     before do
#       allow(Project).to receive(:find).and_return post
#     end

#     it 'receives find and return post' do
#       expect(Post).to receive(:find).with(post.id.to_s)
#       get :show, id: post.id
#     end

#     it 'assigns @post' do
#       get :show, id: post.id
#       expect(assigns(:post)).not_to be_nil
#     end

#     it 'renders :show template' do
#       get :show, id: post.id
#       expect(response).to render_template :show
#     end
#   end

#   describe 'PUT #update' do
#     context 'without ability to update' do
#       before do
#         allow(user).to receive_message_chain(:posts, :find).and_return nil
#         allow(controller).to receive(:current_user).and_return user
#         put :update, id: post.id, post: post_params
#       end

#       it 'redirects to root page' do
#         expect(response).to redirect_to(root_path)
#       end

#       it 'sends notice' do
#         expect(flash[:notice]).to eq 'Not authorized user.'
#       end
#     end

#     context 'with valid attributes' do
#       before do
#         allow(post).to receive(:update).and_return true
#         allow(user).to receive_message_chain(:posts, :find).and_return post
#         allow(controller).to receive(:current_user).and_return user
#       end

#       it 'assigns @post' do
#         put :update, id: post.id, post: post_params
#         expect(assigns(:post)).not_to be_nil
#       end

#       it 'receives update for @post' do
#         expect(post).to receive(:update).with(post_params)
#         put :update, id: post.id, post: post_params
#       end

#       it 'sends success notice' do
#         put :update, id: post.id, post: post_params
#         expect(flash[:notice]).to eq 'Post was successfully updated.'
#       end

#       it 'redirects to post page' do
#         put :update, id: post.id, post: post_params
#         expect(response).to redirect_to post
#       end
#     end

#     context 'with forbidden attributes' do
#       before do
#         allow(post).to receive(:update).and_return true
#         allow(user).to receive_message_chain(:posts, :find).and_return post
#         allow(controller).to receive(:current_user).and_return user
#       end

#       it 'generates ParameterMissing error without post params' do
#         expect { put :update, id: post.id }.to raise_error(ActionController::ParameterMissing)
#       end

#       it 'filters forbidden params' do
#         expect(post).to receive(:update).with(post_params)
#         put :update, id: post.id, post: post_params.merge(user_id: 1)
#       end
#     end

#     context 'with invalid attributes' do
#       before do
#         allow(post).to receive(:update).and_return false
#         allow(user).to receive_message_chain(:posts, :find).and_return post
#         allow(controller).to receive(:current_user).and_return user
#       end

#       it 'sends error flash' do
#         put :update, id: post.id, post: post_params
#         expect(flash[:error]).to eq 'Could not save post.'
#       end

#       it 'renders :edit template' do
#         put :update, id: post.id, post: post_params
#         expect(response).to render_template :edit
#       end
#     end
#   end
# end