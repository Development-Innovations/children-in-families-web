describe 'Task' do
  let!(:user){ create(:user) }
  let!(:client){ create(:client, user: user) }
  let!(:domain){ create(:domain) }
  let!(:overdue_task){ create(:task, client: client, completion_date: Date.today - 6.month) }
  let!(:today_task){ create(:task, client: client, completion_date: Date.today) }
  let!(:upcoming_task){ create(:task, client: client, completion_date: Date.today + 6.month) }
  let!(:incomplete_task){ create(:task, completed: false) }
  before do
    login_as(user)
  end
  feature 'List' do
    before do
      visit client_tasks_path(client)
    end
    scenario 'overdue task' do
      panel = page.all(:css, '.panel').select { |p| p.all(:css, '.panel-heading').select { |pp| pp.text.include?('Overdue Tasks') }.first }.first
      expect(panel).to have_content(overdue_task.name)
      expect(panel).to have_content(overdue_task.domain.name)
      expect(panel).to have_content(overdue_task.completion_date.strftime("%B %d, %Y"))
    end
    scenario 'today task' do
      panel = page.all(:css, '.panel').select { |p| p.all(:css, '.panel-heading').select { |pp| pp.text.include?('Todays Tasks') }.first }.first
      expect(panel).to have_content(today_task.name)
      expect(panel).to have_content(today_task.domain.name)
      expect(panel).to have_content(today_task.completion_date.strftime("%B %d, %Y"))
    end
    scenario 'upcoming task' do
      panel = page.all(:css, '.panel').select { |p| p.all(:css, '.panel-heading').select { |pp| pp.text.include?('Upcoming Tasks') }.first }.first
      expect(panel).to have_content(upcoming_task.name)
      expect(panel).to have_content(upcoming_task.domain.name)
      expect(panel).to have_content(upcoming_task.completion_date.strftime("%B %d, %Y"))
    end
    scenario 'edit link' do
      expect(page).to have_link(nil, href: edit_client_task_path(client, overdue_task))
      expect(page).to have_link(nil, href: edit_client_task_path(client, today_task))
      expect(page).to have_link(nil, href: edit_client_task_path(client, upcoming_task))
    end
    scenario 'delete link' do
      expect(page).to have_css("a[href='#{client_task_path(client, overdue_task)}'][data-method='delete']")
      expect(page).to have_css("a[href='#{client_task_path(client, today_task)}'][data-method='delete']")
      expect(page).to have_css("a[href='#{client_task_path(client, upcoming_task)}'][data-method='delete']")
    end

    scenario 'new link' do
      expect(page).to have_link('New Task', href: new_client_task_path(client))
    end

    scenario 'no incomplete task' do
      expect(page).not_to have_content(incomplete_task)
    end
  end
  feature 'Create' do
    before do
      visit new_client_task_path(client)
    end
    scenario 'valid' do
      select domain.name, from: 'Domain'
      fill_in 'Enter task details', with: FFaker::Name.name
      fill_in 'Completion Date', with: Date.today.strftime('%B %d, %Y')
      click_button 'Save'
      expect(page).to have_content('Task has successfully been created')
    end
    scenario 'invalid' do
      click_button 'Save'
      expect(page).to have_content("Please review the problems below")
    end
  end

  feature 'Update' do
    before do
      visit edit_client_task_path(client, upcoming_task)
    end
    scenario 'valid' do
      fill_in 'Enter task details', with: FFaker::Name.name
      click_button 'Save'
      expect(page).to have_content('Task has successfully been updated')
    end
    scenario 'invalid' do
      fill_in 'Enter task details', with: ''
      click_button 'Save'
      expect(page).to have_content("Please review the problems below")
    end
  end

  feature 'Delete' do
    before do
      visit client_tasks_path(client)
    end
    scenario 'successful' do
      find("a[href='#{client_task_path(client, overdue_task)}'][data-method='delete']").click
      expect(page).to have_content('Task has successfully been deleted')
    end
  end
end
