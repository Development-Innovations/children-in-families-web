describe User, 'associations' do
  it { is_expected.to belong_to(:province)}
  it { is_expected.to belong_to(:department)}
  it { is_expected.to have_many(:cases)}
  it { is_expected.to have_many(:clients)}
end

describe User, 'validations' do
  it { is_expected.to validate_presence_of(:roles) }
end

describe User, 'scopes' do
  let(:department) { create(:department) }
  let(:province) { create(:province) }

  let!(:user){ create(:user,
    first_name: 'Example First Name',
    last_name: 'Example Last Name',
    mobile: '+1234567890',
    job_title: 'Developer',
    department: department,
    roles: 'admin',
    province: province
  ) }
  let!(:other_user){ create(:user, department: department, province: province) }

  context 'first name like' do
    subject{ User.first_name_like(user.first_name.downcase) }
    it 'should include first name like' do
      is_expected.to include(user)
    end
    it 'should not include not first name like' do
      is_expected.not_to include(other_user)
    end
  end

  context 'last name like' do
    subject{ User.last_name_like(user.last_name.downcase) }
    it 'should include last name like' do
      is_expected.to include(user)
    end
    it 'should not include not last name like' do
      is_expected.not_to include(other_user)
    end
  end

  context 'mobile like' do
    subject{ User.mobile_like(user.mobile) }
    it 'should include mobile like' do
      is_expected.to include(user)
    end
    it 'should not include not mobile like' do
      is_expected.not_to include(other_user)
    end
  end

  context 'email like' do
    subject{ User.email_like(user.email) }
    it 'should include email like' do
      is_expected.to include(user)
    end
    it 'should not include not email like' do
      is_expected.not_to include(other_user)
    end
  end

  context 'job title is' do
    subject{ User.job_title_is }

    it 'should include job title' do
      is_expected.to include('Developer')
    end
  end

  context 'department is' do
    subject{ User.department_is }

    it 'should include department' do
      department_array = [department.name, department.id]
      is_expected.to include(department_array)
    end
  end

  context 'case workers' do
    subject{ User.case_workers }

    it 'should include case worker role' do
      is_expected.to include(other_user)
    end
  end

  context 'admins' do
    subject{ User.admins }

    it 'should include admin role' do
      is_expected.to include(user)
    end
  end

  context 'province is' do
    subject{ User.province_is }

    it 'should include province' do
      province_array = [province.name, province.id]
      is_expected.to include(province_array)
    end
  end

  context 'has clients' do
    let!(:client) { create(:client, user: other_user) }
    subject { User.has_clients }

    it 'should include user that has clients' do
      is_expected.to include(other_user)
    end
  end
end


describe User, 'methods' do
  let!(:admin){ create(:user, roles: 'admin') }
  let!(:case_worker){ create(:user, roles: 'case worker', first_name: 'First Name', last_name: 'Last Name') }
  context 'name' do
    it{ expect(case_worker.name).to eq('First Name Last Name') }
  end

  context 'admin?' do
    it{ expect(admin.admin?).to be_truthy }
    it{ expect(case_worker.admin?).to be_falsey }
  end

  context 'case_worker?' do
    it{ expect(case_worker.case_worker?).to be_truthy }
    it{ expect(admin.case_worker?).to be_falsey }
  end
end
